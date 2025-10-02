import pandas as pd
import json

# --- Configuração ---
csv_entrada = 'data_science_job_posts_2025.csv'
arquivo_saida_json = 'dicionario_para_traduzir.json'
# Colunas que você sabe que não precisam de tradução (ex: IDs, datas, etc.)
colunas_para_ignorar = ['post_date', 'company_size', 'revenue', 'salary']

print(f"Analisando o arquivo '{csv_entrada}' para encontrar valores únicos...")

try:
    df = pd.read_csv(csv_entrada)
    
    # Dicionário que vai guardar todas as colunas e seus valores únicos
    mapa_completo = {}

    # Seleciona apenas as colunas de texto (tipo 'object' no pandas)
    colunas_de_texto = df.select_dtypes(include=['object']).columns

    for coluna in colunas_de_texto:
        if coluna not in colunas_para_ignorar:
            # Pega todos os valores únicos, remove valores nulos (NaN) e os ordena
            valores_unicos = sorted([str(valor) for valor in df[coluna].unique() if pd.notna(valor)])
            
            # Cria um dicionário onde a chave e o valor são iguais, para facilitar a tradução
            mapa_coluna = {valor: valor for valor in valores_unicos}
            mapa_completo[coluna] = mapa_coluna
            print(f"  - Coluna '{coluna}' analisada. {len(valores_unicos)} valores únicos encontrados.")

    # Salva o dicionário gigante em um arquivo JSON bem formatado
    with open(arquivo_saida_json, 'w', encoding='utf-8') as f:
        json.dump(mapa_completo, f, indent=4, ensure_ascii=False)

    print(f"\nAnálise concluída! O arquivo '{arquivo_saida_json}' foi criado.")
    print("Sua próxima tarefa: edite este arquivo e substitua os valores em inglês pelos equivalentes em português.")

except FileNotFoundError:
    print(f"ERRO: O arquivo '{csv_entrada}' não foi encontrado.")
except Exception as e:
    print(f"Ocorreu um erro: {e}")