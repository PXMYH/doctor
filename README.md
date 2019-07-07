# echo app

```bash
dockebuild . -t coeus77/echo
docke run -e VERSION=0.0.1 -p 5000:5000 coeus77/echo
```

## Integration with Heroku

```bash
# under current directory where Dockerfile is
heroku container:login
heroku container:push web
heroku container:release web
```
