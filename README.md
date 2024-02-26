# mapa-migrations

Este repositório mantém a história de migração do banco de dados do Mapa do Acolhimento. Utilizamos o Prisma Migrate para gerenciar e executar as migrações.

[Prisma](https://www.prisma.io/) é uma ferramenta de banco de dados ORM (Object-Relational Mapping) que simplifica a interação com o banco de dados. No nosso projeto, utilizamos Prisma para acessar o banco de dados e realizar operações CRUD de maneira eficiente.

## Pré-requisitos

Certifique-se de ter instalado em seu ambiente:

- Node v18 (LTS atual)
	- Utilize o [nvm](https://github.com/nvm-sh/nvm) para gerenciar suas versões de node, facilitando migrações ou possíveis downgrades
- [Docker](https://docs.docker.com/engine/install/)
- Variáveis de ambiente
	- Todas as vars necessárias para rodar o projeto estão no .env.example

## Configuração Inicial

1. Clone este repositório para o seu ambiente local.
2. Execute `npm install` para instalar as dependências do projeto.

## Scripts Disponíveis

Este repositório fornece os seguintes scripts no arquivo `package.json`:

- **db:start**: Inicializa o banco de dados + pgadmin localmente utilizando Docker Compose.
- **db:push**: Empurra as alterações no modelo do Prisma para o banco de dados.
- **migrate:deploy**: Implanta as migrações no banco de dados. **(NÃO DEVE SER EXECUTADO LOCALMENTE, veja os avisos abaixo)**
- **migrate:dev**: Executa o modo de desenvolvimento das migrações.
- **generate**: Gera os artefatos do Prisma.
- **db:seed**: Executa o script de seed para popular o banco de dados.
- **db:reset**: Reseta o banco de dados e executa novamente o script de seed.
- **migrate:diff**: Gera um arquivo de migração diff com base nas alterações do modelo.

**⚠️ AVISO**: O comando `npm run migrate:deploy` **NÃO DEVE** ser executado localmente. Ele é automatizado por um workflow do GitHub Actions chamado `migrate.yml`, que aplica essas mudanças em cada ambiente (staging ou produção) automaticamente.


## Uso

Para iniciar o banco de dados:

```bash
npm run db:start
```

Após rodar o `db:start` você pode acessar o pgadmin localmente em `localhost:5050`.

Os dados do banco de dados local criado estão dentro do arquivo `docker-compose.yml` na raíz do projeto.

Para referência, esses são os dados que você precisa inserir para acessar o server postgresql gerado:

- Name: `dev-mapa-org` (ou o que você preferir)
- Host name:
Para encontrar o endereço (IP) que o Docker instanciou o banco, rode:

```bash
docker ps

# copie o CONTAINER_ID da image `postgres`
docker inspect CONTAINER_ID
```

No fim do output, procure por `Network` e então `IPAddress`. Copie esse endereço e cole no campo de hostname, ex: `172.18.0.2`.

- Port: `5432`
- Username: `postgres`
- Password: `changeme`

### Comandos que só precisam ser executados na configuração inicial

Após inicializar o banco de dados localmente e acessar o pgAdmin:

```bash
# gere os artefatos do Prisma Client
npm run generate

# aplique as migrations pendentes & o seed no banco
npm run db:reset
```

Esse script serve para alguns cenários e é recomendado para quando:
- Você acabou de inicializar seu banco local e quer rodar as migrations;
- Você fez algumas mudanças no banco local mas não ficou feliz com elas e quer resetá-lo;

_Antes de dar o OK do reset, fique atenta em qual banco de dados o Prisma executará esse comando. Ele sempre deve ser `localhost:5432`, ou onde quer que você rode o seu banco local._

## Fazendo alterações no schema.prisma

Após fazer as alterações no arquivo `schema.prisma`, você precisa gerar uma migration.

Para gerar e aplicar uma nova migração com base nas alterações do `schema.prisma` rode:

```bash
npm run migrate:dev -- --name nome-da-sua-migration
```

## Integração contínua

_Para subir suas alterações em STG:_
- Abra um PR com suas alterações. Toda vez que você atualizar esse PR, a pipeline `migrate.yml` aplicará suas mudanças no banco de dados de staging.

_Para subir suas alterações em PROD:_
- Mergeie esse PR na branch `main` e a pipeline `migrate.yml` aplicará suas mudanças no banco de dados de produção.

## Contribuindo

Sinta-se à vontade para contribuir com melhorias ou correções neste repositório. Basta seguir estas etapas:

1. Faça um fork deste repositório.
2. Crie uma branch com suas alterações: `git checkout -b minha-feature`.
3. Faça commit das suas alterações: `git commit -m 'Adicionando nova feature'`.
4. Faça push para a branch: `git push origin minha-feature`.
5. Abra um Pull Request.

## Licença

Este projeto está licenciado sob a [Licença MIT](LICENSE).
