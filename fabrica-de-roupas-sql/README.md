Aqui tens o texto completo do README.md pronto para copiares e colares no teu Bloco de Notas:

🏭 Sistema de Gestão de Fábrica de Roupas (SQL)
Projeto desenvolvido para praticar e consolidar conceitos fundamentais de modelagem de banco de dados relacional, estruturação de tabelas, chaves estrangeiras, manipulação de dados (INSERT), correções de tipos (ALTER TABLE) e consultas avançadas utilizando JOIN, SUM, GROUP BY e ORDER BY.

📋 Sobre o Projeto
O objetivo deste banco de dados é simular o controlo de produção de uma fábrica de vestuário. O sistema gere o registo de funcionários, o catálogo de peças de roupa fabricadas e o histórico diário da produção industrial.

🗄️ Estrutura do Banco de Dados (Schema)
O banco de dados é composto por 3 tabelas principais:

funcionarios: Armazena os dados da equipa e os respetivos setores.

id_funcionario (INT, Chave Primária)

nome (VARCHAR)

setor (VARCHAR)

roupas: Contém o catálogo de peças de vestuário produzidas.

id_roupa (INT, Chave Primária)

tamanho (VARCHAR)

nome_peca (VARCHAR)

preco_peca (DECIMAL/FLOAT)

producao: Tabela de relacionamento (movimento) que regista o fabrico diário.

id_producao (INT, Chave Primária)

id_funcionario (INT, Chave Estrangeira ligada a funcionarios)

id_roupa (INT, Chave Estrangeira ligada a roupas)

quantidade (INT)

data_producao (DATE)

🚀 Principais Consultas (Queries SQL)
Aqui estão alguns exemplos das consultas desenvolvidas no projeto:

1. Relatório Completo de Produção (Cruzamento com JOIN)
Une as três tabelas para transformar IDs num relatório legível com o nome do funcionário e a peça produzida:

SQL
SELECT funcionarios.nome, roupas.nome_peca, producao.quantidade
FROM producao
JOIN funcionarios ON producao.id_funcionario = funcionarios.id_funcionario
JOIN roupas ON producao.id_roupa = roupas.id_roupa;
2. Ranking de Produtividade por Funcionário (SUM e GROUP BY)
Calcula o total de peças fabricadas por cada colaborador, ordenando do mais produtivo para o menos produtivo:

SQL
SELECT f.nome, SUM(p.quantidade) AS total_produzido
FROM producao p
JOIN funcionarios f ON p.id_funcionario = f.id_funcionario
GROUP BY f.nome
ORDER BY total_produzido DESC;
🛠️ Tecnologias Utilizadas
MySQL / Servidor Relacional

PopSQL (Editor de consultas)

Git & GitHub (Controlo de versões)