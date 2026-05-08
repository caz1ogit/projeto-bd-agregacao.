# Estrutura de Relacionamentos do Banco de Dados

Este documento descreve as lógicas de relacionamento aplicadas nas tabelas do sistema.

---

## Autorelacionamento

**Tabela:** `FUNCIONARIO`

Ocorre dentro da própria tabela de funcionários com o objetivo de definir a hierarquia de cargos corporativos.

*   **Como funciona:** 
    Utilizamos uma coluna chamada `SUPERVISOR_ID`, que recebe o `ID` de outra pessoa registrada na mesma tabela. Essa chave estrangeira (Foreign Key) referenciando a própria tabela indica quem é o supervisor direto daquele funcionário específico.

---

## Relacionamento Muitos-para-Muitos (N:N)

**Tabela Associativa:** `USA_FERRAMENTA`

Ocorre para gerenciar de forma eficiente o uso e a alocação dos equipamentos da empresa.

*   **Como funciona:** 
    Foi criada uma tabela associativa (`USA_FERRAMENTA`) para intermediar a relação **N:N** (muitos para muitos) entre as ferramentas e os vínculos de trabalho. Essa estrutura permite que:
    *   Várias ferramentas sejam utilizadas em um mesmo trabalho.
    *   Uma mesma ferramenta seja alocada para vários trabalhos diferentes simultaneamente ou ao longo do tempo.
