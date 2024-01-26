#include <iostream>
#include <curl/curl.h>
#include <string>
#include <nlohmann/json.hpp>
#include <algorithm> //replace()
#include <ctime>
#include <fstream>

using namespace std;
using json = nlohmann::json;

string dt() {
    time_t now = time(0);
    tm *ltm = localtime(&now);
    ostringstream oss;
    oss << ltm->tm_mday << "/"
        << setfill('0') << setw(2) << 1 + ltm->tm_mon << "/"
        << setfill('0') << setw(4) << 1900 + ltm->tm_year;
    return oss.str();
}

string lerArquivo() {
    fstream arquivo;
    string apiKey;
    arquivo.open("apiKey.txt", ios::in);
    if (arquivo.is_open()) {
        getline(arquivo, apiKey);
    } else {
        cout << "Não foi possível abrir o arquivo apiKey.txt" << endl;
    }
    arquivo.close();

    return apiKey;
}

static size_t WriteCallback(void *contents, size_t size, size_t nmemb, string *s) {
    size_t newLength = size * nmemb;
    try {
        s->append((char*)contents, newLength);
        return newLength;
    } catch(std::bad_alloc &e) {
        return 0;
    }
}

int main() {
    CURL *curl;
    CURLcode res;
    string readBuffer;
    string cidade;
    string apiKey = lerArquivo();

    cout << "Digite o nome da cidade (Sem acentos)" << endl;
    getline(cin, cidade);

    if (!cidade.empty()) {
        cidade[0] = toupper(cidade[0]);
    }

    replace(cidade.begin(), cidade.end(), ' ', '+');

    curl = curl_easy_init();
    if(curl) {
        ostringstream urlStream;
        urlStream << "http://api.openweathermap.org/data/2.5/weather?lang=pt_br" << "&units=metric&q=" << cidade << "&appid=" << apiKey;
        string url = urlStream.str();
        curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);

        res = curl_easy_perform(curl);
        if(res != CURLE_OK) {
            cerr << "curl_easy_perform() falhou: " << curl_easy_strerror(res) << endl;
        }
        curl_easy_cleanup(curl);

        replace(cidade.begin(), cidade.end(), '+', ' ');

        try {
            json json_objeto = json::parse(readBuffer);

            double temperatura = json_objeto["main"]["temp"];
            string descricao_tempo = json_objeto["weather"][0]["description"];

            system("clear");
            cout << "████████████████████████████████████████████████" << endl;
            cout << "███  World Weather Monitoring - OpenWeather  ███" << endl;
            cout << "████████████████████████████████████████████████" << endl;
            cout << endl;
            cout << "# Temperatura em " << cidade << ": " << round(temperatura) << "°C" << endl;
            cout << "# Descrição do tempo: " << descricao_tempo << endl;
            cout << "# Data do monitoramento: " << dt() << endl;
            cout << "-------------------------------------------------" << endl << endl;

        } catch (json::parse_error &e) {
            cerr << "Erro ao analisar JSON: " << e.what() << endl;
        }
    }

    return 0;
}

