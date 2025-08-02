# K8s Bank Message Demo

## Descrição

Este projeto demonstra a integração de um sistema de mensagens bancárias utilizando Kubernetes. Ele é composto por três principais componentes:

- **Backend**: Implementado em PHP, responsável por processar as mensagens.
- **Database**: Contém o banco de dados SQL para armazenar as mensagens.
- **Frontend**: Interface web para interação com o sistema.

## Estrutura do Projeto

```plaintext
backend/
    conexao.php
    dockerfile
    index.php

database/
    dockerfile
    sql.sql

frontend/
    css.css
    index.html
    js.js

deployment.yml
services.yml
script.bat
```

## Pré-requisitos

- Docker
- Kubernetes (kubectl configurado)

## Passos para Configuração

1. **Construir as imagens Docker**:

   ```bash
   docker build -t aleclemente/projeto-backend:1.0 backend/.
   docker build -t aleclemente/projeto-database:1.0 database/.
   ```

2. **Fazer o push das imagens para o Docker Hub**:

   ```bash
   docker push aleclemente/projeto-backend:1.0
   docker push aleclemente/projeto-database:1.0
   ```

3. **Criar os serviços no cluster Kubernetes**:

   ```bash
   kubectl apply -f ./services.yml
   ```

4. **Criar os deployments**:

   ```bash
   kubectl apply -f ./deployment.yml
   ```

5. **Verificar serviços**:

   ```bash
   kubectl.exe get service
   ```

6. **Atualizar URL do LoadBalancer no frontend**:

    Executar o comando da etapa 5 acima, verificar o service com **NAME** **PHP** e **TYPE** **LoadBalancer**, e copiar o valor indicado no **EXTERNAL-IP** e colar no arquivo **frontend/js.js** linha 8 nas aspas onde tem: **url: "http://EXTERNAL-IP"**

7. **Testar envio de mensagem**

    Abrir arquivo **frontend/index.html** e Enviar uma mensagem.

8. **Verificar funcionamento da aplicação**

    Entrar no container que tem o banco de dados com name iniciando com **mysql...**

   ```bash
   kubectl.exe exec --tty --stdin mysql... -- /bin/bash
   ```

    Acessar o banco mysql:

   ```bash
   mysql -u root -p
   ```

    Acessar o banco de dados **meubanco**:

   ```bash
   mysql> use meubanco
   ```

    Consultando mensagens da tabela **mensagens**:

   ```bash
   mysql> select * FROM mensagens;
   ```
