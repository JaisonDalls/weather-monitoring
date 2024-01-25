# Weather Monitoring [Ver.1.0]
Este projeto é uma aplicação em C++ que usa a API OpenWeather para monitorar o tempo em qualquer cidade do mundo. O usuário insere o nome de uma cidade, e a aplicação retorna a temperatura atual e a descrição do tempo.

## Ⅰ - Versão 1.0: Monitoramento Climático Urbano

A primeira versão do projeto foca no monitoramento climático urbano, armazenando dados de temperatura das cidades para análises históricas. O objetivo principal é desenvolver um algoritmo que monitora condições climáticas em áreas urbanas, gera alertas de temperaturas extremas, e contribui para a conscientização sobre as mudanças climáticas e suas implicações nas cidades. Além disso, o projeto visa fornecer dados valiosos para pesquisas relacionadas ao clima.

## Ⅱ - Versão 2.0: Monitoramento Climático Global
A segunda versão amplia o escopo para um monitoramento climático global, com especial atenção às regiões afetadas pelo aquecimento global, como o Ártico. Esta versão se concentra em monitorar temperaturas globais, gerar alertas para extremos climáticos, e analisar tendências climáticas de longo prazo. O objetivo é sensibilizar e educar sobre o aquecimento global, promovendo ações de mitigação e adaptação, e contribuir significativamente para a pesquisa ambiental global.

## Recursos
- Busca informações climáticas de qualquer cidade.
- Utiliza a API do OpenWeather.
- Retorna a temperatura atual e a descrição do tempo.
- Formata a saída de dados para facilitar a visualização.

## Características
- Linux: Utiliza a versão mais recente do Ubuntu como base.
- SSH Habilitado: Configuração do OpenSSH Server para permitir acesso remoto.
- Ferramentas de Desenvolvimento: Inclui compiladores e editores, como `g++` e `nano`.
- Bibliotecas C++: Instalação de bibliotecas essenciais para desenvolvimento C++.

## Dependências
- [libcurl](https://curl.se/libcurl/): Biblioteca cliente para transferência de dados com URL sintaxe.
- [nlohmann/json](https://github.com/nlohmann/json): Biblioteca moderna em C++ para manipulação de JSON.

## Configuração e Execução do Docker

Para containerizar este projeto com Docker e configurar o acesso SSH, siga os passos abaixo:

1. Para construir a imagem, execute o seguinte comando no diretório do `Dockerfile`:
```
docker build -t sua_imagem .
```
Substitua `sua_imagem` pelo nome desejado para a imagem

2. Para iniciar o container:
```
docker run -d -p 22:22 sua_imagem
```
Isso mapeia a porta 22 do host para a porta 22 do container, permitindo acesso via SSH.

3. Conecte-se ao container usando:
```
ssh wmonitor@host_ip
```
Use a senha `123456` e substitua `host_ip` pelo IP do host.

### Diretório Home
O diretório home do usuário wmonitor está localizado em `/home/wmonitor`, contendo os arquivos `main.cpp` e `apiKey.txt`. É crucial atualizar o conteúdo de `apiKey.txt` com sua chave API pessoal, garantindo assim o funcionamento adequado da aplicação.

## Configuração da Chave API
Antes de executar o programa, você precisa configurar sua chave de API do OpenWeather, seguindo estes passos:

1. Faça o registro no site do OpenWeatherMap: [Registro no OpenWeatherMap](https://openweathermap.org/).
2. Após o registro, acesse a área de gerenciamento de chaves de API e crie sua chave pessoal: [Gerar Chave de API no OpenWeatherMap](https://home.openweathermap.org/api_keys).
3. Copie a chave de API gerada e a insira na primeira linha do arquivo `apiKey.txt`.

## Compilação e Execução
Certifique-se de ter as bibliotecas `libcurl` e `nlohmann/json` instaladas. Compile o projeto com o seguinte comando:

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

