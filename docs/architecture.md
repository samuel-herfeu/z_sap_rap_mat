# Arquitetura do projeto

## Objetivo
Demonstrar um cenário SAP moderno com RAP + Fiori Elements sobre dados mestres e de valoração.

## Camadas

### 1. Tabelas base
- MARA
- MAKT
- MARC
- MBEW

### 2. Interface View
- `Z_I_MaterialRoot`
- Consolida dados logísticos e financeiros

### 3. Projection View
- `Z_C_MaterialRoot`
- Expõe somente os campos necessários para consumo

### 4. UI View
- `ZUI_C_MaterialRoot`
- Define a experiência de List Report / Object Page

### 5. RAP
- Behavior Definition
- Behavior Projection
- Classe de implementação

### 6. Serviço
- Service Definition
- Service Binding OData V4 - UI

### 7. Consumo
- Fiori Elements

## Benefícios da abordagem
- separação clara por camadas
- reutilização de modelo
- manutenção simplificada
- base pronta para expansão futura
