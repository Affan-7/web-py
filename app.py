from flask import Flask, request, render_template
import io
import sys

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    result = ""
    code = "print('Hello, World!')"
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
    
    return render_template('index.html', code=code, result=result)


if __name__ == '__main__':
    app.run(debug=True)