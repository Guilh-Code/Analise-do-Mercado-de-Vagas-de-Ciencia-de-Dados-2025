-- ALTER TABLE job_postings ADD COLUMN estado TEXT;
-- ALTER TABLE job_postings ADD COLUMN pais TEXT;


UPDATE job_postings
SET pais = CASE
    -- 1º: Procurar por nomes de países específicos
    WHEN location LIKE '%India%' THEN 'IN'
    WHEN location LIKE '%United Kingdom%' THEN 'UK'
    WHEN location LIKE '%Germany%' THEN 'DE'
    WHEN location LIKE '%Spain%' THEN 'ES'
    WHEN location LIKE '%Brazil%' THEN 'BR'
    WHEN location LIKE '%Canada%' THEN 'CA'
    WHEN location LIKE '%Netherlands%' THEN 'NL'
    WHEN location LIKE '%Australia%' THEN 'AU'
    WHEN location LIKE '%Switzerland%' THEN 'CH'
    
    -- 2º: Aplicar as regras mais genéricas para os EUA
    WHEN location LIKE '%, __' THEN 'US'
    WHEN location LIKE '%, __ .%' THEN 'US'
    WHEN location LIKE '%United States%' THEN 'US'
    
    ELSE NULL 
END;

UPDATE job_postings
SET estado = UPPER( -- Garante que a sigla do estado fique sempre em maiúsculo
    TRIM(SUBSTR(location, INSTR(location, ',') + 1, 3))
)
WHERE pais = 'US' -- A MÁGICA: só executa essa lógica complexa se o país for 'US'
  AND location LIKE '%, __%'; -- Uma segurança extra para garantir o padrão


UPDATE job_postings
SET estado = NULL
WHERE pais IS NOT 'US';