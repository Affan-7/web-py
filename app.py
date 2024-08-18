from flask import Flask, request
import io
import sys

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    result = ""
    code = ""
    if request.method == 'POST':
        code = request.form['code']
        sys.stdout = io.StringIO()
        sys.stderr = io.StringIO()
        try:
            exec(code)              # Vulnerable to RCE
        except Exception as e:
            print(f"An error occurred: {e}", file=sys.stderr)
        finally:
            result = sys.stdout.getvalue() + sys.stderr.getvalue()
    
    return f'''
        <form method="post" action="/">
            <textarea name="code" rows="10" cols="30">{code}</textarea><br>
            <input type="submit" value="Execute">
        </form>
        <pre>{result}</pre>
    '''

if __name__ == '__main__':
    app.run(debug=True)