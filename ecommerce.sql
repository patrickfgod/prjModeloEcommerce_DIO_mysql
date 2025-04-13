-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Tabela cliente
CREATE TABLE customer (
    idCustomer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Minit CHAR(3),
	Lname VARCHAR(20),
    Address VARCHAR(45)	
);

-- Tabela produtos
CREATE TABLE product(
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    prodDescription TEXT,
    prodPrice FLOAT,
    prodClassificationKids BOOL DEFAULT FALSE,
    prodCategory ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL,
    prodFeedback FLOAT DEFAULT 0,
    prodSize VARCHAR(20)
);

-- Tabela Entrega
CREATE TABLE delivery (
    idDelivery INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    deliveryStatus ENUM('Preparação', 'Em trânsito', 'Entregue', 'Cancelada'),
    deliveryTrackingCode VARCHAR(45),
    deliveryDate DATE
);

-- Tabela Cliente PF (Pessoa Física)
CREATE TABLE customerPF (
    idFcustomerPF INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idFcustomer INT NOT NULL,    
	cpf CHAR(11) NOT NULL,
    birthdate DATE,
    
    CONSTRAINT fk_customerPF_customer FOREIGN KEY (idFcustomer) REFERENCES customer(idCustomer),
	
	CONSTRAINT uq_customerPF_cpf UNIQUE (cpf)
);

-- Tabela Cliente PJ (Pessoa Jurídica)
CREATE TABLE customerPJ (
    idJcustomerPJ INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idJcustomer INT NOT NULL,
    cnpj CHAR(14) NOT NULL,
    SocialName VARCHAR(255) NOT NULL,
    
    CONSTRAINT fk_customerPJ_customer FOREIGN KEY (idJcustomer) REFERENCES customer(idCustomer),
	
	CONSTRAINT uq_customerPJ_cnpj UNIQUE (cnpj)
);

-- Tabela pedidos
CREATE TABLE orders (
    idOrder INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idOrderCustomer INT,
	idOrderDelivery INT,
    OrderStatus ENUM('Processando', 'Aprovado', 'Separação', 'Enviado', 'Entregue', 'Cancelado') DEFAULT 'Processando',
    OrderDescription VARCHAR(255),
    ShippingCost FLOAT,
    OrderDate DATE DEFAULT CURRENT_DATE,
	
	CONSTRAINT fk_orders_customer FOREIGN KEY (idOrderCustomer) REFERENCES customer(idCustomer),
	CONSTRAINT fk_orders_delivery FOREIGN KEY (idOrderDelivery) REFERENCES delivery(idDelivery)
);

-- Tabela Pagamento
CREATE TABLE payment (
    idPpayment INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idPorder INT NOT NULL,
	idPcustomer INT NOT NULL,
	idPdelivery INT,

    details TEXT,
    paymentValue FLOAT NOT NULL,
    paymentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    paymentStatus ENUM('Pendente', 'Aprovado', 'Recusado', 'Estornado') NOT NULL,
	
    CONSTRAINT fk_payment_orders FOREIGN KEY (idPorder) REFERENCES orders(idOrder),
    CONSTRAINT fk_payment_customer FOREIGN KEY (idPcustomer) REFERENCES customer(idCustomer),
    CONSTRAINT fk_payment_delivery FOREIGN KEY (idPdelivery) REFERENCES delivery(idDelivery)
);

CREATE TABLE creditCardPayment (
    idCardPayment INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idPayment INT NOT NULL,
    cardNumber VARCHAR(20) NOT NULL,
    cardType ENUM('Crédito', 'Débito') NOT NULL,
    cardHolderName VARCHAR(50) NOT NULL,
    
    CONSTRAINT fk_creditCard_payment FOREIGN KEY (idPayment) REFERENCES payment(idPpayment)
);

CREATE TABLE boletoPayment (
    idBoletoPayment INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idPayment INT NOT NULL,
    boletoNumber VARCHAR(50) NOT NULL,
    dueDate DATE NOT NULL,
    
    CONSTRAINT fk_boleto_payment FOREIGN KEY (idPayment) REFERENCES payment(idPpayment)
);

CREATE TABLE pixPayment (
    idPixPayment INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idPayment INT NOT NULL,
    pixKey VARCHAR(50) NOT NULL,
    
    CONSTRAINT fk_pix_payment FOREIGN KEY (idPayment) REFERENCES payment(idPpayment)
);


-- Tabela Estoque
CREATE TABLE storage (
    idStorage INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    storageQuantity INT DEFAULT 0
);

-- Tabela Fornecedor
CREATE TABLE supplier (
    idSupplier INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    supSocialName VARCHAR(255) NOT NULL,
    supCNPJ CHAR(14) NOT NULL,
    supContact VARCHAR(15) NOT NULL,
    supEmail VARCHAR(100),
    supAddress VARCHAR(150),
	
	CONSTRAINT uq_supplier_supCNPJ UNIQUE (supCNPJ),
    CONSTRAINT uq_supplier_supSocialName UNIQUE (supSocialName)
);

-- Tabela Terceiro - Vendedor
CREATE TABLE seller (
    idSeller INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    selSocialName VARCHAR(255) NOT NULL,
	selCNPJ CHAR(14),
    selCPF CHAR(11),
    selLocation VARCHAR(255),
    selContact VARCHAR(15) NOT NULL,
    selStatus ENUM('Ativo', 'Inativo', 'Suspenso'),
	
	CONSTRAINT uq_seller_selCNPJ UNIQUE (selCNPJ),
    CONSTRAINT uq_seller_selCPF UNIQUE (selCPF),
    CONSTRAINT uq_seller_selSocialName UNIQUE (selSocialName)
);

-- Relacionamentos

-- Tabela Produtos por vendedor. produto/vendedor
CREATE TABLE productSeller (
    idPSseller INT NOT NULL,
    idPSproduct INT NOT NULL,
    prodQuantity INT DEFAULT 1,
    prodStatus ENUM('Disponivel', 'Indisponivel'),
	PRIMARY KEY (idPSseller, idPSproduct),
	
	CONSTRAINT fk_productSeller_seller FOREIGN KEY (idPSseller) REFERENCES seller(idSeller),
	CONSTRAINT fk_productSeller_product FOREIGN KEY (idPSproduct) REFERENCES product(idProduct)
	
);

-- Tabela Relação de Produto/Pedido
CREATE TABLE productOrder (
    idPOproduct INT NOT NULL,
    idPOorder INT NOT NULL,
    POQuantity INT DEFAULT 1,
    PRIMARY KEY (idPOproduct, idPOorder),
	
	CONSTRAINT fk_productOrder_product FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
	CONSTRAINT fk_productOrder_order FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- Tabela Produto/Estoque
CREATE TABLE productStorage (
    idSproduct INT NOT NULL,
    idSstorage INT NOT NULL,
    PRIMARY KEY (idSproduct, idSstorage),
	
	CONSTRAINT fk_productStorage_product FOREIGN KEY (idSproduct) REFERENCES product(idProduct),
	CONSTRAINT fk_productStorage_storage FOREIGN KEY (idSstorage) REFERENCES storage(idStorage)
);

-- Tabela Disponibilizando um produto Produto/Fornecedor
CREATE TABLE productSupplier (
    idPSproduct INT NOT NULL,
    idPSsupplier INT NOT NULL,
	PRIMARY KEY (idPSproduct, idPSsupplier),
    
    CONSTRAINT fk_productSupplier_product FOREIGN KEY (idPSproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productSupplier_supplier FOREIGN KEY (idPSsupplier) REFERENCES supplier(idSupplier)
);



SHOW TABLES;
SHOW DATABASES;