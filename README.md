# doctor

```bash
docker build . -t coeus77/doctor
docker run -e VERSION=0.0.1 -p 5000:5000 coeus77/doctor
```

## Integration with Heroku

```bash
# under current directory where Dockerfile is
heroku container:login
heroku container:push web
heroku container:release web
```

## Deploy to K8s

```bash
kubectl apply -f deployment/deployment.yaml
kubectl apply -f deployment/svc.yaml

# note down nodePort number
k8s get services -o yaml | grep nodePort -C 5

# note down External IP
kubectl get nodes -o yaml | grep ExternalIP -C 1

curl http://<External-IP>:<nodePort> -k

# check version
curl http://<External-IP>:<nodePort>/version -k
```
