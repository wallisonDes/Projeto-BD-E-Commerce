use ecommerce;

-- inserindo valores tabela cliente

insert into client (tipo, Fnamer, CPFCNPJ, contato, Address)
			values	('Física','Carmem Lúcia Silva', 14865688885, 49988157465,'Rua Euclides de Alencar 31, Grano - Bom Retiro'),
					('Juridíca','Estevam Silva Alverne', 13865625000185, '8831658956','Rua dos Tabajaras 3, Jardim Camprestre - Limoeiro do Norte'),
                    ('Física','Janio Aquino de Brito', 13865675685, '25978453265','Avenida Aviador SN, Cemam - Grifo'),
                    ('Física','Rita de Cassia Afonso', 26534688887, '49985364574','Tv Cloves de Alencar 12, Eterno - Bom Retiro');
                    
 -- inserindo valores tabela produto
 
insert into produto (nome, categoria, descricao, valor)
			values	('Fritadeira forno','Eletrodoméstico', 'Oster OFRT780 - Fritadeira forno 3 em 1, 127V, 1800 W, ‎Preto', '579.90'),
                    ('Camera','Eletrônico', 'Camera Ip Wifi Giratória 1080p Estilo Babá Eletrônica Com Visão Noturna e Alerta De Movimento', '65.90'),
                    ('Relógio LED','Eletrônico', 'Relógio despertador digital, tela LED, visor 12/24H', '38.99'),
                    ('Adaptador Hub','Informática', 'Regua Pc adaptador multiportas, hub de 2 a 3 Portas USB', '99.90'),
                    ('Ventilador ','Eletrodoméstico', 'Ventilador de mesa 30cm, Ultra, 110V, Branco/Azul - V-30-6P', '91.90');
                    
-- inserindo valores tabela terceirizado

insert into terceirizado (razaos, CNPJ, contato, Address)
			values	('EF Informática ME','00825389000185', '1140864585', 'Rua Dom Lúcio de Sousa, 250-Vila Gumercindo, São Paulo-SP'),
					('ARCA LTDA','00825328000197', '1140078592', 'Av. Manuel Bandeira, 360-Vila Leopoldina, São Paulo-SP'),
					('Dufrio LTDA','00435636000112', '1140221280', 'Praça Jácomo Zanella, 187-Barra Funda, São Paulo-SP');
					
-- inserindo valores tabela fornecedor
insert into fornecedor (razaos, CNPJ, contato, Address)
			values		('Grupo Vannucci ME','00821289000195','1140861111','R. Emílio Goeldi, 94 - Lapa de Baixo, São Paulo - SP, 05065-110'),
						('ARCA ME','38754812000187','3134158974','Rua Das Palmacias, 27 - Morro - Belo Horizonte - MG'),
						('E.A.G DISTRIBUIÇÃO LTDA','37852654000112','2140053212','R. Acaú, 118 - Engenho Novo, Rio de Janeiro - RJ, 20715-100'),
						('TEC SHOW LTDA','48123654000179','8134851245','R. Carlos de Brito, n° 165 - Loja B - Engenho do Meio, Recife - PE, 50730-130'),
						('INFOSHOPPING LTDA','21456963000184','8534867896','R. Eduardo Bezerra, 835 - São João do Tauape, Fortaleza - CE, 60130-270');

-- inserindo valores tabela estoque

insert into estoque (Address)
			values		('MATRIZ'),
						('UNIDADE 1');
         
-- inserindo valores tabela pagamento ('PIX','CARTÃO DE CRÉDITO','CARTÃO DE DÉBITO','BOLETO')

insert into fpagamento (PTTipo)
			values		('PIX'),
						('CARTÃO DE CRÉDITO'),
                        ('CARTÃO DE DÉBITO'),
                        ('BOLETO');
						
-- inserindo valores tabela tipo de pagamento

insert into pagamento	(idTPClient, idPFPag, FDescricao, PTNum, PTValidade)
			values		('1','2','via aplicativo','4152654185238741','2028-11-01');
            
-- inserindo valores tabela pedido

insert into pedido	(idPClient, idTipopag, PStatus, PDescicao, Frete)
			value	('1','2', default,'via aplicativo','LOCAL');

-- inserindo valores tabela de relação do produdo e o pedido

insert into RProdPed (idProduto, idPedido, RPPQuantidade, PVTotal, PFrete)
			values	(2,6,'2','131.80',default);

-- inserindo valores tabela de relação do produdo e o estoque
            
insert into RPorestoque (idProduto, idEstoque, Quantidade)
			values		(1,1,'1000'),
						(3,1,'900'),
                        (4,1,'0'),
                        (5,2,'4000');
                        
-- inserindo valores tabela de ENTREGA

insert into entrega (idPedido, idClient, DPrevista, CodRastreio, EStatus, Edata_entrega)
			values		(6,1,'2025-01-25','AB001C005','EM TRANSPORTE',null);
            

select * from client;
select * from produto;
select * from terceirizado;
select * from fornecedor;
select * from estoque;
select * from pedido;
select * from RProdPed;
select * from RPorestoque;
select * from entrega;
select * from pagamento;

-- Relação cliente com pedidos
select * from client c, pedido p where c.idClient = idPClient;


insert into pagamento	(idTPClient, idPFPag, FDescricao, PTNum, PTValidade)
			values		('1','3','via aplicativo','4152654185238741','2028-11-01'),
						('1','1','via aplicativo','4152654185238741','2028-11-01'),
						('2','1','web site','4999654185238741','2026-8-01'),
                        ('3','3','via aplicativo','4152777185238741','2027-01-01'),
                        ('4','2','web site','5199656585218741','2028-11-01');


insert into pedido	(idPClient, idTipopag, PStatus, PDescicao, Frete)
			value	('2','1', default,'via WEB SITE','Outras LOCALIDADES'),
					('3','3', default,'via WEB SITE','Outras LOCALIDADES'),
                    ('4','4', default,'via WEB SITE','LOCAL'),
                    ('2','3', default,'via WEB SITE','Outras LOCALIDADES'),
                    ('1','1', default,'via WEB SITE','LOCAL');
                    
                    
insert into RProdPed (idProduto, idPedido, RPPQuantidade, PVTotal, PFrete)
			values	(1,7,'1','579.90','15.00'),
					(3,8,'3','116.98','20.00'),
                    (4,9,'3','299.70',default),
                    (5,10,'1','91.90','25.00'),
                    (2,11,'5','329.50',default);

-- Conta a quanidade de cliente cadastrados                    
select count(*) from client;

select Fnamer, idPedido, PStatus from client c, pedido p where c.idClient = idPClient;

-- Relação do status do pedido
select Fnamer as client, idPedido as Request, PStatus as status from client c, pedido p where c.idClient = idPClient;

-- clientes com a menor numero de pedidos feitos, apresentando em ordem decrescente o id do cliente
select Fnamer as client, idPClient, count(*)
from client c, pedido p where c.idClient = idPClient
group by idPClient
having count(*) < 2
order by idPClient DESC;
