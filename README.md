# prjModeloEcommerce_DIO_mysql

Repositório para o Desafio de Projeto DIO

### 📝 Descrição do Desafio
Este repositório foi criado como parte de um desafio de projeto. O objetivo é criar o esquema conceitual para o contexto de oficina com base na narrativa fornecida.

O esquema do modelo foi adicionado ao repositório para análise e documentação. Este arquivo fornece o contexto necessário para compreender o esquema desenvolvido.

### 🎯 Objetivo do Projeto
Realizar a criação do Script SQL para criação do esquema do banco de dados. Posteriormente, realize a persistência de dados para realização de testes. Especifique ainda queries mais complexas dos que apresentadas durante a explicação do desafio. Sendo assim, crie queries SQL com as cláusulas abaixo:

- [x] Recuperações simples com SELECT Statement
- [x] Filtros com WHERE Statement
- [x] Crie expressões para gerar atributos derivados
- [x] Defina ordenações dos dados com ORDER BY
- [x] Condições de filtros aos grupos – HAVING Statement
- [x] Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

### Diretrizes
- Não há um mínimo de queries a serem realizadas;
- Os tópicos supracitados devem estar presentes nas queries;
- Elabore perguntas que podem ser respondidas pelas consultas;
- As cláusulas podem estar presentes em mais de uma query;

### 🛠️ Detalhamento dos Campos ENUM
Alguns campos do modelo utilizam o tipo ENUM para garantir consistência e limitar os valores permitidos. Abaixo estão listados os campos e suas respectivas opções:

**Tabela produtos**\
prodCategory: ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis')

**Tabela Entrega**\
deliveryStatus: ENUM('Preparação', 'Em trânsito', 'Entregue', 'Cancelada')

**Tabela pedidos**\
OrderStatus: ENUM('Processando', 'Aprovado', 'Separação', 'Enviado', 'Entregue', 'Cancelado')

**Tabela Pagamento**\
paymentStatus: ENUM('Pendente', 'Aprovado', 'Recusado', 'Estornado')

**Tabela creditCardPayment**\
cardType: ENUM('Crédito', 'Débito')

**Tabela Terceiro - Vendedor**\
selStatus: ENUM('Ativo', 'Inativo', 'Suspenso')

**Tabela Produtos por vendedor**\
prodStatus: ENUM('Disponivel', 'Indisponivel')

![Diagrama](https://github.com/patrickfgod/prjModeloEcommerce_DIO_mysql/blob/main/esquema.png)
