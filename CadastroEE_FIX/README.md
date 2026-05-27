# CadastroEE - Sistema de Cadastro de Produtos

Projeto desenvolvido para a disciplina **DGT2811 - Desenvolvimento Back-End Corporativo com Java e Cloud**, utilizando tecnologias Java EE com arquitetura corporativa baseada em EAR, EJB e WAR.

O sistema realiza o gerenciamento de produtos através de operações CRUD (Create, Read, Update e Delete), permitindo cadastrar, listar, alterar e excluir produtos persistidos em banco de dados SQL Server.

---

# Tecnologias Utilizadas

## Back-end
- Java 11
- Java EE (javax)
- EJB
- JPA (EclipseLink)
- Servlets
- JSP

## Banco de Dados
- Microsoft SQL Server 2022

## Servidor de Aplicação
- Payara Server 5.2022.5

## Build e Gerenciamento
- Maven

## Containerização
- Docker
- Docker Compose

---

# Estrutura do Projeto

```text
CadastroEE_FIX/
│
├── CadastroEE-ear/
│   └── Módulo EAR principal
│
├── CadastroEE-ejb/
│   └── Regras de negócio, entidades JPA e acesso a dados
│
├── CadastroEE-war/
│   └── Interface Web JSP/Servlets
│
├── docker-compose.yml
├── Dockerfile
└── pom.xml
```

---

# Funcionalidades

- Cadastro de produtos
- Listagem de produtos
- Alteração de produtos
- Exclusão de produtos
- Persistência em banco SQL Server
- Deploy corporativo via EAR
- Integração entre módulos EJB + WAR

---

# Arquitetura Utilizada

O projeto segue uma arquitetura modular Java EE:

- EAR → módulo principal de empacotamento
- EJB → camada de negócio e persistência
- WAR → camada web e interface JSP

A aplicação utiliza:
- JPA para persistência
- JDBC Resource configurado no Payara
- SQL Server executando em container Docker
- Deploy EAR no servidor Payara

---

# Requisitos

Para execução do projeto é necessário possuir instalado:

- Docker
- Docker Compose
- Git
- Java 11+ (caso queira executar localmente sem container)

---

# Como Executar o Projeto

## 1. Clonar o repositório

```bash
git clone https://github.com/seu-usuario/CadastroEE.git
```

---

## 2. Acessar a pasta do projeto

```bash
cd CadastroEE
```

---

## 3. Subir os containers

```bash
docker compose up -d --build
```

---

# Configuração do Banco de Dados

## SQL Server

- Host: `sqlserver`
- Porta: `1433`
- Usuário: `sa`
- Senha: `SenhaForte123!`

---

# Banco utilizado

```sql
CREATE DATABASE loja;
```

---

# Tabela utilizada

```sql
CREATE TABLE produto (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255),
    quantidade INT,
    preco_venda FLOAT
);
```

---

# JDBC Resource Configurado no Payara

## Connection Pool

```text
lojaPool
```

## JDBC Resources

```text
jdbc/loja__pm
jdbc/loja__nontx
```

---

# Deploy da Aplicação

Após o build Maven, o EAR é gerado em:

```text
CadastroEE-ear/target/CadastroEE-ear-1.0.ear
```

Deploy realizado no Payara Server via:

```bash
asadmin deploy CadastroEE-ear-1.0.ear
```

---

# Acesso ao Sistema

## Aplicação Web

```text
http://localhost:8080/CadastroEE-war/
```

## Painel Administrativo Payara

```text
http://localhost:4848
```

---

# Aprendizados Aplicados no Projeto

Durante o desenvolvimento foram aplicados conhecimentos sobre:

- Java EE corporativo
- Arquitetura EAR/EJB/WAR
- JPA e persistência
- Configuração JDBC
- Integração com SQL Server
- Containerização com Docker
- Deploy em servidor de aplicação
- Troubleshooting e resolução de problemas de ambiente
- Maven multi-módulo

---

# Observações Técnicas

O projeto utiliza:
- namespace `javax`
- Payara Server 5
- SQL Server em container Docker
- EclipseLink como provider JPA

A conexão JDBC foi configurada com:

```text
encrypt=false
trustServerCertificate=true
```

para evitar conflitos SSL entre Payara e SQL Server em ambiente Docker.

---

# Autor

Daniel Victor

Estudante de Desenvolvimento Full Stack  
Universidade Estácio de Sá

---

# Status do Projeto

Projeto finalizado e funcional para fins acadêmicos.
