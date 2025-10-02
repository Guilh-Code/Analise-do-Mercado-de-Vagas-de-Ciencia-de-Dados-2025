import pandas as pd
import json

# --- Configuração ---
csv_entrada = 'data_science_job_posts_2025.csv'
arquivo_dicionario = 'dicionario_para_traduzir.json'
csv_saida_traduzido = 'dados_traduzidos_br.csv' # Nome do arquivo final traduzido

print("Iniciando o processo de tradução...")

try:
    # Carrega o dicionário com as traduções
    with open(arquivo_dicionario, 'r', encoding='utf-8') as f:
        mapa_de_traducao = json.load(f)
    print("Dicionário de tradução carregado.")

    # Carrega o CSV original
    df = pd.read_csv(csv_entrada)
    print("CSV original carregado.")

    # Itera sobre cada coluna que está no nosso dicionário
    for coluna, mapa in mapa_de_traducao.items():
        print(f"  - Traduzindo coluna '{coluna}'...")
        # A função .replace() do pandas é perfeita para isso!
        df[coluna] = df[coluna].replace(mapa)
    
    # Salva o novo DataFrame em um novo arquivo CSV
    df.to_csv(csv_saida_traduzido, index=False, encoding='utf-8-sig')
    
    print(f"\nTradução concluída com sucesso! O arquivo '{csv_saida_traduzido}' foi gerado.")

except FileNotFoundError:
    print(f"ERRO: Verifique se os arquivos '{csv_entrada}' e '{arquivo_dicionario}' existem.")
except Exception as e:
    print(f"Ocorreu um erro: {e}")