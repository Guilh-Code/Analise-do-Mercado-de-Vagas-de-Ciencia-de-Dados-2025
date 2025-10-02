-- Pergunta: Qual é a média salarial (salario_avg) para cada nível de senioridade, ordenada do menor para o maior salário?

-- Objetivo: Entender numericamente a progressão de carreira em termos de remuneração.

SELECT seniority_level,
       ROUND(AVG(salario_avg), 2) AS media_salarial

FROM job_postings

GROUP BY seniority_level
ORDER BY media_salarial;



-- Pergunta: Qual cargo (job_title) tem a maior média de salário máximo (salario_max) oferecido?

-- Objetivo: Identificar qual dos cargos em nosso dataset oferece o maior potencial de ganho no topo da faixa.

SELECT job_title,
       ROUND(AVG(salario_max), 2) AS media_salario_max 

FROM job_postings

GROUP BY job_title
ORDER BY media_salario_max;



-- Pergunta: Qual a média salarial (salario_avg) para cada modalidade de trabalho (status)?

-- Objetivo: Verificar se existe uma diferença salarial significativa entre vagas remotas, híbridas e presenciais.

SELECT status,
       ROUND(AVG(salario_avg), 2) AS media_salarial_status 

FROM job_postings
GROUP BY status
ORDER BY media_salarial_status;
