import pandas as pd
import sqlite3

# --- Configuração ---
csv_file_path = 'dados_traduzidos_br.csv'  # Nome do seu arquivo CSV
db_file_path = 'data_science_jobs.db'           # Nome do banco de dados que será criado
table_name = 'job_postings'                     # Nome da tabela que vamos criar dentro do banco

# --- Lógica do Script ---
try:
    # Carrega o arquivo CSV para um DataFrame do Pandas
    print(f"Lendo o arquivo CSV: {csv_file_path}...")
    df = pd.read_csv(csv_file_path)
    print("Leitura do CSV concluída com sucesso.")

    # Conecta (ou cria) o banco de dados SQLite
    print(f"Conectando ao banco de dados: {db_file_path}...")
    conn = sqlite3.connect(db_file_path)
    print("Conexão estabelecida.")

    # Salva o DataFrame na tabela do SQLite
    # O parâmetro if_exists='replace' irá substituir a tabela se ela já existir.
    # Isso é útil se você precisar rodar o script novamente.
    print(f"Inserindo dados na tabela '{table_name}'...")
    df.to_sql(table_name, conn, if_exists='replace', index=False)
    print("Dados inseridos com sucesso!")

    # Fecha a conexão com o banco de dados
    conn.close()
    print(f"Processo finalizado. O banco de dados '{db_file_path}' foi criado/atualizado.")

except FileNotFoundError:
    print(f"ERRO: O arquivo '{csv_file_path}' não foi encontrado. Verifique se ele está na mesma pasta que o script.")
except Exception as e:
    print(f"Ocorreu um erro inesperado: {e}")