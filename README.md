# WebPy

WebPy is a web-based Python interpreter designed to demonstrate and mitigate
Remote Code Execution (RCE) vulnerabilities.

## Install dependencies

```bash
pip install -r requirements.txt
```

## Execute the app

```bash
gunicorn -w 4 -b 0.0.0.0:80 app:app
```

## Payload

```python
import subprocess
result = subprocess.run(['sudo', 'whoami'], capture_output=True, text=True)
print(result.stdout)
print(result.stderr)
```