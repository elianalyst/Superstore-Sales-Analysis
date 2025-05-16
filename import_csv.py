import sqlite3
import pandas as pd

# Try a more flexible encoding
df = pd.read_csv("Sample - Superstore.csv", encoding="latin1")

# Create SQLite DB
conn = sqlite3.connect("superstore.db")
df.to_sql("superstore", conn, if_exists="replace", index=False)

print("CSV imported into superstore.db successfully.")