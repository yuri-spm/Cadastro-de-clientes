/* Modelo Lógico Inicial: */

CREATE TABLE Status (
    id_Status int PRIMARY KEY,
    id_Categoria_Status int,
    Nome_Status varchar(100),
    descricao_status varchar(300),
    data_Cadastro datetime
);

CREATE TABLE Categoria_Status (
    id_Categoria_Status int PRIMARY KEY,
    id_Usuario int,
    Nome_Categoria varchar(30),
    descricao_Categoria varchar(100),
    data_Cadastro datetime
);

CREATE TABLE Pessoa_Fisica (
    id_Pessoa_Fisica int PRIMARY KEY,
    id_Pessoa int,
    id_Usuario int,
    rg varchar(20),
    cpf varchar(14),
    sexo varchar(1),
    data_Nascimento date,
    data_Cadastro datetime,
    observacao_Pessoa_fisica varchar(500)
);

CREATE TABLE Pessoa (
    id_Pessoa int PRIMARY KEY,
    id_Usuario int,
    Nome varchar(100),
    funcao varchar(100),
    data_Cadastro datetime
);

CREATE TABLE Pessoa_Juridica (
    id_Pessoa_juridica int PRIMARY KEY,
    id_Pessoa int,
    id_Usuario int,
    Razao_Social varchar(200),
    Incricao_Estadual varchar(14),
    cnpj varchar(18),
    data_Cadastro datetime,
    observacao_Pessoa_Fisica varchar(500)
);

CREATE TABLE Endereco (
    id_Endereco int PRIMARY KEY,
    id_Pessoa int,
    id_Estado int,
    id_Cidade int,
    id_Usuario int,
    Bairro varchar(100),
    Logradouro varchar(300),
    Numero int,
    CEP varchar(10),
    Observacao_Endereco varchar(300)
);

CREATE TABLE Estado (
    id_Estado int PRIMARY KEY,
    Nome_Estado int
);

CREATE TABLE Cidade (
    id_Cidade int PRIMARY KEY,
    id_Estado int,
    Nome_Cidade varchar(100)
);

CREATE TABLE Usuario (
    id_Usuario int PRIMARY KEY,
    id_Pessoa int,
    id_Nivel_Acesso int,
    id_Status int,
    Login_Usuario varchar(50),
    Senha_Usuario varchar(128),
    data_Cadastro datetime
);

CREATE TABLE Contato (
    id_Contato int PRIMARY KEY,
    id_Usuario int,
    id_Pessoa int,
    id_Telefone int,
    Email varchar(256),
    Link_Facebook varchar(256),
    Link_Instagram varchar(256),
    Link_linkedin varchar(256),
    Data_Cadastro datetime,
    Observacao_Contato varchar(300)
);

CREATE TABLE Permissao (
    Id_Permissao int PRIMARY KEY,
    id_Status int,
    Nome_Permissao varchar(100),
    Descricao_Permissao varchar(300),
    data_Cadastro datetime
);

CREATE TABLE Nivel_Acesso (
    id_Nivel_Acesso int PRIMARY KEY,
    id_Usuario int,
    Nome_Nivel_Acesso varchar(100),
    Descricao_Nivel varchar(300),
    data_Cadastro datetime
);

CREATE TABLE Nivel_Acesso_Permissao (
    id_Nivel_Acesso_Permissao int PRIMARY KEY,
    id_Usuario int,
    id_Permissao int,
    id_NivelAcesso int,
    dataCadastro datetime
);

CREATE TABLE Telefone (
    id_Telefone int PRIMARY KEY,
    id_Usuario int,
    idOperadora int,
    DDD varchar(2),
    Numero_Telefone varchar(16)
);

CREATE TABLE Operadora (
    idOperadora int PRIMARY KEY,
    Nome varchar(100),
    Razao_Social varchar(100),
    Cnpj varchar(18)
);
 
ALTER TABLE Status ADD CONSTRAINT tbl_Status_Fk_Id_Categoria_Status
    FOREIGN KEY (id_Categoria_Status)
    REFERENCES Categoria_Status (id_Categoria_Status);
 
ALTER TABLE Categoria_Status ADD CONSTRAINT FK_Categoria_Status_2
    FOREIGN KEY (id_Usuario)
    REFERENCES Usuario (id_Usuario);
 
ALTER TABLE Pessoa_Fisica ADD CONSTRAINT tbl_Pessoa_Fisica_Pk_Id_Pessoa
    FOREIGN KEY (id_Pessoa)
    REFERENCES Pessoa (id_Pessoa);
 
ALTER TABLE Pessoa_Fisica ADD CONSTRAINT tbl_Pessoa_Fisica_Fk_Id_Usuario
    FOREIGN KEY (id_Usuario)
    REFERENCES Usuario (id_Usuario);
 
ALTER TABLE Pessoa ADD CONSTRAINT tbl_Pessoa_Fk_Id_Usuario
    FOREIGN KEY (id_Usuario)
    REFERENCES Usuario (id_Usuario);
 
ALTER TABLE Pessoa_Juridica ADD CONSTRAINT tbl_Pessoa_Juridica_Fk_Id_Pessoa
    FOREIGN KEY (id_Pessoa)
    REFERENCES Pessoa (id_Pessoa);
 
ALTER TABLE Pessoa_Juridica ADD CONSTRAINT tbl_Pessoa_Juridica_Fk_Id_Usuario
    FOREIGN KEY (id_Usuario)
    REFERENCES Usuario (id_Usuario);
 
ALTER TABLE Endereco ADD CONSTRAINT tbl_Endereco_Fk_Id_Pessoa
    FOREIGN KEY (id_Pessoa)
    REFERENCES Pessoa (id_Pessoa);
 
ALTER TABLE Endereco ADD CONSTRAINT tbl_Endereco_Pk_Id_Estado
    FOREIGN KEY (id_Estado)
    REFERENCES Estado (id_Estado);
 
ALTER TABLE Endereco ADD CONSTRAINT tbl_Endereco_Fk_Id_Cidade
    FOREIGN KEY (id_Cidade)
    REFERENCES Cidade (id_Cidade);
 
ALTER TABLE Endereco ADD CONSTRAINT tbl_Endereco_pf_Id_Usuario
    FOREIGN KEY (id_Usuario)
    REFERENCES Usuario (id_Usuario);
 
ALTER TABLE Estado ADD CONSTRAINT FK_Estado_2
    FOREIGN KEY (Nome_Estado)
    REFERENCES Endereco (id_Endereco);
 
ALTER TABLE Cidade ADD CONSTRAINT tbl_Cidade_Fk_Id_Estado
    FOREIGN KEY (id_Estado)
    REFERENCES Estado (id_Estado);
 
ALTER TABLE Usuario ADD CONSTRAINT tbl_Usuario_Fk_id_pessoa
    FOREIGN KEY (id_Pessoa)
    REFERENCES Pessoa (id_Pessoa);
 
ALTER TABLE Usuario ADD CONSTRAINT tbl_Usuario_Fk_Id_nivel_Acesso
    FOREIGN KEY (id_Nivel_Acesso)
    REFERENCES Nivel_Acesso (id_Nivel_Acesso);
 
ALTER TABLE Usuario ADD CONSTRAINT tbl_Usuario_Fk_Id_Status
    FOREIGN KEY (id_Status)
    REFERENCES Status (id_Status);
 
ALTER TABLE Contato ADD CONSTRAINT tbl_Contato_Fk_Id_Pessoa
    FOREIGN KEY (id_Pessoa)
    REFERENCES Pessoa (id_Pessoa);
 
ALTER TABLE Contato ADD CONSTRAINT tbl_Contato_Fk_Id_Usuario
    FOREIGN KEY (id_Usuario)
    REFERENCES Usuario (id_Usuario);
 
ALTER TABLE Contato ADD CONSTRAINT tbl_Contato_Fk_Id_Telefone
    FOREIGN KEY (id_Telefone)
    REFERENCES Telefone (id_Telefone);
 
ALTER TABLE Permissao ADD CONSTRAINT tbl_Permissao_Fk_id_Status
    FOREIGN KEY (id_Status)
    REFERENCES Status (id_Status);
 
ALTER TABLE Nivel_Acesso ADD CONSTRAINT tbl_Nivel_Acesso_Fk_idUsuario
    FOREIGN KEY (id_Usuario)
    REFERENCES Usuario (id_Usuario);
 
ALTER TABLE Nivel_Acesso_Permissao ADD CONSTRAINT tbl_Nivel_Acesso_Permissao_Fk_Id_Permissao
    FOREIGN KEY (id_Permissao)
    REFERENCES Permissao (Id_Permissao);
 
ALTER TABLE Nivel_Acesso_Permissao ADD CONSTRAINT tbl_Nivel_Acesso_Permissao_Fk_Id_Usuario
    FOREIGN KEY (id_Usuario)
    REFERENCES Usuario (id_Usuario);
 
ALTER TABLE Nivel_Acesso_Permissao ADD CONSTRAINT tbl_Nivel_Acesso_Permissao_Fk_Id_Nivel_Acesso
    FOREIGN KEY (id_NivelAcesso)
    REFERENCES Nivel_Acesso (id_Nivel_Acesso);
 
ALTER TABLE Telefone ADD CONSTRAINT tbl_Telefone_Fk_Id_Usuario
    FOREIGN KEY (id_Usuario)
    REFERENCES Contato (id_Contato);
 
ALTER TABLE Telefone ADD CONSTRAINT tbl_Telefone_Fl_Id_Operadora
    FOREIGN KEY (idOperadora)
    REFERENCES Operadora (idOperadora);