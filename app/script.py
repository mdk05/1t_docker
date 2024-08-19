import psycopg2
import time

import psycopg2
import os

def get_min_max_age():
    try:
        connection = psycopg2.connect(
            host=os.getenv('DATABASE_HOST', 'localhost'),
            port=os.getenv('DATABASE_PORT', 5432),
            dbname=os.getenv('DATABASE_NAME', 'kondratev'),
            user=os.getenv('DATABASE_USER', 'postgres'),
            password=os.getenv('DATABASE_PASSWORD', 'postgres')
        )
        cursor = connection.cursor()
        cursor.execute("SELECT MIN(age), MAX(age) FROM test_table;")
        min_age, max_age = cursor.fetchone()
        print(f"Minimum age: {min_age}, Maximum age: {max_age}")
    except Exception as e:
        print(f"Error while connecting to PostgreSQL: {e}")
    finally:
        if 'connection' in locals():
            connection.close()

if __name__ == "__main__":
    time.sleep(10)
    get_min_max_age()

