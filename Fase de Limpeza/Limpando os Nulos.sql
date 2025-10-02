-- Consertando a Senioridade

-- Pergunta: Como podemos preencher os 60 valores nulos da coluna seniority_level com o texto 'Não Informado'?

UPDATE job_postings
SET

    seniority_level = CASE 
                        WHEN seniority_level IS NULL THEN 'Não Informado'
                        ELSE seniority_level
                      END,


    job_title = CASE 
                        WHEN job_title IS NULL THEN 'Não Informado'
                        ELSE job_title
                      END,


    --Pergunta: E para os 256 valores nulos da coluna status? Como fazemos a mesma substituição?

    status = CASE
                WHEN status IS NULL THEN 'Não Informado'
                ELSE status
             END;


-- Consulta de Verificação 1:
SELECT seniority_level,
       count(*) AS total_vagas 
FROM job_postings
GROUP BY seniority_level
ORDER BY total_vagas DESC;

-- Consulta de Verificação 2:
SELECT status,
       count(*) AS total_vagas 
FROM job_postings
GROUP BY status
ORDER BY total_vagas DESC;