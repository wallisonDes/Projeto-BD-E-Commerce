-- criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela Cliente
create table client(
		idClient int auto_increment primary key,
        tipo enum ('Física','Jurídica') not null,
		Fnamer varchar (45) not null,
        CPFCNPJ varchar (14) not null,
        contato int not null,
        Address varchar (30) not null,
        constraint unique_cpf_client unique (CPFCNPJ)
);

alter table client auto_increment = 1;

-- cirar tabela Produto

create table produto (
		idProduto int auto_increment primary key,
        nome varchar (45) not null,
        categoria enum ('Eletrônico','Eletrodoméstico','Informática') ,
        descricao varchar (220) not null,
        valor float
);

alter table produto auto_increment = 1;

-- criar tabela Tercerizado

create table terceirizado(
		idTerceirizado int auto_increment primary key,
        razaos varchar (45) not null,
        CNPJ varchar (14) not null,
        contato int not null,
        Address varchar (30) not null,
        constraint unique_cnpj_fornecedor unique (CNPJ)
);

alter table terceirizado auto_increment = 1;

--  criar relação com produto e tercerizado

create table ProdTerceirizado(
		primary key (idTerceirizado,idProduto),
		idTerceirizado int,
        idProduto int,
        Quantidade int default 0,
        constraint fk_ProdTerceirizado_terceirizado foreign key(idTerceirizado) references terceirizado (idTerceirizado),
        constraint fk_ProdTerceirizado_produto foreign key (idProduto) references produto (idProduto)
);

-- criar tabela Fornecedor

create table fornecedor (
		idFornecedor int auto_increment primary key,
        razaos varchar (45) not null,
        CNPJ varchar (14) not null,
        contato int not null,
        Address varchar (30) not null,
        constraint unique_cnpj_fornecedor unique (CNPJ)
);

alter table fornecedor auto_increment = 1;

-- criar tabela de relação fornecedor e produto

create table RFornproduto(
		primary key (idProduto, idFornecedor),
		idProduto   int not null,
		idFornecedor  int not	null,
        constraint fk_RFornproduto_produto foreign key(idProduto) references produto (idProduto),
		constraint fk_RFornproduto_fornecedor foreign key(idFornecedor) references fornecedor (idFornecedor)
);

-- criar tabela Estoque

create table estoque(
		idEstoque int auto_increment primary key,
        Address varchar (30) not null
);

alter table estoque auto_increment = 1;

-- criar tabela relação de produto e estoque

create table RPorestoque(
		primary key (idProduto, idEstoque),
		idProduto   int not null,
		idEstoque   int not	null,
        Quantidade int default 0,
		constraint fk_RPorestoque_produto foreign key(idProduto) references produto (idProduto),
		constraint fk_RPorestoque_estoque foreign key(idEstoque) references estoque (idEstoque)
);

-- criar tabela formas de pagamento

create table fpagamento (
		idFPag int auto_increment primary key,
        FDescricao varchar (45) not null
);

alter table fpagamento auto_increment = 1;

-- criar tabela da relação cliente e pagamento

create table pagamento(
		idTipopag int auto_increment primary key,
        idTPClient int not null,
        idPFPag int not null,
        PTTipo enum ('PIX','CARTÃO DE CRÉDITO','CARTÃO DE DÉBITO','BOLETO') not null,
        PTNum varchar (16) not null,
        PTValidade date not null,
        constraint fk_pagamento_client foreign key(idTPClient) references client (idClient),
        constraint fk_pagamento_fpagamento foreign key(idPFPag) references fpagamento (idFPag)        
);

alter table pagamento auto_increment = 1;

-- criar tabela Pedido

create table pedido(
		idPedido int auto_increment primary key,
        idPClient int,
        idTipopag int,
        PStatus enum ('Processando', 'Confirmado', 'Cancelado') default 'Processando',
        PDescicao varchar (255) not null,
        PFrete float default 10 not null,
        PVTotal float not null,
        constraint fk_pedido_client foreign key(idPClient) references client (idClient),
        constraint fk_pedido_pagamento foreign key (idTipopag) references pagamento (idTipopag)
);

alter table pedido auto_increment = 1;

ALTER TABLE pedido ADD COLUMN status_entrega ENUM('PENDENTE', 'CONCLUÍDO') DEFAULT 'PENDENTE';
ALTER TABLE pedido ADD COLUMN data_entrega DATE;

-- criar tabela relação produto/pedido

create table RProdPed(
		primary key (idProduto, idPedido),
		idProduto   int not null,
		idPedido   int not	null,
		RPPQuantidade int default 0,
		constraint fk_RProdPed_produto foreign key(idProduto) references produto (idProduto),
		constraint fk_RProdPed_pedido foreign key(idPedido) references pedido (idPedido)
);

-- criar tabela de entrega

create table entrega(
		idEntrega int auto_increment primary key,
        idPedido int,
        idClient int,
        DPrevista date not null,
        CodRastreio varchar (45) not null,
        EStatus enum ('EM TRANSPORTE','ENTREGUE','CANCELADO','NÃO ENCONTRADO'),
        constraint fk_entrega_pedido foreign key(idPedido) references pedido (idPedido),
        constraint fk_entrega_client foreign key(idClient) references client (idClient)
);

alter table entrega auto_increment = 1;

ALTER TABLE entrega ADD COLUMN Edata_entrega datetime;

-- criar tabela devoluçãoptimize

create table devolucao(
		idDevolucao int auto_increment primary key,
        idEntrega int,
        idClient int,
        idPedido int,
        DDescricao varchar (255) not null,
        DPrazoDev date not null,
        Dvalor float not null,
        constraint fk_devolucao_entrega foreign key(idEntrega) references entrega (idEntrega),
        constraint fk_devolucao_pedido foreign key(idPedido) references pedido (idPedido),
        constraint fk_devolucao_client foreign key(idClient) references client (idClient)
);

alter table devolucao auto_increment = 1;

-- criar tabela de cancelamento

create table cancelamento(
		idCancelamento int auto_increment primary key,
        idPedido int,
        idDevolucao int,
        TipoDevValor enum ('PARCIAL','TOTAL') not null,
        Dentrega datetime,
        DATCancel datetime,
        constraint fk_cancelamento_pedido foreign key(idPedido) references pedido (idPedido),
        constraint fk_cancelamento_devolucao foreign key(idDevolucao) references devolucao (idDevolucao)
);

alter table cancelamento auto_increment = 1;

