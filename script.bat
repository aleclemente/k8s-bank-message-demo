echo "Criando as imagens......."
docker build -t aleclemente/projeto-backend:1.0 backend/.
docker build -t aleclemente/projeto-database:1.0 database/.

echo "Realizando o push das imagens...."
docker push aleclemente/projeto-backend:1.0
docker push aleclemente/projeto-database:1.0

echo "Criando servicos no cluster kubernetes..."
kubectl apply -f ./services.yml

echo "Criando os deployments....."
kubectl apply -f ./deployment.yml