import pandas as pd
from sqlalchemy import URL, create_engine
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv(".env")

connection_string = URL.create(
  'postgresql',
  username=os.getenv("PGUSER"), # You can alternatively paste your information directly, but you shouldn't do so in any of your uploaded files as your secrets will be exposed
  password=os.getenv("PGPASSWORD"),
  host=os.getenv("PGHOST"),
  database=os.getenv("PGDATABASE")
)

engine = create_engine(connection_string)

csv_files = {
    "math": "raw-data/student-mat-min.csv",
    "portuguese": "raw-data/student-por-min.csv"
}

for db_name, db_file in csv_files.items():
    df = pd.read_csv(db_file, sep = ",") # Load data from csv file
    df.to_sql(db_name, engine, if_exists='replace', index=False) # Upload data to database
    print(f"Successfully uploaded database {db_name}")

engine.dispose() # Good practice: close the connection to your database once you are done interacting with it