# Ação customizada e validação

## Ação RAP: `checkConsistency`

### Objetivo
Disponibilizar um botão na UI para reavaliar ou retornar o registro corrente em uma ação de demonstração, simulando um cenário real de regra funcional.

### Uso em portfólio
Essa ação mostra que o projeto já está preparado para:
- regras de consistência
- disparo manual de checagens
- extensão para reprocessamentos futuros

---

## Validação: `validatePricing`

### Regra 1
Se `PriceControl = 'S'`, então `StandardPrice` deve estar preenchido.

### Regra 2
Se `PriceControl = 'V'`, então `MovingAveragePrice` deve estar preenchido.

### Regra 3
Se o material existir por centro, a área de avaliação deve estar coerente.

---

## Erro funcional simulado
Exemplo típico de inconsistência:
- material criado para centro
- sem dado de valoração
- usuário tenta seguir com processo que depende de preço

Resultado esperado:
- erro de validação exibido no RAP/Fiori
- registro marcado como inconsistente
