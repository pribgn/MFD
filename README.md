Sabor Digital - Banco de Dados
Este projeto descreve o banco de dados utilizado no sistema de gestão de pedidos do restaurante Sabor Digital. O banco de dados foi criado utilizando MySQL.


Estrutura do Banco de Dados
O banco de dados possui as seguintes tabelas:

- 'categorias'
- 'dishes'
- 'order_status'
- 'orders'


Tabela 'categorias'
Armazena as categorias dos pratos.

    Campo    Tipo         Restrição
    id       BIGINT       NOT NULL AUTO_INCREMENT, PRIMARY KEY
    nome     VARCHAR(255) DEFAULT NULL


Tabela 'dishes'
Armazena os pratos disponíveis no restaurante.

    Campo        Tipo         Restrição
    id           BIGINT       NOT NULL AUTO_INCREMENT, PRIMARY KEY
    description  VARCHAR(255) DEFAULT NULL
    name         VARCHAR(255) DEFAULT NULL
    price        DOUBLE       DEFAULT NULL
    url_image    VARCHAR(255) DEFAULT NULL
    categoria_id BIGINT       DEFAULT NULL, FOREIGN KEY


Tabela 'order_status'
Armazena os diferentes status possíveis para um pedido.

    Campo  Tipo         Restrição
    id     BIGINT       NOT NULL AUTO_INCREMENT, PRIMARY KEY
    name   VARCHAR(255) UNIQUE, DEFAULT NULL


Tabela 'orders'
Armazena as informações dos pedidos realizados pelos clientes.

    Campo         Tipo         Restrição
    id            BIGINT       NOT NULL AUTO_INCREMENT, PRIMARY KEY
    address       VARCHAR(255) DEFAULT NULL
    customer_name VARCHAR(255) DEFAULT NULL
    order_name    VARCHAR(255) DEFAULT NULL
    phone         VARCHAR(255) DEFAULT NULL
    dish_id       BIGINT       DEFAULT NULL, FOREIGN KEY
    status_id     BIGINT       DEFAULT NULL, FOREIGN KEY


O script de criação do banco de dados se encontra em ./estrutura.sql