helm install apache -f apacheValues.yaml bitnami/apache
export SERVICE_IP=$(kubectl get svc --namespace default apache --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
echo URL            : http://$SERVICE_IP/

helm install db -f postValues.yaml bitnami/postgresql

#kubectl port-forward --namespace default svc/db-postgresql 5432:5432 &
#PGPASSWORD="$POSTGRES_PASSWORD" psql --host 127.0.0.1 -U hs -d sparkasse -p 5432

#apt install postgresql postgresql-contrib
#sudo psql --host <Cluster IP> -U hs -d sparkasse -p 5432

#CREATE TABLE tbl_acc(
#   pk SERIAL PRIMARY KEY
#);

#INSERT INTO tbl_acc(pk)
#VALUES(100);

#SELECT * FROM tbl_acc;