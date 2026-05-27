FROM payara/server-full:5.2022.5-jdk11

USER root

RUN apt-get update && apt-get install -y \
    maven \
    wget

# Driver SQL Server
RUN wget https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/12.6.1.jre11/mssql-jdbc-12.6.1.jre11.jar \
    -O /opt/payara/appserver/glassfish/lib/mssql-jdbc.jar

WORKDIR /app

EXPOSE 8080 4848

CMD ["/opt/payara/appserver/bin/asadmin", "start-domain", "-v"]