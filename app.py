from flask import Flask, request, render_template
import io
import sys
import psycopg2
import os

app = Flask(__name__)

# Database connection
def get_db_connection():
    conn = psycopg2.connect(
        dbname='webpydb',
        user=os.getenv('DB_USERNAME'),
        password=os.getenv('DB_PASSWORD'),
        host='postgres-service',
        port='5432'
    )
    create_table_if_not_exists(conn)
    return conn

# Create the executions table if it doesn't exist
def create_table_if_not_exists(conn):
    with conn.cursor() as cur:
        cur.execute("""
            CREATE TABLE IF NOT EXISTS executions (
                id SERIAL PRIMARY KEY,
                code TEXT NOT NULL,
                result TEXT NOT NULL,
                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            );
        """)
        conn.commit()

@app.route('/', methods=['GET', 'POST'])
def index():
    result = ""
    code = "print('Hello, World!')"
    if request.method == 'POST':
        code = request.form['code']
        sys.stdout = io.StringIO()
        sys.stderr = io.StringIO()
        try:
            exec(code)  # Vulnerable to RCE
        except Exception as e:
            print(f"An error occurred: {e}", file=sys.stderr)
        finally:
            result = sys.stdout.getvalue() + sys.stderr.getvalue()
            # Store the code and result in the database
            conn = get_db_connection()
            cur = conn.cursor()
            cur.execute("INSERT INTO executions (code, result) VALUES (%s, %s)", (code, result))
            conn.commit()
            cur.close()
            conn.close()
    
    return render_template('index.html', code=code, result=result)

if __name__ == '__main__':
    app.run(debug=True)