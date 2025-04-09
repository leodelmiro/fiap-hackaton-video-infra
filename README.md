# Tech Challenge - Hackaton - Video para Imagens

# Índice

* [Índice](#índice)
* [Breve Descrição](#Breve-Descrição)
* [Demais repositórios](#Demais-repositórios)
* [Tecnologias Utilizadas](#Tecnologias-Utilizadas)
* [Desenho Solução](#Desenho-Solução)
* [Estrutura do Projeto](#Estrutura-do-Projeto)
* [Rodando o Projeto Local](#Rodando-o-Projeto-Local)

## Breve Descrição

Aplicação se trata de um Projeto Fiap Tech Challenge (Hackathon) - Software Architecture, simulando um projeto de uma
empresa que recebe videos e transforma em Imagens.

Este repositório é referente a Infra do repositório (Centralizando a infra da AWS da aplicação).

### Demais repositórios
- https://github.com/leodelmiro/fiap-hackaton-video-usuario
- https://github.com/leodelmiro/fiap-hackaton-video-recebe
- https://github.com/leodelmiro/fiap-hackaton-video-processa
- https://github.com/leodelmiro/fiap-hackaton-video-gerencia
- https://github.com/leodelmiro/fiap-hackaton-video-notifica
- https://github.com/leodelmiro/fiap-hackaton-video-gateway
- https://github.com/leodelmiro/fiap-hackaton-video-db

## Tecnologias Utilizadas

- Terraform
- AWS
- Kubernetes
- SQS
- SNS

## Desenho Solução

![Tech Challenge Hackathon Infra](./desenhos/arquitetura.png)

## Estrutura do Projeto

- .github: Arquivos com as actions.
- Desenhos: Arquivos relacionados aos desenhos do projeto.
- Infra: Arquivos terraform para criação do banco de dados.
    - terraform: Arquivos de criação do EKS, SQS, ECR.

## Rodando o Projeto Local

### 1. Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas:

- Terraform
- AWS CLI

### 2. Clonar o Repositório

Clone o repositório do projeto:

```sh
git clone https://github.com/leodelmiro/fiap-hackaton-video-infra
```

### 3. Executar o Script de Setup

O projeto inclui um script de setup (`setup.sh`) que automatiza o processo de construção e execução do projeto. O script
realiza as seguintes operações:

-

Para executar o script, siga os passos abaixo:

#### macOS e Linux

1. **Tornar o Script Executável**:

    ```sh
    chmod +x setup.sh
    ```

2. **Executar o Script**:

    ```sh
    ./setup.sh
    ```

#### Windows

1. **Executar o Script**:

   No PowerShell ou Git Bash:

    ```sh
    ./setup.sh
    ```
