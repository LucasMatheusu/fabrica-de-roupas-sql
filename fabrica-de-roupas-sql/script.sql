CREATE DATABASE IF NOT EXISTS Fabrica_De_roupas;
USE Fabrica_De_roupas;

CREATE TABLE funcionarios (
    Id_funcionario INT,
    nome VARCHAR(100),
    setor VARCHAR(100)
);

CREATE TABLE Roupas (
    Id_roupa INT,
    Tamanho VARCHAR(100),
    nome_peca VARCHAR(100),
    preco_peca INT
);

create table producao (
    Id_producao int,
    Id_funcionario int,
    Id_roupa int,
    quantidade int,
    data_producao int

)

insert into funcionarios(Id_funcionario, nome, setor)
values (1, 'carlos', 'costura'),  
       (2, 'patricia', 'costura'),
       (3, 'marcos', 'corte'),
       (4, 'jana', 'Tinturaria'),
       (5, ' carla', 'Tinturaria'),
       (6, 'lanna', 'logistica'),
       (7, 'marcela', 'corte'),
       (8, 'rose', 'Lider')

insert into Roupas (Id_roupa, Tamanho, nome_peca, preco_peca)
values (1, 'M', 'Camisa basica', 50),
       (2, 'G', 'Vestido', 120),
       (3, 'PP', 'Calca jeans', 90),
       (4, 'M', 'Vestido longo', 140),
       (5, 'G', 'Casaco', 78),
       (6, 'P', 'camisa xadrez', 60)

insert into producao (Id_producao, Id_funcionario, Id_roupa, quantidade, data_producao )
values (1, 1 , 1, 30, '2026-10-07'),
       (2, 2, 6, 40, '2026-10-07'),
       (3, 3, 4, 28, '2026-10-07'),
       (4, 4 , 2, 80, '2026-10-07'),
       (5, 5, 3, 110, '2026-10-07'),
       (6, 6 ,2, 45, '2026-10-07'),
       (7, 6 ,5, 95, '2026-10-07'),
       (8, 8, 1, 90, '2026-10-07')

ALTER TABLE producao MODIFY data_producao DATE;

SELECT f.nome, SUM(p.quantidade) AS total_produzido
FROM producao p
JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
GROUP BY f.nome
ORDER BY total_produzido DESC

SELECT funcionarios.nome, Roupas.nome_peca, producao.quantidade
FROM producao
JOIN funcionarios ON producao.id_funcionario = funcionarios.id_funcionario
JOIN Roupas ON producao.id_roupa = Roupas.id_roupa