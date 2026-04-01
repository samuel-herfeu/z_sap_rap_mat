# Deploy / montagem no Eclipse ADT

## Pré-requisitos
- Eclipse com ADT
- acesso a sistema SAP S/4HANA compatível com RAP
- pacote Z* ou `$TMP`
- permissões para criação de CDS, behavior e service binding

## Ordem recomendada de criação

1. Criar `Z_I_MaterialRoot`
2. Criar `Z_C_MaterialRoot`
3. Criar `ZUI_C_MaterialRoot`
4. Criar Behavior Definition da root
5. Gerar a classe `ZCL_BP_I_MATERIALROOT`
6. Criar Behavior Projection
7. Criar Service Definition `ZUI_MATERIAL_ROOT_SRV`
8. Criar Service Binding `ZUI_MATERIAL_ROOT_BIND`
9. Publicar o binding
10. Abrir o preview Fiori

## Passo a passo resumido

### 1. CDS Views
No pacote escolhido:
- New → Data Definition
- criar e ativar os três objetos CDS

### 2. Behavior Definition
- botão direito na root entity
- New → Behavior Definition
- colar o conteúdo e ativar

### 3. Classe de implementação
- permitir que o ADT gere a classe
- substituir pelo conteúdo do arquivo ABAP
- ativar

### 4. Behavior Projection
- New → Behavior Definition Projection
- ativar

### 5. Service Definition
- New → Service Definition
- ativar

### 6. Service Binding
- New → Service Binding
- escolher `OData V4 - UI`
- ativar
- clicar em `Publish`

## Teste
- abrir o binding
- clicar em `Preview`
- validar lista, detalhe e botão de ação

## Observações importantes
- `MARA` é tabela standard; o projeto está configurado como base de demonstração e portfólio
- em cenários produtivos, escrita direta em tabelas standard deve ser tratada com muito critério
- para portfólio, o foco aqui é arquitetura, leitura, ação e validação
