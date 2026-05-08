# Documentação de Modelagem de Dados: Alocação de Ferramentas e Relacionamentos

## 1. Solução de Agregação: Alocação de Ferramentas

### O Problema

Inicialmente, havia um conflito estrutural sobre como alocar o maquinário ou equipamento:

* Se a ferramenta fosse vinculada diretamente a uma **pessoa**, ela ficaria restrita e presa àquele funcionário.
* Se a ferramenta fosse vinculada diretamente a um **projeto**, ela ficaria presa exclusivamente àquele projeto.

### A Solução (Tabela `TRABALHA`)

Para resolver esse impasse, foi aplicada a **Agregação**, resultando na criação da tabela intermediária `TRABALHA`.

* **Geração de ID (Recibo):** A agregação captura o momento exato em que o funcionário entra no projeto e cria um ID único para esse evento, funcionando como um "recibo" de alocação.
* **Novo Vínculo:** A ferramenta deixa de ser ligada isoladamente ao funcionário ou ao projeto. Em vez disso, ela é vinculada ao registro da tabela `TRABALHA`.
* **Controle de Estoque Inteligente:** Caso o funcionário saia do projeto, o sistema registra uma data no campo `FIM_PROJETO`. Dessa forma, o banco de dados reconhece automaticamente que o vínculo foi encerrado e a ferramenta é imediatamente "devolvida" ao estoque.

---

## 2. Autorelacionamentos no Sistema

Este modelo de banco de dados conta com a aplicação de relacionamentos internos (autorelacionamentos) em duas situações específicas:

### I. Hierarquia na Tabela `FUNCIONARIO`

* **Contexto:** Definição de liderança e subordinação dentro da equipe.
* **Aplicação:** Ocorre diretamente na tabela `FUNCIONARIO`. Utilizamos o ID de um funcionário que atua como supervisor e o inserimos como chave estrangeira (`SUPERVISOR_ID`) no registro de outro funcionário. Isso cria uma hierarquia clara, significando quem é o supervisor de quem.

### II. Relação `USA_FERRAMENTA` para `FERRAMENTA`

* **Contexto:** Gestão do uso e associação dos equipamentos.
* **Aplicação:** Ocorre na tabela `USA_FERRAMENTA` em relação à tabela `FERRAMENTA`. Trata-se de um relacionamento de cardinalidade **Muitos para Muitos (N:M)**, permitindo que múltiplas ferramentas sejam associadas a múltiplos contextos de uso de forma flexível e rastreável.
