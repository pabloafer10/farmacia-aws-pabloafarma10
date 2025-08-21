# RELATÓRIO DE IMPLEMENTAÇÃO DE SERVIÇOS AWS

**Data:** 21/08/2025  
**Empresa:** Pabloafarma10 Industries (Farmácia Fictícia)  
**Responsável:** Pablo Fernandes

## Introdução
Este relatório apresenta o processo de implementação de ferramentas na empresa **Pabloafarma10 Industries**, realizado por **Pablo Fernandes**.
O objetivo do projeto foi elencar **3 serviços AWS**, visando a criação de uma **plataforma virtual de farmácia** com **redução de custos, escalabilidade e alta disponibilidade**.

## Descrição do Projeto
O projeto foi dividido em 3 etapas, cada uma com seus objetivos específicos.

### Etapa 1: Armazenamento e Hospedagem do Site
- **Ferramenta:** Amazon S3 + Amazon CloudFront  
- **Foco:** Hospedagem estática de site e distribuição global de conteúdo.  
- **Caso de uso:** Front-end (catálogo, login/landing) hospedado no **S3** com distribuição via **CloudFront** para baixa latência.

### Etapa 2: Banco de Dados dos Produtos e Pedidos
- **Ferramenta:** Amazon RDS (MySQL)  
- **Foco:** Armazenamento relacional e seguro de dados críticos.  
- **Caso de uso:** Produtos, preços, estoque, usuários e pedidos no **RDS MySQL** com backups automáticos e escalabilidade.

### Etapa 3: Backend e Processamento de Pedidos
- **Ferramenta:** AWS Lambda + Amazon API Gateway  
- **Foco:** Backend serverless com alta disponibilidade e baixo custo.  
- **Caso de uso:** Processamento de pedidos, autenticação e integração com pagamentos em **Lambda** exposto pelo **API Gateway**.

## Conclusão
A implementação resultou em:
- **Redução de custos** (S3/CloudFront/Lambda sob demanda).
- **Escalabilidade automática** para picos de acesso.
- **Alta disponibilidade** e **segurança** (backups, criptografia e IAM).

Recomenda-se evoluir com **Amazon SNS** (notificações) e **Amazon QuickSight** (dashboards de vendas).

## Anexos
- Diagrama de Arquitetura (assets/diagrama_arquitetura.png)
- Script SQL (sql/schema_mysql.sql)
- Exemplo de Lambda (lambda/index.js)
- Especificação OpenAPI (api/openapi.yaml)
