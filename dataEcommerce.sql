INSERT INTO customer (Fname, Minit, Lname, Address) VALUES
('Customer1', 'B', 'LastName1', 'Street 1, City 22'),
('Customer2', 'B', 'LastName2', 'Street 2, City 86'),
('Customer3', 'D', 'LastName3', 'Street 3, City 23'),
('Customer4', 'D', 'LastName4', 'Street 4, City 64'),
('Customer5', 'D', 'LastName5', 'Street 5, City 58'),
('Customer6', 'A', 'LastName6', 'Street 6, City 31'),
('Customer7', 'B', 'LastName7', 'Street 7, City 66'),
('Customer8', 'B', 'LastName8', 'Street 8, City 38'),
('Customer9', 'C', 'LastName9', 'Street 9, City 37'),
('Customer10', 'C', 'LastName10', 'Street 10, City 74');

INSERT INTO customerPF (idFcustomer, cpf, birthdate) VALUES
(1, '35124019876', '1998-03-07'),
(2, '89669694321', '1988-10-25'),
(3, '76522416789', '1984-11-30'),
(4, '21836065432', '1995-08-06'),
(5, '79677201234', '1972-01-10');

INSERT INTO customerPJ (idJcustomer, cnpj, socialName) VALUES
(6, '32891700123456', 'Empresa 1'),
(7, '85419051234567', 'Empresa 2'),
(8, '87398833445566', 'Empresa 3'),
(9, '40270997890123', 'Empresa 4'),
(10, '25686831234567', 'Empresa 5');

-- Inserir dados na tabela `product`
INSERT INTO product (Pname, prodDescription, prodPrice, prodClassificationKids, prodCategory, prodFeedback, prodSize) VALUES
('Product1', 'Descrição do Produto Eletrônico.', 199.99, TRUE, 'Eletrônico', 2.94, 'Extra Large'),
('Product2', 'Descrição do Produto Brinquedo.', 49.99, TRUE, 'Brinquedos', 4.76, 'Small'),
('Product3', 'Descrição do Produto Brinquedo.', 29.99, TRUE, 'Brinquedos', 1.24, 'Large'),
('Product4', 'Descrição do Produto Vestimenta.', 89.99, FALSE, 'Vestimenta', 1.49, 'Medium'),
('Product5', 'Descrição do Produto Alimento.', 15.99, TRUE, 'Alimentos', 3.38, 'Medium'),
('Product6', 'Descrição do Produto Vestimenta.', 79.99, FALSE, 'Vestimenta', 4.13, 'Small'),
('Product7', 'Descrição do Produto Brinquedo.', 25.99, FALSE, 'Brinquedos', 1.05, 'Small'),
('Product8', 'Descrição do Produto Brinquedo.', 12.99, FALSE, 'Brinquedos', 0.11, 'Extra Large'),
('Product9', 'Descrição do Produto Vestimenta.', 99.99, FALSE, 'Vestimenta', 4.16, 'Large'),
('Product10', 'Descrição do Produto Eletrônico.', 499.99, FALSE, 'Eletrônico', 4.97, 'Extra Large');

INSERT INTO orders (idOrderCustomer, idOrderDelivery, OrderStatus, OrderDescription, ShippingCost, OrderDate) VALUES
(4, 1, 'Aprovado', 'Descrição do pedido 1', 48.25, '2025-03-27'),
(9, 2, 'Aprovado', 'Descrição do pedido 2', 29.54, '2025-03-28'),
(8, 3, 'Aprovado', 'Descrição do pedido 3', 31.99, '2025-03-27'),
(3, 4, 'Separação', 'Descrição do pedido 4', 21.29, '2025-03-25'),
(1, 5, 'Processando', 'Descrição do pedido 5', 15.00, '2025-04-01');

INSERT INTO delivery (deliveryStatus, deliveryTrackingCode, deliveryDate) VALUES
('Preparação', 'TRACK00001', '2025-05-12'),
('Preparação', 'TRACK00002', '2025-04-29'),
('Em trânsito', 'TRACK00003', '2025-04-27'),
('Entregue', 'TRACK00004', '2025-05-04'),
('Cancelada', 'TRACK00005', '2025-04-15');

INSERT INTO supplier (supSocialName, supCNPJ, supContact, supEmail, supAddress) VALUES
('Fornecedor 1', '71873281234567', '11642678901', 'fornecedor1@email.com', 'Rua 1, Cidade 8'),
('Fornecedor 2', '86870412345678', '38518012345', 'fornecedor2@email.com', 'Rua 2, Cidade 54'),
('Fornecedor 3', '99156316789012', '23758567890', 'fornecedor3@email.com', 'Rua 3, Cidade 46'),
('Fornecedor 4', '30593153456789', '87204970123', 'fornecedor4@email.com', 'Rua 4, Cidade 2'),
('Fornecedor 5', '60328201234567', '19319745678', 'fornecedor5@email.com', 'Rua 5, Cidade 7'),
('Fornecedor 6', '36387234567890', '52431920987', 'fornecedor6@email.com', 'Rua 6, Cidade 26'),
('Fornecedor 7', '71128567890123', '10859370123', 'fornecedor7@email.com', 'Rua 7, Cidade 84'),
('Fornecedor 8', '98353378901234', '51975123456', 'fornecedor8@email.com', 'Rua 8, Cidade 93'),
('Fornecedor 9', '48008190123456', '14675617890', 'fornecedor9@email.com', 'Rua 9, Cidade 23'),
('Fornecedor 10', '57479601234567', '68243029876', 'fornecedor10@email.com', 'Rua 10, Cidade 34');

INSERT INTO payment (idPorder, idPcustomer, idPdelivery, details, paymentValue, paymentDate, paymentStatus) VALUES
(1, 5, 1, 'Pagamento referente ao pedido 1 via cartão de crédito.', 356.20, '2025-03-23 14:13:45', 'Estornado'),
(4, 8, 2, 'Pagamento referente ao pedido 4 via cartão de crédito.', 101.27, '2025-04-06 14:13:45', 'Pendente'),
(2, 1, 3, 'Pagamento referente ao pedido 2 via Pix.', 126.14, '2025-04-10 14:13:45', 'Aprovado'),
(3, 8, 4, 'Pagamento referente ao pedido 3 via Pix.', 227.10, '2025-04-17 14:13:45', 'Aprovado'),
(5, 1, 5, 'Pagamento referente ao pedido 5 via boleto.', 50.00, '2025-04-05 14:13:45', 'Pendente');

INSERT INTO creditCardPayment (idPayment, cardNumber, cardType, cardHolderName) VALUES
(1, '1234567890123456', 'Crédito', 'Customer5'),
(2, '9876543210987654', 'Crédito', 'Customer8');

INSERT INTO boletoPayment (idPayment, boletoNumber, dueDate) VALUES
(5, 'BOLETO123456', '2025-04-15');

INSERT INTO pixPayment (idPayment, pixKey) VALUES
(3, 'pixkey123456');
(4, 'pixkey654321');


INSERT INTO storage (storageLocation, storageQuantity) VALUES
('Armazém 1, Cidade 78', 390),
('Armazém 2, Cidade 80', 182),
('Armazém 3, Cidade 54', 7),
('Armazém 4, Cidade 74', 165),
('Armazém 5, Cidade 99', 313),
('Armazém 6, Cidade 17', 155),
('Armazém 7, Cidade 48', 340),
('Armazém 8, Cidade 11', 29),
('Armazém 9, Cidade 29', 162),
('Armazém 10, Cidade 89', 122);

INSERT INTO seller (selSocialName, selCNPJ, selCPF, selLocation, selContact, selStatus) VALUES
('Vendedor 1', NULL, '12345678901', 'Rua 1, Cidade 1', '11642678901', 'Ativo'),
('Vendedor 2', '12345678000123', NULL, 'Rua 2, Cidade 2', '38518012345', 'Ativo'),
('Vendedor 3', NULL, '98765432109', 'Rua 3, Cidade 3', '23758567890', 'Inativo'),
('Vendedor 4', '87654321000123', NULL, 'Rua 4, Cidade 4', '87204970123', 'Ativo'),
('Vendedor 5', NULL, '54321098765', 'Rua 5, Cidade 5', '19319745678', 'Suspenso'),
('Vendedor 6', '65432109876543', NULL, 'Rua 6, Cidade 6', '52431920987', 'Ativo'),
('Vendedor 7', NULL, '32109876543', 'Rua 7, Cidade 7', '10859370123', 'Inativo'),
('Vendedor 8', '32109876543210', NULL, 'Rua 8, Cidade 8', '51975123456', 'Ativo'),
('Vendedor 9', NULL, '76543210987', 'Rua 9, Cidade 9', '14675617890', 'Suspenso'),
('Vendedor 10', '98765432109876', NULL, 'Rua 10, Cidade 10', '68243029876', 'Ativo');

INSERT INTO productSeller (idPSseller, idPSproduct, prodQuantity, prodStatus) VALUES
(1, 1, 10, 'Disponivel'),
(1, 2, 5, 'Disponivel'),
(2, 3, 8, 'Disponivel'),
(3, 4, 12, 'Indisponivel'),
(4, 5, 15, 'Disponivel'),
(5, 6, 20, 'Disponivel'),
(6, 7, 18, 'Indisponivel'),
(7, 8, 22, 'Disponivel'),
(8, 9, 25, 'Disponivel'),
(9, 10, 30, 'Indisponivel');

INSERT INTO productOrder (idPOproduct, idPOorder, POQuantity) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 3),
(4, 3, 2),
(5, 4, 1),
(6, 5, 4),
(7, 1, 1),
(8, 2, 2),
(9, 3, 1),
(10, 4, 3);

INSERT INTO productStorage (idSproduct, idSstorage) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO productSupplier (idPSproduct, idPSsupplier) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

--Numero de clientes
SELECT COUNT(*) FROM customer;

--Quantos pedidos foram feitos por cada cliente
SELECT c.idCustomer, c.Fname, COUNT(o.idOrder) AS TotalPedidos
FROM customer c
JOIN orders o ON c.idCustomer = o.idOrderCustomer
GROUP BY c.idCustomer, c.Fname;


--Valor total dos pedidos por cliente
SELECT 
    c.idCustomer, 
    c.Fname, 
    SUM(p.paymentValue) AS ValorTotalPedidos
FROM customer c
JOIN orders o ON c.idCustomer = o.idOrderCustomer
JOIN payment p ON o.idOrder = p.idPorder
GROUP BY c.idCustomer, c.Fname;

--Status dos pedidos
SELECT 
    o.OrderStatus, 
    COUNT(*) AS QuantidadePedidos
FROM orders o
GROUP BY o.OrderStatus;

--Tipos de pagamento
SELECT 
    CASE 
        WHEN p.details LIKE '%cartão de crédito%' THEN 'Cartão de Crédito'
        WHEN p.details LIKE '%pix%' THEN 'Pix'
        WHEN p.details LIKE '%boleto%' THEN 'Boleto'
        ELSE 'Outro'
    END AS TipoPagamento,
    COUNT(*) AS Quantidade
FROM payment p
GROUP BY 
    CASE 
        WHEN p.details LIKE '%cartão de crédito%' THEN 'Cartão de Crédito'
        WHEN p.details LIKE '%pix%' THEN 'Pix'
        WHEN p.details LIKE '%boleto%' THEN 'Boleto'
        ELSE 'Outro'
    END;
