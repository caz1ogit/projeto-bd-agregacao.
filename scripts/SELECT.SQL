-- ==============================================================================
-- CONSULTAS BÁSICAS (Trazem todos os dados brutos de cada tabela)
-- ==============================================================================

-- 1. SELECT DA TABELA FUNCIONARIO
-- O que faz: Lista todos os funcionários cadastrados no banco.
-- O que retorna: ID do funcionário, o Nome e o ID do supervisor (SUPERVISOR_ID).
SELECT * FROM FUNCIONARIO;

-- 2. SELECT DA TABELA DEPENDENTE
-- O que faz: Lista todos os dependentes cadastrados.
-- O que retorna: ID do dependente, Nome do dependente e o ID do funcionário (FUNCIONARIO_ID) responsável por ele.
SELECT * FROM DEPENDENTE;

-- 3. SELECT DA TABELA PROJETO
-- O que faz: Lista todos os projetos da empresa.
-- O que retorna: ID do projeto e o Nome do projeto.
SELECT * FROM PROJETO;

-- 4. SELECT DA TABELA TRABALHA
-- O que faz: Lista o histórico e as alocações de trabalho atuais.
-- O que retorna: ID do registro, ID_FUNCIONARIO, ID_PROJETO, data de início e data de fim.
SELECT * FROM TRABALHA;

-- 5. SELECT DA TABELA FERRAMENTA
-- O que faz: Lista o catálogo de ferramentas disponíveis.
-- O que retorna: ID da ferramenta e o Nome da ferramenta.
SELECT * FROM FERRAMENTA;

-- 6. SELECT DA TABELA USA_FERRAMENTA
-- O que faz: Lista a relação de uso de ferramentas.
-- O que retorna: Os IDs dos registros de trabalho (ID_TRABALHA) lado a lado com os IDs das ferramentas (ID_FERRAMENTA) utilizadas neles.
SELECT * FROM USA_FERRAMENTA;


-- ==============================================================================
-- CONSULTAS BÔNUS COM JOIN (Para ver nomes em vez de apenas IDs)
-- ==============================================================================

-- Bônus 1: Ver Dependentes e o Nome do Funcionário Responsável
-- O que faz: Junta DEPENDENTE com FUNCIONARIO para mostrar de quem é cada dependente.
SELECT 
    D.NOME AS Nome_Dependente, 
    F.NOME AS Funcionario_Responsavel
FROM DEPENDENTE D
INNER JOIN FUNCIONARIO F ON D.FUNCIONARIO_ID = F.ID;

-- Bônus 2: Ver quem trabalha em qual projeto e as datas
-- O que faz: Junta TRABALHA com FUNCIONARIO e PROJETO para mostrar nomes no lugar dos IDs.
SELECT 
    F.NOME AS Nome_Funcionario,
    P.NOME AS Nome_Projeto,
    T.INICIO_PROJETO,
    T.FIM_PROJETO
FROM TRABALHA T
INNER JOIN FUNCIONARIO F ON T.ID_FUNCIONARIO = F.ID
INNER JOIN PROJETO P ON T.ID_PROJETO = P.ID;

-- Bônus 3: Ver as ferramentas usadas em cada alocação de trabalho
-- O que faz: Junta USA_FERRAMENTA com TRABALHA, FUNCIONARIO, PROJETO e FERRAMENTA.
SELECT 
    F.NOME AS Nome_Funcionario,
    P.NOME AS Projeto,
    FER.NOME AS Ferramenta_Utilizada
FROM USA_FERRAMENTA UF
INNER JOIN TRABALHA T ON UF.ID_TRABALHA = T.ID
INNER JOIN FUNCIONARIO F ON T.ID_FUNCIONARIO = F.ID
INNER JOIN PROJETO P ON T.ID_PROJETO = P.ID
INNER JOIN FERRAMENTA FER ON UF.ID_FERRAMENTA = FER.ID;
