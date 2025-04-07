-- Inserindo usuários
INSERT INTO usuarios (email, senha_hash, tipo, data_criacao, ativo) VALUES
('cliente1@email.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MZMq9liFhb6t3JZItVq1B3F3JQJQBG', 'cliente', '2023-01-10 08:30:00', true),
('cliente2@email.com', '$2a$10$bW.TLc5QvErsI5X5j6xzEeZP7eJQJQBG', 'cliente', '2023-02-15 14:20:00', true),
('mecanico@oficina.com', '$2a$10$cW.TLc5QvErsI5X5j6xzEeZP7eJQJQBG', 'admin', '2022-11-05 09:00:00', true),
('admin@oficina.com', '$2a$10$dW.TLc5QvErsI5X5j6xzEeZP7eJQJQBG', 'admin', '2022-09-01 10:00:00', true);

-- Inserindo clientes
INSERT INTO clientes (usuario_id, nome, cpf, telefone, endereco, data_nascimento) VALUES
(1, 'Teste1', '123.456.789-01', '(11) 99999-8888', 'Rua do bairro, 100 - São Paulo/SP', '1985-05-15'),
(2, 'Teste2', '987.654.321-09', '(11) 98888-7777', 'Rua do bairro dois, 2000 - São Paulo/SP', '1990-08-20');

-- Inserindo funcionários
INSERT INTO funcionarios (usuario_id, nome, cpf, telefone, cargo, especialidade) VALUES
(3, 'Mecanico', '111.222.333-44', '(11) 97777-6666', 'Mecânico', 'Motores'),
(4, 'Gerente', '555.666.777-88', '(11) 96666-5555', 'Gerente', 'Administração');

-- Inserindo veículos
INSERT INTO veiculos (cliente_id, modelo, marca, placa, ano, quilometragem, quilometragem_media, cor, combustivel) VALUES
(1, 'Gol', 'Volkswagen', 'ABC1D23', '2018', 45000, 1000, 'Prata', 'Flex'),
(1, 'Onix', 'Chevrolet', 'XYZ9K87', '2020', 25000, 800, 'Preto', 'Flex'),
(2, 'Corolla', 'Toyota', 'DEF4G56', '2019', 38000, 1200, 'Branco', 'Gasolina');

-- Inserindo peças
INSERT INTO pecas (nome, codigo, fabricante, preco_unitario) VALUES
('Pastilha de Freio', 'PFD-001', 'Bosch', 150.00),
('Filtro de Óleo', 'FO-202', 'Mann Filter', 45.00),
('Vela de Ignição', 'VI-305', 'NGK', 70.00),
('Correia Dentada', 'CD-410', 'Gates', 220.00);

-- Inserindo promoções
INSERT INTO promocoes (titulo, descricao, data_inicio, data_fim, ativa, codigo_promocional, desconto_percentual, preco_promocional) VALUES
('Promoção de Verão', 'Descontos para preparar seu carro', '2023-12-01', '2024-02-29', true, 'VERAO2024', 15.00, 127.50),
('Black Friday', 'Ofertas especiais', '2023-11-20', '2023-11-27', true, 'BLACK2023', 25.00, 52.50);

-- Inserindo serviços 
INSERT INTO servicos (veiculo_id, funcionario_id, promocao_id, peca_id, descricao, status, data_entrada, data_saida, valor_mao_de_obra, desconto_aplicado, valor_total, observacoes) VALUES
(1, 3, 1, 1, 'Troca de pastilhas de freio', 'finalizado', '2023-11-10 09:00:00', '2023-11-10 11:30:00', 200.00, 22.50, 327.50, 'Freios em bom estado'),
(2, 3, NULL, 3, 'Troca de velas', 'em_andamento', '2023-11-15 14:00:00', NULL, 150.00, 0.00, NULL, 'Aguardando peças'),
(3, 3, 2, 4, 'Troca de correia dentada', 'agendado', '2023-11-20 08:30:00', NULL, 300.00, 0.00, NULL, 'Cliente solicitou peça original');

-- Inserindo manutenções
INSERT INTO manutencoes (veiculo_id, cliente_id, tipo, data_agendada, data_notificacao, confirmada, observacoes) VALUES
(1, 1, 'preventiva', '2024-03-15 10:00:00', '2024-03-01 09:00:00', true, 'Próxima revisão'),
(3, 2, 'preventiva', '2024-02-10 14:30:00', '2024-01-27 16:00:00', false, 'Aguardando confirmação');

-- Inserindo avaliações
INSERT INTO avaliacoes (cliente_id, servico_id, nota, comentario, data_avaliacao, publicada) VALUES
(1, 1, 5, 'Excelente serviço!', '2023-11-11 18:30:00', true),
(2, 3, 4, 'Bom atendimento', '2023-11-21 15:00:00', true);

-- Inserindo mensagens
INSERT INTO mensagens (cliente_id, funcionario_id, mensagem, data_envio, lida, resposta_para, assunto) VALUES
(1, 3, 'Gostaria de agendar uma revisão', '2023-11-05 10:15:00', true, NULL, 'Agendamento'),
(3, 1, 'Podemos agendar para dia 10/11?', '2023-11-05 11:30:00', true, 1, 'Agendamento');

-- Inserindo relatórios
INSERT INTO relatorios (funcionario_id, tipo, data_geracao, parametros, periodo_inicio, periodo_fim) VALUES
(4, 'vendas_mensal', '2023-11-01 17:00:00', '{"mes": 10, "ano": 2023}', '2023-10-01', '2023-10-31'),
(4, 'servicos_pendentes', '2023-11-16 09:30:00', '{"status": "em_andamento"}', NULL, NULL);