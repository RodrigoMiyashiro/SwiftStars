# SwiftStars
Swift Stars - List of repositories

Versão: 0.0.1<br>
Linguagem: Swift<br>

## Aplicativo

### 1 - Objetivo

Criar um aplicativo que consulte a API do Github e liste os repositórios com mais 
estrelas em Swift.<br>
Exibir o nome do repositório, quantidade de estrelas, nome do autor e foto do autor.

### 2 - Arquitetura

Arquitetura pensada para criar um aplicativo inspirado no Clean Archicture. Contendo um Core,
onde o conjunto de regras da aplicação fica disponível. Se eventualmente, precisar implementar
outra aplicação em Swift, o Core já estará pronto.<br>
Dentro da aplicação encontramos o Boundary, a Infrastructure e o Presentation.<br>
A Infrastructure é responsável por cuidar da camada externa da aplicação, como banco de
dados, serviços etc.<br> 
O Boundary é responsável por interligar as camadas externa com o Core.<br>
O Presentation cuida da apresentação das telas e de como os elementos visuais são montados.

[melhorar descrição]

## Melhorias

Algumas melhorias para fazer na próxima versão do app:<br>
- Trocar o scroll infinito.<br>
- Trocar o controle DispatchSemaphore.<br>
- Criar novas funcionalidades como: Detalhe de um repositório.<br>
- Implementar testes unitários e de UI

## Recursos

API Github<br>
https://developer.github.com/v3/

https://api.github.com/search/repositories?q=language:swift&sort=stars

## Referências

herbertograca - DDD, Hexagonal, Onion, Clean, CQRS, … How I put it all together<br>
https://herbertograca.com/2017/11/16/explicit-architecture-01-ddd-hexagonal-onion-clean-cqrs-how-i-put-it-all-together/

Robert C Martin - Clean Archicture and Design<br>
https://www.youtube.com/watch?v=Nsjsiz2A9mg
