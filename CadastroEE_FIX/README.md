# CadastroEE - Java EE 8

Projeto corporativo Java EE 8 utilizando:

- EAR
- EJB
- WAR
- JSP
- Servlets
- JPA
- SQL Server
- GlassFish 6
- Java 17 a 21
- Apenas javax.*

## Estrutura

CadastroEE/
├── CadastroEE-ear
├── CadastroEE-ejb
├── CadastroEE-war
└── pom.xml

## Banco SQL Server

Execute:

```sql
CREATE DATABASE loja;
GO

USE loja;
GO

CREATE TABLE produto (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255),
    quantidade INT,
    preco_venda FLOAT
);
GO
```

## Driver JDBC SQL Server

Baixe o driver JDBC da Microsoft:

https://learn.microsoft.com/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server

Copie o arquivo .jar para:

glassfish6/glassfish/domains/domain1/lib/

Depois reinicie o GlassFish.

## Criar Connection Pool

```bash
./asadmin create-jdbc-connection-pool \
--datasourceclassname=com.microsoft.sqlserver.jdbc.SQLServerDataSource \
--restype=javax.sql.DataSource \
--property user=sa:password=SUA_SENHA:DatabaseName=loja:ServerName=localhost:portNumber=1433:url="jdbc\:sqlserver\://localhost\:1433;databaseName=loja;encrypt=false;trustServerCertificate=true" \
LojaPool
```

## Criar JDBC Resource

```bash
./asadmin create-jdbc-resource \
--connectionpoolid LojaPool \
jdbc/loja
```

## Testar conexão

```bash
./asadmin ping-connection-pool LojaPool
```

## Compilar

```bash
mvn clean install
```

## Deploy

```bash
./asadmin deploy CadastroEE-ear/target/CadastroEE-ear-1.0.ear
```

## Acesso

http://localhost:8080/CadastroEE-war/

ou

http://localhost:8080/CadastroEE-war/ServletProdutoFC?acao=listar

## Funcionalidades

- Listar produtos
- Inserir produtos
- Alterar produtos
- Excluir produtos

## Compatibilidade

- Java 17
- Java 21
- GlassFish 6
- Java EE 8
