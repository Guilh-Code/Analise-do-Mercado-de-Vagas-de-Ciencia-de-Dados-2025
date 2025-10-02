-- Pergunta: Quais são as 3 indústrias que mais publicam vagas para Cientista de Dados Sênior?

-- Objetivo: Entender em qual setor um profissional experiente tem mais oportunidades.

SELECT industry,
       count(*) AS total_vagas 
FROM job_postings

WHERE job_title = 'Cientista de Dados'
AND seniority_level = 'Sênior'

GROUP BY industry
ORDER BY total_vagas DESC
LIMIT 3;



-- Pergunta: Quantas vagas possuem um salário definido como uma faixa salarial (contendo o símbolo "-") e quantas possuem um valor único?

-- Objetivo: Compreender a distribuição dos formatos de salário para planejar como vamos limpá-los.

WITH tb_faixa_sal AS (

    SELECT 'faixa_salarial' AS grupo,
            count(*) total_vagas

    FROM job_postings
    WHERE salary LIKE '%-%'
),

tb_valor_unico AS (

    SELECT 'valor_unico' AS grupo,
            count(*) AS total_vagas

    FROM job_postings
    WHERE salary NOT LIKE '%-%'
)

SELECT * FROM tb_faixa_sal
UNION ALL
SELECT * FROM tb_valor_unico;



-- Pergunta: Das vagas para "Engenheiro de Machine Learning", quantas mencionam a tecnologia 'aws' em suas habilidades?

-- Objetivo: Investigar a relevância de uma tecnologia específica para um cargo específico.

SELECT job_title,
       count(*) total_vagas_aws

FROM job_postings

WHERE job_title = 'Engenheiro de Machine Learning'
AND skills LIKE '%aws%'

GROUP BY job_title;



-- Pergunta: Qual a porcentagem de vagas que NÃO possuem informação de senioridade (seniority_level é nulo)?

-- Objetivo: Quantificar o problema de dados nulos que encontramos na análise inicial.

SELECT ROUND(1. * count(CASE WHEN seniority_level IS NULL THEN 1 END) * 100 / count(*), 2) AS total_vagas_nulls_porc

FROM job_postings;
