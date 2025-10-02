-- ALTER TABLE job_postings ADD COLUMN tem_python INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_sql INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_r INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_machine_learning INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_aws INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_spark INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_deep_learning INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_scikit_learning INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_tensorflow INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_pytorch INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_azure INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_gcp INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_tableau INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_pandas INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_git INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_java INTEGER;
-- ALTER TABLE job_postings ADD COLUMN tem_powerbi INTEGER;



UPDATE job_postings
SET

    tem_python = CASE WHEN skills LIKE '%python%' THEN 1 ELSE 0 END,
    tem_sql = CASE WHEN skills LIKE '%sql%' THEN 1 ELSE 0 END,
    tem_r = CASE WHEN skills LIKE "%'r'%" THEN 1 ELSE 0 END,
    tem_machine_learning = CASE WHEN skills LIKE '%machine learning%' THEN 1 ELSE 0 END,
    tem_aws = CASE WHEN skills LIKE '%aws%' THEN 1 ELSE 0 END,
    tem_spark = CASE WHEN skills LIKE '%spark%' THEN 1 ELSE 0 END,
    tem_deep_learning = CASE WHEN skills LIKE '%deep learning%' THEN 1 ELSE 0 END,
    tem_scikit_learning = CASE WHEN skills LIKE '%scikit-learn%' THEN 1 ELSE 0 END,
    tem_tensorflow = CASE WHEN skills LIKE '%tensorflow%' THEN 1 ELSE 0 END,
    tem_pytorch = CASE WHEN skills LIKE '%pytorch%' THEN 1 ELSE 0 END,
    tem_azure = CASE WHEN skills LIKE '%azure%' THEN 1 ELSE 0 END,
    tem_gcp = CASE WHEN skills LIKE '%gcp%' THEN 1 ELSE 0 END,
    tem_tableau = CASE WHEN skills LIKE '%tableau%' THEN 1 ELSE 0 END,
    tem_pandas = CASE WHEN skills LIKE '%pandas%' THEN 1 ELSE 0 END,
    tem_git = CASE WHEN skills LIKE '%git%' THEN 1 ELSE 0 END,
    tem_java = CASE WHEN skills LIKE '%java%' THEN 1 ELSE 0 END,
    tem_powerbi = CASE WHEN skills LIKE '%powerbi%' THEN 1 ELSE 0 END;

