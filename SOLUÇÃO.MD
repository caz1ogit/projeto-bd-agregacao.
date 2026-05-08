# Documentação do Modelo de Banco de Dados

Este documento detalha as soluções de modelagem aplicadas para a gestão de funcionários, projetos, ferramentas e dependentes, com foco em agregação e integridade referencial.

## 1. Solução de Agregação: Gestão de Ferramentas

A problemática inicial consistia no fato de que, ao adicionar uma ferramenta diretamente a uma pessoa ou a um projeto, ela ficava "presa" a essa entidade de forma rígida.

### A Tabela `Trabalha`
Para resolver isso, foi criada a tabela **Trabalha**. Ela funciona como uma entidade associativa que registra o momento exato em que um funcionário entra em um projeto.
- **Conceito de Recibo:** A tabela gera um ID único para cada alocação, funcionando como um recibo.
- **Vínculo da Ferramenta:** Agora, a ferramenta é ligada ao ID da tabela `Trabalha`, e não mais diretamente ao funcionário ou projeto.
- **Logística de Devolução:** Quando o funcionário sai do projeto, o campo `fim_projeto` é preenchido. O sistema identifica o término do vínculo e, automaticamente, a ferramenta é considerada disponível para retornar ao estoque.

## 2. Auto-relacionamentos

O projeto utiliza o conceito de auto-relacionamento em dois pontos críticos:

### 2.1 Supervisão (Tabela Funcionário)
Na tabela `Funcionario`, aplicamos um auto-relacionamento para hierarquia:
- Existe uma coluna (ex: `supervisor_id`) que armazena o ID de outro funcionário.
- Isso permite identificar quem é o supervisor de cada colaborador dentro da mesma tabela.

### 2.2 Relacionamento de Ferramentas (`Usa_Ferramenta`)
Ocorre na tabela que gerencia o uso de ferramentas, permitindo uma relação de **Muitos para Muitos (N:N)**. Isso é útil para casos onde ferramentas podem estar compostas por outras ou possuírem dependências técnicas entre si.

## 3. Integridade Referencial: `DELETE ON CASCADE`

Na tabela `Dependente`, é fundamental a utilização da cláusula `ON DELETE CASCADE` vinculada ao ID do funcionário.

### Por que utilizar?
1. **Evitar Registros Órfãos:** Impede que existam dependentes no banco de dados que apontam para um funcionário que já foi excluído.
2. **Manutenção da Integridade:** Garante que a base de dados reflita a realidade do negócio (se o funcionário não existe mais na empresa, seus dependentes também devem ser removidos do sistema).
3. **Automação:** Facilita a limpeza de dados, removendo automaticamente todas as informações vinculadas em cascata.

---
*Documento gerado para fins de especificação técnica de banco de dados.*
