DROP DATABASE IF EXISTS Hardway;

CREATE DATABASE IF NOT EXISTS Hardway;

USE Hardway;

CREATE TABLE IF NOT EXISTS Cliente(
    idCliente INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    RG CHAR(11) NOT NULL UNIQUE,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Senha VARCHAR(50) NOT NULL,
    PRIMARY KEY (idCliente)
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS Fornecedor(
    idFornecedor INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Telefone BIGINT NOT NULL UNIQUE,
    PRIMARY KEY (idFornecedor)
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS Categoria(
    idCategoria INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    PRIMARY KEY (idCategoria)
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS SubCategoria(
    idSubCategoria INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    idCategoria INT UNSIGNED NOT NULL,
    PRIMARY KEY (idSubCategoria),
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria) ON DELETE CASCADE
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS Produto(
    idProduto INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(50) NOT NULL,
    Preco DOUBLE NOT NULL,
    Descricao VARCHAR(400) NOT NULL,
    QtdeEstoque INT NOT NULL,
    idFornecedor INT UNSIGNED NOT NULL,
    idSubCategoria INT UNSIGNED NOT NULL,
    idCategoria INT UNSIGNED NOT NULL,
    PRIMARY KEY (idProduto, idFornecedor),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor) ON DELETE CASCADE,
    FOREIGN KEY (idSubCategoria) REFERENCES SubCategoria(idSubCategoria) ON DELETE CASCADE,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria) ON DELETE CASCADE
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS Compra(
    NumPedido INT UNSIGNED NOT NULL AUTO_INCREMENT,
    DataCompra DATE NOT NULL,
    Rua VARCHAR(45) NOT NULL,
    Numero INT NOT NULL,
    Bairro VARCHAR(45) NOT NULL,
    Cidade VARCHAR(45) NOT NULL,
    Estado VARCHAR(45) NOT NULL,
    Complemento VARCHAR(45),
    CEP CHAR(8) NOT NULL,
    ValorCompra DOUBLE NOT NULL,
    PRIMARY KEY (NumPedido)
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS Carrinho(
    idCliente INT UNSIGNED NOT NULL,
    idProduto INT UNSIGNED NOT NULL,
    NumPedido INT UNSIGNED NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE,
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) ON DELETE CASCADE,
    FOREIGN KEY (NumPedido) REFERENCES Compra(NumPedido) ON DELETE CASCADE
) ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
