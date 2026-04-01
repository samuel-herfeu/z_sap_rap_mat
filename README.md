# SAP RAP + Fiori Elements | Material + Plant + Valuation

Projeto de portfólio em estilo **cliente real**, construído para demonstrar arquitetura moderna no **SAP S/4HANA** com:

- **ABAP CDS View Entity**
- **RAP (RESTful ABAP Programming Model)**
- **Fiori Elements**
- **OData V4**
- **Modelagem em camadas**
- **Validações e ação customizada**

O cenário funcional reúne **Material + Centro + Valoração**, com foco em consulta e extensão futura para cenários transacionais.

---

## Objetivo do projeto

Criar uma aplicação RAP/Fiori para consulta de materiais com:

- dados básicos do material
- descrição por idioma da sessão
- dados por centro
- dados de valoração
- ação customizada de negócio
- validação de consistência
- documentação pronta para portfólio GitHub

---

## Escopo funcional

### Dados básicos
- Material
- Tipo de material
- Setor
- Grupo de mercadoria
- Unidade base
- Descrição

### Dados por centro
- Centro
- Controlador MRP
- Tipo de suprimento

### Dados de valoração
- Área de avaliação
- Classe de avaliação
- Controle de preço
- Preço padrão
- Preço médio móvel

---

## Arquitetura

### Tabelas SAP envolvidas
- `MARA` → dados básicos do material
- `MAKT` → descrição do material
- `MARC` → dados do material por centro
- `MBEW` → valoração do material

### Camadas RAP
1. **Interface View** → `Z_I_MaterialRoot`
2. **Projection View** → `Z_C_MaterialRoot`
3. **UI View** → `ZUI_C_MaterialRoot`
4. **Behavior Definition**
5. **Behavior Implementation**
6. **Service Definition**
7. **Service Binding (OData V4 - UI)**
8. **Fiori Elements List Report / Object Page**

---

## Estrutura do repositório

```text
z_sap_rap_material_real_client/
├── README.md
├── src/
│   ├── cds/
│   │   ├── z_i_materialroot.ddls.asddls
│   │   ├── z_c_materialroot.ddls.asddls
│   │   └── zui_c_materialroot.ddls.asddls
│   ├── behavior/
│   │   ├── z_i_materialroot.bdef.asbdef
│   │   └── z_c_materialroot.bdel.asbdel
│   ├── service/
│   │   ├── zui_material_root_srv.srvd.srvdsrv
│   │   └── zui_material_root_bind.txt
│   └── abap/
│       └── zcl_bp_i_materialroot.abap
├── docs/
│   ├── architecture.md
│   ├── deploy.md
│   ├── validation_and_action.md
│   └── business_scenario.md
└── test/
    └── ztest_material_root_query.abap
```

---

## Funcionalidades entregues

### 1. Consulta consolidada
A entidade principal reúne material, centro e valoração em uma única raiz de consumo.

### 2. Ação customizada RAP
Foi incluída uma ação de exemplo:
- `checkConsistency`

Objetivo:
- permitir validação funcional sob demanda
- simular comportamento de regra de negócio em cenário cliente real

### 3. Erro de validação
Foi incluída validação para cenário clássico:
- material com centro preenchido e sem área de avaliação coerente
- ou material com controle de preço inconsistente

### 4. Preparação para Fiori Elements
A UI View contém annotations para:
- List Report
- Object Page
- headerInfo
- identification
- lineItem
- selectionFields

---

## Regras de negócio simuladas

### Regra 1 — Material deve possuir descrição
Se o material existir em `MARA`, mas a descrição estiver ausente no idioma da sessão, a app continua exibindo o registro, mas o analista consegue identificar o gap.

### Regra 2 — Material valorizado deve possuir dados de preço
Quando existir registro em `MBEW`, pelo menos um dos preços (`STPRS` ou `VERPR`) deve estar consistente com o controle de preço (`VPRSV`).

### Regra 3 — Centro produtivo exige consistência de planejamento
Quando existir centro (`MARC-WERKS`), é esperado que o controlador MRP esteja corretamente preenchido em cenários produtivos.

---

## Como usar no Eclipse (ADT)

1. Criar as CDS Views na sequência:
   - `Z_I_MaterialRoot`
   - `Z_C_MaterialRoot`
   - `ZUI_C_MaterialRoot`
2. Criar a Behavior Definition da root entity
3. Gerar a classe de implementação
4. Criar a Behavior Projection
5. Criar o Service Definition
6. Criar o Service Binding do tipo **OData V4 - UI**
7. Publicar o binding
8. Abrir o preview Fiori Elements

---

## Resultado esperado no Fiori

### List Report
- Material
- Descrição
- Tipo
- Centro
- Área de avaliação
- Classe de avaliação
- Controle de preço
- Preço padrão
- Preço médio

### Object Page
- Cabeçalho com material + descrição
- Bloco de identificação técnica
- Informações logísticas e financeiras
- Ação customizada para verificar consistência

---

## Evoluções futuras

- inclusão de associação para fornecedor ou dados de compra
- draft handling
- determination automática
- actions com side effects
- facets separadas por Logística / Custos / Planejamento
- extensão para API externa

---

## Autor

Projeto criado para estudo, portfólio e demonstração de arquitetura SAP moderna em cenário próximo de cliente real.
