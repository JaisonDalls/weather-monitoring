# weather-monitoring [Ver.1.0]
Este projeto é uma aplicação em C++ que usa a API OpenWeather para monitorar o tempo em qualquer cidade do mundo. O usuário insere o nome de uma cidade, e a aplicação retorna a temperatura atual e a descrição do tempo.

## Ⅰ - Versão 1.0: Monitoramento Climático Urbano

A primeira versão do projeto foca no monitoramento climático urbano, armazenando dados de temperatura das cidades para análises históricas. O objetivo principal é desenvolver um algoritmo que monitora condições climáticas em áreas urbanas, gera alertas de temperaturas extremas, e contribui para a conscientização sobre as mudanças climáticas e suas implicações nas cidades. Além disso, o projeto visa fornecer dados valiosos para pesquisas relacionadas ao clima.

## Ⅱ - Versão 2.0: Monitoramento Climático Global
A segunda versão amplia o escopo para um monitoramento climático global, com especial atenção às regiões afetadas pelo aquecimento global, como o Ártico. Esta versão se concentra em monitorar temperaturas globais, gerar alertas para extremos climáticos, e analisar tendências climáticas de longo prazo. O objetivo é sensibilizar e educar sobre o aquecimento global, promovendo ações de mitigação e adaptação, e contribuir significativamente para a pesquisa ambiental global.

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

