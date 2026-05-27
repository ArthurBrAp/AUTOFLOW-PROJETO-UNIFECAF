CREATE DATABASE concessionaria;
USE concessionaria;

CREATE TABLE tb_cliente(
	id_cliente INT PRIMARY KEY 
AUTO_INCREMENT,
	nome VARCHAR(100),
	CPF VARCHAR(14),
	telefone VARCHAR(100),
	email VARCHAR(100)
);

CREATE TABLE tb_veiculo(
	id_veiculo INT PRIMARY KEY 
AUTO_INCREMENT,
	marca VARCHAR(100),
    modelo VARCHAR(100),
    ano INT,
    cor VARCHAR(30),
    status VARCHAR(30),
    condicao VARCHAR(30),
    numero_portas INT,
	cambio VARCHAR(30),
	motor VARCHAR(30),
	valor INT
);

CREATE TABLE tb_venda(
	id_venda INT PRIMARY KEY
AUTO_INCREMENT,
	data_venda DATE,
    valor_final DECIMAL(10,2),
    
    id_cliente INT,
    id_veiculo INT,
    
    FOREIGN KEY (id_cliente)
	REFERENCES tb_cliente(id_cliente),
    
    FOREIGN KEY (id_veiculo)
    REFERENCES tb_veiculo(id_veiculo)
    );

INSERT INTO tb_veiculo 
(marca, modelo, ano, cor, status, condicao, numero_portas, cambio, motor, valor)
VALUES
('Toyota', 'Corolla', 2022, 'Prata', 'Disponível', 'Seminovo', 4, 'Automático', '2.0', 125000),
('Honda', 'Civic', 2021, 'Preto', 'Disponível', 'Seminovo', 4, 'Automático', '2.0', 118000),
('Volkswagen', 'Gol', 2019, 'Branco', 'Disponível', 'Usado', 4, 'Manual', '1.6', 52000),
('Chevrolet', 'Onix', 2023, 'Vermelho', 'Disponível', 'Novo', 4, 'Manual', '1.0 Turbo', 98000),
('Hyundai', 'HB20', 2020, 'Cinza', 'Disponível', 'Seminovo', 4, 'Automático', '1.6', 73000),
('Fiat', 'Argo', 2022, 'Branco', 'Disponível', 'Novo', 4, 'Manual', '1.3', 85000),
('Jeep', 'Compass', 2021, 'Preto', 'Disponível', 'Seminovo', 4, 'Automático', '2.0', 165000),
('Renault', 'Kwid', 2018, 'Azul', 'Disponível', 'Usado', 4, 'Manual', '1.0', 42000),
('Nissan', 'Kicks', 2023, 'Cinza', 'Disponível', 'Novo', 4, 'Automático', '1.6', 132000),
('Ford', 'Ka', 2019, 'Prata', 'Disponível', 'Usado', 4, 'Manual', '1.5', 48000),
('BMW', '320i', 2022, 'Azul', 'Disponível', 'Seminovo', 4, 'Automático', '2.0 Turbo', 289000),
('Mercedes-Benz', 'C180', 2021, 'Branco', 'Disponível', 'Seminovo', 4, 'Automático', '1.6 Turbo', 275000),
('Audi', 'A3', 2020, 'Preto', 'Disponível', 'Seminovo', 4, 'Automático', '1.4 Turbo', 198000),
('Peugeot', '208', 2023, 'Amarelo', 'Disponível', 'Novo', 4, 'Manual', '1.0 Turbo', 89000),
('Citroën', 'C4 Cactus', 2021, 'Cinza', 'Disponível', 'Seminovo', 4, 'Automático', '1.6', 99000),
('Mitsubishi', 'L200', 2022, 'Prata', 'Disponível', 'Novo', 4, 'Automático', '2.4 Diesel', 245000),
('Toyota', 'Hilux', 2023, 'Branco', 'Disponível', 'Novo', 4, 'Automático', '2.8 Diesel', 315000),
('Chevrolet', 'Tracker', 2021, 'Azul', 'Disponível', 'Seminovo', 4, 'Automático', '1.2 Turbo', 119000),
('Volkswagen', 'T-Cross', 2022, 'Vermelho', 'Disponível', 'Novo', 4, 'Automático', '1.4 Turbo', 145000),
('Fiat', 'Toro', 2020, 'Preto', 'Disponível', 'Seminovo', 4, 'Automático', '2.0 Diesel', 138000),
('Honda', 'HR-V', 2023, 'Cinza', 'Disponível', 'Novo', 4, 'CVT', '1.5 Turbo', 182000),
('Hyundai', 'Creta', 2022, 'Branco', 'Disponível', 'Seminovo', 4, 'Automático', '2.0', 148000),
('Renault', 'Sandero', 2019, 'Prata', 'Disponível', 'Usado', 4, 'Manual', '1.0', 47000),
('Ford', 'Ranger', 2021, 'Azul', 'Disponível', 'Seminovo', 4, 'Automático', '3.2 Diesel', 229000),
('Jeep', 'Renegade', 2020, 'Verde', 'Disponível', 'Seminovo', 4, 'Automático', '1.8', 108000);

INSERT INTO tb_cliente
(nome, CPF, telefone, email)
VALUES
('Carlos Eduardo Silva', '123.456.789-10', '1198765-4321', 'carlos.silva@gmail.com'),
('Fernanda Oliveira Souza', '987.654.321-00', '2199877-6655', 'fernanda.souza@hotmail.com'),
('Marcos Vinicius Almeida', '321.654.987-11', '1199456-7788', 'marcos.almeida@gmail.com'),
('Juliana Ferreira Costa', '456.123.789-22', '2199345-6677', 'juliana.costa@hotmail.com'),
('Ricardo Mendes Lima', '741.852.963-33', '3199234-5566', 'ricardo.lima@yahoo.com'),
('Patricia Gomes Rocha', '852.741.369-44', '4199123-4455', 'patricia.rocha@gmail.com'),
('Lucas Henrique Souza', '963.258.147-55', '5199012-3344', 'lucas.souza@outlook.com'),
('Amanda Ribeiro Martins', '159.357.486-66', '6199901-2233', 'amanda.martins@gmail.com');

SELECT * FROM tb_cliente;
SELECT * FROM tb_veiculo;
SELECT * FROM tb_venda;
-- -----------------------------------------------------------------------------------------
-- Linhas da felicidade 
-- Erros que tive que corrigir ao longo do projeto
DELETE FROM tb_veiculo;
TRUNCATE TABLE tb_veiculo;

ALTER TABLE tb_veiculo
ADD COLUMN numero_portas INT,
ADD COLUMN cambio VARCHAR(30),
ADD COLUMN motor VARCHAR(30),
ADD COLUMN valor INT;

DELETE FROM tb_cliente
WHERE id_cliente IN (3, 4);

DELETE FROM tb_venda;
DELETE FROM tb_veiculo;
DELETE FROM tb_cliente;

DROP TABLE tb_veiculo;
DROP TABLE tb_venda;
DROP TABLE tb_cliente;