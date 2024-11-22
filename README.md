# Projeto-BD-E-Commerce
Nesse projeto você vai encontrar uma simulação de banco de dados de um e-commerce tradicional.
Realizando o controle de estoque e cadastro de clientes, estoque de produtos. Esse projeto é responsável pela venda de produtos online, sendo necessário registrar dados de fornecedores externos. O sistema tem como objetivo apresentar o fluxo de consulta,  compra e envio de produto aos seus cliente e caso necessário o cancelamento desta compra.
O que o sistema faz:
•	Armazena informações sobre produtos da empresa;
•	Armazena dados dos fornecedores;
•	Armazena dados dos clientes;
•	Armazena dados de vendedores terceirizados que vinculam seus produtos na plataforma de vendas online;
•	Registra código, nome e descrição para cada produto e suas categorias;
•	Controle de estoque;
•	Realiza pedidos;
Modelo de E-Commerce
** Principais entidades
- Clientes cadastrados (Cliente)
- Vendedores Terceirizados (Terceirizado)
- Produtos a venda (Produto)
- Pedidos do cliente (Pedido)
- Fornecedores de produtos (Fornecedor)
- Locais de estoque dos produtos (Estoque)
- Entrega de produtos ao cliente (ENTREGA)
- Cancelamento da compra (CANCELAMENTO)
- Devolução do produto por parte do cliente mediante um cancelamento (DEVOLUÇÃO)
** Entidades de tipo
- Forma de Pagamento (Formas de Pag)
** Entidades relacionadas
- Forma de pagamento do cliente (pagamento)
- Produtos que o terceiro oferece (RELAÇÃO DE PROD. TERCEIROS)
- Status de produtos em estoque (PRODUTO/ESTOQUE)
- Relação de requerimento de produto (FORNECIMENTO DO PRODUTO)
- Produtos em estoque (ProdutoEstoque)
- Compra de produto pelo cliente (RELAÇAO PRODUTO/PEDIDO)
** Contexto
- Cliente pode ter mais de uma forma de pagamento;
- Cliente pode ter mais de um pedido;
- Informação de data prevista de entrega do produto;
- Cliente pode verificar o preço do produto;
- A qualquer momento o cliente pode verificar o status do pedido e da entrega;
- Possibilidade de cancelamento do pedido a qualquer momento, mesmo a entrega já tendo sido feita.
- Prazo de devolução após a entrega.
- Terceiros podem utilizar o site para realizar venda;
- Indicação de quem vende e entrega o produto;
- Indicação de produto disponível.
