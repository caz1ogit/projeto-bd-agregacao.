-- 1. Inserindo Funcionários
-- Inserimos o gerente primeiro (sem supervisor) para não violar a chave estrangeira
INSERT INTO FUNCIONARIO (ID, NOME, SUPERVISOR_ID) VALUES 
(1, 'Alice Silva (Gerente)', NULL);

-- Agora inserimos os funcionários que são supervisionados pela Alice (SUPERVISOR_ID = 1)
INSERT INTO FUNCIONARIO (ID, NOME, SUPERVISOR_ID) VALUES 
(2, 'Bob Santos', 1),
(3, 'Carlos Oliveira', 1),
(4, 'Diana Costa', 1);

-- 2. Inserindo Dependentes (Referencia FUNCIONARIO)
INSERT INTO DEPENDENTE (ID, NOME, FUNCIONARIO_ID) VALUES 
(1, 'Lucas Santos', 2),
(2, 'Mariana Oliveira', 3),
(3, 'Pedro Costa', 4),
(4, 'Julia Costa', 4);

-- 3. Inserindo Projetos (Não possui chaves estrangeiras)
INSERT INTO PROJETO (ID, NOME) VALUES 
(1, 'Migração para Nuvem'),
(2, 'Desenvolvimento do App Mobile'),
(3, 'Atualização do Banco de Dados');

-- 4. Inserindo Registros de Trabalho (Referencia FUNCIONARIO e PROJETO)
-- Formato de TIMESTAMP: 'YYYY-MM-DD HH:MM:SS'
INSERT INTO TRABALHA (ID, ID_FUNCIONARIO, ID_PROJETO, INICIO_PROJETO, FIM_PROJETO) VALUES 
(1, 2, 1, '2023-01-10 09:00:00', '2023-06-30 18:00:00'), -- Bob no Projeto 1 (Finalizado)
(2, 3, 2, '2023-02-15 08:30:00', NULL),                 -- Carlos no Projeto 2 (Em andamento)
(3, 4, 3, '2023-03-01 09:00:00', NULL),                 -- Diana no Projeto 3 (Em andamento)
(4, 2, 2, '2023-07-01 09:00:00', NULL);                 -- Bob também no Projeto 2

-- 5. Inserindo Ferramentas (Não possui chaves estrangeiras)
INSERT INTO FERRAMENTA (ID, NOME) VALUES 
(1, 'Visual Studio Code'),
(2, 'Docker'),
(3, 'Figma'),
(4, 'DBeaver'),
(5, 'AWS CLI');

-- 6. Inserindo Associação de Ferramentas ao Trabalho (Referencia TRABALHA e FERRAMENTA)
INSERT INTO USA_FERRAMENTA (ID_TRABALHA, ID_FERRAMENTA) VALUES 
(1, 2), -- Bob (Trabalho 1) usou Docker
(1, 5), -- Bob (Trabalho 1) usou AWS CLI
(2, 1), -- Carlos (Trabalho 2) usa VS Code
(2, 3), -- Carlos (Trabalho 2) usa Figma
(3, 4), -- Diana (Trabalho 3) usa DBeaver
(4, 1); -- Bob (Trabalho 4) usa VS Code
