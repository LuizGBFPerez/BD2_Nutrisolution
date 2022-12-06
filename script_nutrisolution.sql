
CREATE TABLE nutrisolution.uf (
                cod_uf VARCHAR(2) NOT NULL,
                CONSTRAINT sigla_uf PRIMARY KEY (cod_uf)
);
COMMENT ON TABLE nutrisolution.uf IS 'Tabela que cont�m os estados dos endere�os.';
COMMENT ON COLUMN nutrisolution.uf.cod_uf IS 'Sigla do estado. PK da tabela.';


CREATE TABLE nutrisolution.cidade (
                cod_cidade NUMERIC(6) NOT NULL,
                nome_cidade VARCHAR(100) NOT NULL,
                cod_uf VARCHAR(2) NOT NULL,
                CONSTRAINT nome_cidade PRIMARY KEY (cod_cidade)
);
COMMENT ON TABLE nutrisolution.cidade IS 'Tabela que cont�m as cidades dos endere�os.';
COMMENT ON COLUMN nutrisolution.cidade.cod_cidade IS 'C�digo da cidade. PK da tabela.';
COMMENT ON COLUMN nutrisolution.cidade.nome_cidade IS 'Nome da cidade.';
COMMENT ON COLUMN nutrisolution.cidade.cod_uf IS 'Sigla do estado. PK da tabela.';


CREATE TABLE nutrisolution.bairro (
                cod_bairro NUMERIC(6) NOT NULL,
                nome_bairro VARCHAR(100) NOT NULL,
                cod_cidade NUMERIC(6) NOT NULL,
                CONSTRAINT nome_bairro PRIMARY KEY (cod_bairro)
);
COMMENT ON TABLE nutrisolution.bairro IS 'Tabela que guarda os bairros dos endere�os.';
COMMENT ON COLUMN nutrisolution.bairro.cod_bairro IS 'C�digo do bairro. PK da tabela.';
COMMENT ON COLUMN nutrisolution.bairro.nome_bairro IS 'Nome do bairro.';
COMMENT ON COLUMN nutrisolution.bairro.cod_cidade IS 'C�digo da cidade. PK da tabela.';


CREATE TABLE nutrisolution.insumos (
                codigo_medicamento INTEGER NOT NULL,
                subclasse VARCHAR(50) NOT NULL,
                identificacao_comercial VARCHAR NOT NULL,
                nome_comercial VARCHAR(100) NOT NULL,
                nome_generico VARCHAR(100) NOT NULL,
                nome_etiqueta VARCHAR(100) NOT NULL,
                nome_ordem_producao VARCHAR(100) NOT NULL,
                controla_fator_calorico CHAR(1) NOT NULL,
                controla_osmolaridade CHAR(1) NOT NULL,
                fator_calorico NUMERIC(5,4),
                osmolaridade NUMERIC(5,4),
                CONSTRAINT codigo_medicamento PRIMARY KEY (codigo_medicamento)
);
COMMENT ON TABLE nutrisolution.insumos IS 'Tabela que guarda os dados dos insumos.';
COMMENT ON COLUMN nutrisolution.insumos.codigo_medicamento IS 'C�digo do medicamento. PK da tabela.';
COMMENT ON COLUMN nutrisolution.insumos.subclasse IS 'Subclasse do insumo.';
COMMENT ON COLUMN nutrisolution.insumos.identificacao_comercial IS 'Identifica��o comercial do medicamento.';
COMMENT ON COLUMN nutrisolution.insumos.nome_comercial IS 'Nome comercial do medicamento.';
COMMENT ON COLUMN nutrisolution.insumos.nome_generico IS 'Nome gen�rico do medicamento.';
COMMENT ON COLUMN nutrisolution.insumos.nome_etiqueta IS 'Nome impresso na etiqueta do medicamento.';
COMMENT ON COLUMN nutrisolution.insumos.nome_ordem_producao IS 'Nome da ordem de produ��o do medicamento.';
COMMENT ON COLUMN nutrisolution.insumos.controla_fator_calorico IS 'Checagem de controle do fator cal�rico (S/N).';
COMMENT ON COLUMN nutrisolution.insumos.controla_osmolaridade IS 'Checagem de controle da osmolaridade (S/N).';
COMMENT ON COLUMN nutrisolution.insumos.fator_calorico IS 'Fator cal�rico do insumo, caso haja controle.';
COMMENT ON COLUMN nutrisolution.insumos.osmolaridade IS 'Osmolaridade do insumo, caso haja controle.';


CREATE TABLE nutrisolution.medico (
                crm VARCHAR(8) NOT NULL,
                cpf_medico NUMERIC(11) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                CONSTRAINT cpf_medico PRIMARY KEY (crm)
);
COMMENT ON TABLE nutrisolution.medico IS 'Tabela que cont�m os dados dos m�dicos.';
COMMENT ON COLUMN nutrisolution.medico.crm IS 'CRM do m�dico. PK da tabela.';
COMMENT ON COLUMN nutrisolution.medico.cpf_medico IS 'CPF do m�dico.';
COMMENT ON COLUMN nutrisolution.medico.nome IS 'Nome do m�dico.';


CREATE TABLE nutrisolution.usuarios (
                login VARCHAR(8) NOT NULL,
                senha VARCHAR(20) NOT NULL,
                permissao VARCHAR(5) NOT NULL,
                CONSTRAINT login PRIMARY KEY (login)
);
COMMENT ON TABLE nutrisolution.usuarios IS 'Tabela que guarda os dados dos usu�rios do sistema.';
COMMENT ON COLUMN nutrisolution.usuarios.login IS 'Login do usu�rio, � o CRM do m�dico. PFK da tabela.';
COMMENT ON COLUMN nutrisolution.usuarios.senha IS 'Senha do usu�rio.';
COMMENT ON COLUMN nutrisolution.usuarios.permissao IS 'Permiss�o dada ao usu�rio.';


CREATE TABLE nutrisolution.prescricao (
                codigo_prescricao INTEGER NOT NULL,
                crm VARCHAR(8) NOT NULL,
                data_emissao DATE NOT NULL,
                via_acesso VARCHAR NOT NULL,
                CONSTRAINT codigo_prescricao PRIMARY KEY (codigo_prescricao, crm)
);
COMMENT ON TABLE nutrisolution.prescricao IS 'Tabela que guarda os dados das prescri��es feitas pelos m�dicos.';
COMMENT ON COLUMN nutrisolution.prescricao.codigo_prescricao IS 'C�digo da prescri��o. PK da tabela.';
COMMENT ON COLUMN nutrisolution.prescricao.crm IS 'CRM do m�dico. PK da tabela.';
COMMENT ON COLUMN nutrisolution.prescricao.data_emissao IS 'Data de emiss�o da prescri��o.';
COMMENT ON COLUMN nutrisolution.prescricao.via_acesso IS 'Via de acesso da medica��o prescrita.';


CREATE TABLE nutrisolution.itens_da_prescricao (
                codigo_medicamento INTEGER NOT NULL,
                codigo_prescricao INTEGER NOT NULL,
                crm VARCHAR(8) NOT NULL,
                dosagem NUMERIC(5,2) NOT NULL,
                CONSTRAINT codigo_item PRIMARY KEY (codigo_medicamento, codigo_prescricao, crm)
);
COMMENT ON TABLE nutrisolution.itens_da_prescricao IS 'Tabela intermedi�ria que conecta as tabelas prescri��o e insumos em uma liga��o (N,N).';
COMMENT ON COLUMN nutrisolution.itens_da_prescricao.codigo_medicamento IS 'C�digo do medicamento. PK da tabela.';
COMMENT ON COLUMN nutrisolution.itens_da_prescricao.codigo_prescricao IS 'C�digo da prescri��o. PK da tabela.';
COMMENT ON COLUMN nutrisolution.itens_da_prescricao.crm IS 'CRM do m�dico. PK da tabela.';
COMMENT ON COLUMN nutrisolution.itens_da_prescricao.dosagem IS 'Dosagem do medicamento.';


CREATE TABLE nutrisolution.hospital (
                dominio VARCHAR(50) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                telefone INTEGER NOT NULL,
                crm VARCHAR(8) NOT NULL,
                logradouro VARCHAR(100) NOT NULL,
                numero_prop NUMERIC(5) NOT NULL,
                cod_bairro NUMERIC(6) NOT NULL,
                cod_cidade NUMERIC(6) NOT NULL,
                cod_uf VARCHAR(2) NOT NULL,
                CONSTRAINT dominio PRIMARY KEY (dominio)
);
COMMENT ON TABLE nutrisolution.hospital IS 'Tabela que cont�m os dados dos hospitais.';
COMMENT ON COLUMN nutrisolution.hospital.dominio IS 'Dom�nio URL do hospital';
COMMENT ON COLUMN nutrisolution.hospital.nome IS 'Nome do hospital.';
COMMENT ON COLUMN nutrisolution.hospital.telefone IS 'Telefone do hospital.';
COMMENT ON COLUMN nutrisolution.hospital.crm IS 'CRM do m�dico. PK da tabela.';
COMMENT ON COLUMN nutrisolution.hospital.logradouro IS 'Logradouro do hospital.';
COMMENT ON COLUMN nutrisolution.hospital.numero_prop IS 'N�mero do endere�o do hospital.';
COMMENT ON COLUMN nutrisolution.hospital.cod_bairro IS 'C�digo do bairro. PK da tabela.';
COMMENT ON COLUMN nutrisolution.hospital.cod_cidade IS 'C�digo da cidade. PK da tabela.';
COMMENT ON COLUMN nutrisolution.hospital.cod_uf IS 'Sigla do estado. PK da tabela.';


CREATE TABLE nutrisolution.paciente (
                cpf_paciente NUMERIC(11) NOT NULL,
                nome VARCHAR(50) NOT NULL,
                peso NUMERIC(5,2) NOT NULL,
                data_nascimento DATE NOT NULL,
                dominio_hospital VARCHAR(50) NOT NULL,
                crm VARCHAR(8) NOT NULL,
                CONSTRAINT numero_paciente PRIMARY KEY (cpf_paciente)
);
COMMENT ON TABLE nutrisolution.paciente IS 'Tabela que guarda os dados dos pacientes.';
COMMENT ON COLUMN nutrisolution.paciente.cpf_paciente IS 'CPF do paciente. PK da tabela.';
COMMENT ON COLUMN nutrisolution.paciente.nome IS 'Nome do paciente.';
COMMENT ON COLUMN nutrisolution.paciente.peso IS 'Peso do paciente, em kilogramas.';
COMMENT ON COLUMN nutrisolution.paciente.data_nascimento IS 'Data de nascimento do paciente.';
COMMENT ON COLUMN nutrisolution.paciente.dominio_hospital IS 'Dom�nio URL do hospital';
COMMENT ON COLUMN nutrisolution.paciente.crm IS 'CRM do m�dico. PK da tabela.';


ALTER TABLE nutrisolution.cidade ADD CONSTRAINT uf_cidade_fk
FOREIGN KEY (cod_uf)
REFERENCES nutrisolution.uf (cod_uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE nutrisolution.hospital ADD CONSTRAINT uf_hospital_fk
FOREIGN KEY (cod_uf)
REFERENCES nutrisolution.uf (cod_uf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE nutrisolution.bairro ADD CONSTRAINT cidade_bairro_fk
FOREIGN KEY (cod_cidade)
REFERENCES nutrisolution.cidade (cod_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE nutrisolution.hospital ADD CONSTRAINT cidade_hospital_fk
FOREIGN KEY (cod_cidade)
REFERENCES nutrisolution.cidade (cod_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE nutrisolution.hospital ADD CONSTRAINT bairro_hospital_fk
FOREIGN KEY (cod_bairro)
REFERENCES nutrisolution.bairro (cod_bairro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE nutrisolution.itens_da_prescricao ADD CONSTRAINT insumos_itens_da_prescricao_fk
FOREIGN KEY (codigo_medicamento)
REFERENCES nutrisolution.insumos (codigo_medicamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE nutrisolution.paciente ADD CONSTRAINT medico_paciente_fk
FOREIGN KEY (crm)
REFERENCES nutrisolution.medico (crm)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE nutrisolution.hospital ADD CONSTRAINT medico_hospital_fk
FOREIGN KEY (crm)
REFERENCES nutrisolution.medico (crm)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE nutrisolution.prescricao ADD CONSTRAINT medico_prescricao_fk
FOREIGN KEY (crm)
REFERENCES nutrisolution.medico (crm)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE nutrisolution.usuarios ADD CONSTRAINT medico_usuarios_fk
FOREIGN KEY (login)
REFERENCES nutrisolution.medico (crm)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE nutrisolution.itens_da_prescricao ADD CONSTRAINT prescricao_itens_da_prescricao_fk
FOREIGN KEY (codigo_prescricao, crm)
REFERENCES nutrisolution.prescricao (codigo_prescricao, crm)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE nutrisolution.paciente ADD CONSTRAINT hospital_paciente_fk
FOREIGN KEY (dominio_hospital)
REFERENCES nutrisolution.hospital (dominio)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
