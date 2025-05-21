# Validação Pedido de Compras SAP ABAP

![ABAP](https://img.shields.io/badge/ABAP-OO-blue?style=flat)
![SAP](https://img.shields.io/badge/SAP-ERP-blue?style=flat)
![SAP Exit](https://img.shields.io/badge/SAP-Exit-orange?style=flat)
![ABAP Development](https://img.shields.io/badge/ABAP-Development-green?style=flat)
![Eclipse](https://img.shields.io/badge/Eclipse-ADT-purple?style=flat)
![GitHub](https://img.shields.io/badge/GitHub-Repository-black?style=flat)
![Commits](https://img.shields.io/github/commit-activity/m/edmilson-nascimento/Pedido-de-Compras-SAP?style=flat)
![SAP](https://img.shields.io/badge/SAP-On%20Premise-blue?style=flat)

## Descrição
Este projeto implementa uma validação customizada para Pedidos de Compras no SAP através do método `CHECK` da interface `IF_EX_ME_PROCESS_PO_CUST`. A solução é aplicável nas transações:
- `ME21N` (Criar Pedido de Compras)
- `ME22N` (Modificar Pedido de Compras) 
- `ME23N` (Exibir Pedido de Compras)

## Funcionalidades
- Captura de dados do cabeçalho do pedido via `get_data()`
- Acesso aos itens do pedido através de `get_items()`
- Validações customizadas através de includes
- Suporte a regras de negócio específicas

## Implementação Técnica
O código é estruturado da seguinte forma:

```abap
METHOD if_ex_me_process_po_cust~check.
  "Estruturas para manipulação dos dados
  DATA: header TYPE mepoheader,
        items  TYPE purchase_order_items,
        item   TYPE purchase_order_item,
        data   TYPE mepoitem.

  "Processamento do cabeçalho
  IF NOT im_header IS INITIAL.
    header = im_header->get_data( ).
    items = im_header->get_items( ).
    
    "Processamento do primeiro item
    READ TABLE items INTO item INDEX 1.
    IF sy-subrc EQ 0.
      data = item-item->get_data( ).
      "Include para validações customizadas
      "INCLUDE zmmi0000 IF FOUND.
    ENDIF.
  ENDIF.
ENDMETHOD.
```

## Pontos de Extensão
1. **Cabeçalho do Pedido**
   - Acesso completo aos dados via `header = im_header->get_data()`
   - Possibilidade de validações específicas por empresa/organização

2. **Itens do Pedido**
   - Processamento individual via `items = im_header->get_items()`
   - Validações por item através de `item-item->get_data()`

3. **Include Customizado**
   - Implementação de regras específicas via include (ex: `ZMMI0000`)
   - Flexibilidade para diferentes cenários de validação

## Pré-requisitos
- SAP ERP com ambiente de desenvolvimento ABAP
- Autorização para implementação de BAdIs/Exits
- Acesso às transações de Pedido de Compras
- Eclipse ADT para desenvolvimento

## Como Implementar
1. Criar classe que implementa `IF_EX_ME_PROCESS_PO_CUST`
2. Implementar método `CHECK`
3. Desenvolver include com regras de validação
4. Ativar implementação no customizing SAP

## Boas Práticas
- Implementar tratamento de exceções
- Documentar regras de validação
- Manter logs para auditoria
- Considerar performance em validações complexas

## Suporte
Para dúvidas ou sugestões, abra uma issue no repositório GitHub.
