CREATE DATABASE estacionamento;
USE estacionamento;

-- Criação de tabelas e inserção de dados iniciais

CREATE TABLE clientes (
	id INT PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(50) NOT NULL,
	telefone VARCHAR(20) NOT NULL
);

INSERT INTO clientes (nome, cpf, telefone) VALUES
('Carlos Silva', '11013477245', '48811031757'),
('Ana Souza', '86926640389', '48784552991'),
('Pedro Santos', '86012091678', '48161910430'),
('Mariana Oliveira', '78010639184', '48027378798'),
('João Costa', '65435877972', '48340594749'),
('Fernanda Almeida', '92646211896', '48073302971'),
('Lucas Pereira', '55875747164', '48226085967'),
('Beatriz Lima', '76374422775', '48043567049');



CREATE TABLE veiculos (
	id INT PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL,
	placa VARCHAR(10) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cor VARCHAR(20) NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

INSERT INTO veiculos (tipo, placa, modelo, cor, id_cliente) VALUES
('carro', 'JYN5793', 'Toyota Corolla', 'Red', 1),
('carro', 'JYN5793', 'Toyota Etios', 'Grey', 1),
('moto', 'JCI8677', 'Honda CG 150', 'Blue', 2),
('moto','CGF1173', 'Yamaha Fazer 160', 'Black', 3),
('carro','BYA2545', 'Chevrolet Cruze', 'White', 4),
('carro','RTG9617', 'Volkswagen Golf', 'Silver', 5),
('moto','THT3105', 'Honda Biz', 'Green', 6),
('carro','MJX4865', 'Nissan Sentra', 'Yellow', 7),
('moto','SXP9791', 'Honda Pop 100', 'Grey', 8);

CREATE TABLE registro (
	id INT PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    
    id_veiculo INT NOT NULL,
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id),

    data_hora_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    data_hora_saida TIMESTAMP NOT NULL,
    valor_pagar DECIMAL(10,2) NOT NULL
);

INSERT INTO registro (id_cliente, id_veiculo, data_hora_saida, valor_pagar) VALUES
(1, 10, '2025-02-10 13:00:01.000000', 15.0);
-- '1970-01-01 00:00:01'

-- Exibir tabelas criadas

SELECT * FROM veiculos;
SELECT * FROM clientes;
SELECT * FROM registro;