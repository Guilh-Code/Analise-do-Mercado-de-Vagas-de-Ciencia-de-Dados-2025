--Qual a estrutura da nossa tabela?

--Pergunta-chave: Quais são as colunas e que tipo de dado cada uma guarda?

PRAGMA table_info(job_postings);



-- Quantas vagas de emprego temos no total?

-- Pergunta-chave: Qual o nosso volume total de dados?

SELECT COUNT(*) AS total_vagas FROM job_postings;



-- Como são os dados na prática?

-- Pergunta-chave: Vamos espiar as 10 primeiras linhas para ter uma visão real dos registros.

SELECT * FROM job_postings LIMIT 10;



-- Quais são os níveis de senioridade e quantas vagas para cada um?

-- Pergunta-chave: O mercado procura mais por qual nível de experiência?

SELECT seniority_level,
       count(*) AS total_vagas  
FROM job_postings
GROUP BY seniority_level
ORDER BY total_vagas DESC;



-- Como as vagas se distribuem entre Remoto, Híbrido e Presencial?

-- Pergunta-chave: Qual a modalidade de trabalho dominante?

SELECT status,
       count(*) AS total_vagas
FROM job_postings
GROUP BY status
ORDER BY total_vagas DESC;



-- Quais são os 4 cargos (job_title) mais comuns?

-- Pergunta-chave: Qual é a "profissão do momento" em Ciência de Dados, segundo nosso dataset?

SELECT job_title,
       count(*) AS total_vagas 
FROM job_postings
GROUP BY job_title
ORDER BY total_vagas DESC;
