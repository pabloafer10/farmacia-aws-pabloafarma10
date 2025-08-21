# Plataforma de Farmácia na AWS — Abstergo Industries

Repositório de referência do desafio DIO: plataforma virtual de farmácia utilizando **Amazon S3 + CloudFront**, **Amazon RDS (MySQL)** e **AWS Lambda + API Gateway**.

## Estrutura
```
.
├── RELATORIO_IMPLEMENTACAO_AWS.md
├── assets/
│   └── diagrama_arquitetura.png
├── sql/
│   └── schema_mysql.sql
├── lambda/
│   ├── index.js
│   └── package.json
└── api/
    └── openapi.yaml
```

## Como usar
1. Deploy de front-end estático no **S3** e distribuição via **CloudFront**.
2. Crie um banco **RDS MySQL** e aplique o script em `sql/schema_mysql.sql`.
3. Faça deploy da função **Lambda** (diretório `lambda/`) e exponha via **API Gateway** conforme `api/openapi.yaml`.

> Este repositório é educativo. Ajuste nomes de recursos, credenciais e políticas IAM antes de usar em produção.
