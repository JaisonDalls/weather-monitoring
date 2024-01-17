# weather-monitoring

A monitoring platform for weather using a weather API and implements into application desktop.
Este projeto é uma aplicação em C++ que usa a API OpenWeather para monitorar o tempo em qualquer cidade do mundo. O usuário insere o nome de uma cidade, e a aplicação retorna a temperatura atual e a descrição do tempo.

## 🚀 Initial Proposal

Com a influência do aquecimento global estima-se que ao menos 12% das geleiras do Ártico, desaparecerão em menos de 30 anos.
Com isso, construa um algoritmo que monitore a temperatura do ar e gere um alerta o pico máximo e o mínimo dentro de um determinado período.

## Recursos
- Busca de informações climáticas de qualquer cidade.
- Utiliza a API OpenWeather.
- Retorna a temperatura atual e a descrição do tempo.
- Formata a saída de dados para uma melhor visualização.

## Dependências
- [libcurl](https://curl.se/libcurl/)
- [nlohmann/json](https://github.com/nlohmann/json)
 
## Configuração
Antes de executar o programa, é necessário configurar a chave de API do OpenWeather. A chave deve ser armazenada em um arquivo chamado `apiKey.txt` na mesma pasta do executável.

## Compilação e Execução
Para compilar este projeto, você precisa ter as bibliotecas libcurl e nlohmann/json instaladas. 

Use o seguinte comando para compilar:
```
g++ main.cpp -o weatherApp -lcurl
```

Para executar o programa:
```
./weatherApp
```

## Como Usar
1. Execute o programa.
2. Quando solicitado, digite o nome da cidade (sem acentos) e pressione Enter.
3. O programa exibirá a temperatura atual e a descrição do tempo.

## Licença
Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Autores
- [Jaison Dallabrida](https://github.com/JaisonDalls)
- [Rafael Acrane](https://github.com/acranerafael)

