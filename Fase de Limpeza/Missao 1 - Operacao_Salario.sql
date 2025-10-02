-- Primeiro, vamos adicionar as colunas à nossa tabela
-- ALTER TABLE job_postings ADD COLUMN salario_min REAL;
-- ALTER TABLE job_postings ADD COLUMN salario_max REAL;
-- ALTER TABLE job_postings ADD COLUMN salario_avg REAL;


-- Agora, vamos preencher essas colunas com um UPDATE
UPDATE job_postings
SET 
    salario_min = CAST(
        CASE
            -- Caso 1: Se o salário contém um hífen (é uma faixa)

            WHEN salary LIKE '%-%' THEN 
                -- Limpa os símbolos e pega a parte ANTES do hífen
                TRIM(SUBSTR(REPLACE(REPLACE(salary, '€', ''), ',', ''), 1, INSTR(REPLACE(REPLACE(salary, '€', ''), ',', ''), '-') - 1))

            -- Caso 2: Se não contém um hífen (é um valor único)

            ELSE 
                -- Apenas limpa os símbolos
                TRIM(REPLACE(REPLACE(salary, '€', ''), ',', ''))

        END 
        AS REAL
    ),
    salario_max = CAST(
        CASE
            -- Caso 1: Se o salário contém um hífen (é uma faixa)

            WHEN salary LIKE '%-%' THEN 
                -- Limpa os símbolos e pega a parte DEPOIS do hífen
                TRIM(SUBSTR(REPLACE(REPLACE(salary, '€', ''), ',', ''), INSTR(REPLACE(REPLACE(salary, '€', ''), ',', ''), '-') + 1))

            -- Caso 2: Se não contém um hífen (é um valor único)

            ELSE 
                -- Apenas limpa os símbolos (o valor max é igual ao min)
                TRIM(REPLACE(REPLACE(salary, '€', ''), ',', ''))

        END 
        AS REAL
    );


-- Por fim, calculamos a média
UPDATE job_postings
SET salario_avg = (salario_min + salario_max) / 2;


SELECT salary,
       salario_min,
       salario_max,
       salario_avg  
FROM job_postings
LIMIT 20;