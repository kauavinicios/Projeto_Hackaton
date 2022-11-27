create table sintomas(codigo serial primary key not null,
                        nome varchar(50), 
                        nivelDeRisco numeric(1));

create table pessoa(codigo serial primary key not null,
                    nome varchar(50) not null,
                    cpf varchar(11) not null unique,
                    telefone numeric(11),
                    cep varchar(8) not null);

create table pessoa_sintoma(codigoPessoa int,
                            codigoSintoma int,
                            primary key(codigoPessoa, codigoSintoma),
                            foreign key(codigoPessoa) references pessoa(codigo),
                            foreign key(codigoSintoma) references sintomas(codigo));

insert into sintomas(nome, nivelDeRisco) 
    values ('Febre', 1);
insert into sintomas(nome, nivelDeRisco) 
    values ('Tosse', 1);
insert into sintomas(nome, nivelDeRisco) 
    values ('Cansaço', 1);
insert into sintomas(nome, nivelDeRisco) 
    values ('Perda de paladar', 1);
insert into sintomas(nome, nivelDeRisco) 
    values ('Perda de olfato', 1);
insert into sintomas(nome, nivelDeRisco) 
    values ('Dores de garganta', 2);
insert into sintomas(nome, nivelDeRisco) 
    values ('Dor de cabeça', 2);
insert into sintomas(nome, nivelDeRisco) 
    values ('Dores e desconfortos', 2);
insert into sintomas(nome, nivelDeRisco) 
    values ('Diarreia', 2);
insert into sintomas(nome, nivelDeRisco) 
    values ('Irritações na pele', 2);
insert into sintomas(nome, nivelDeRisco) 
    values ('descoloração dos dedos dos pes', 2);
insert into sintomas(nome, nivelDeRisco) 
    values ('Olhos vermelhos ou irritados', 2);
insert into sintomas(nome, nivelDeRisco) 
    values ('Dificuldade para respirar', 3);
insert into sintomas(nome, nivelDeRisco) 
    values ('Dificuldade para respirar', 3);
insert into sintomas(nome, nivelDeRisco) 
    values ('falta de ar', 3);
insert into sintomas(nome, nivelDeRisco) 
    values ('Perda da fala ou mobilidade', 3);
insert into sintomas(nome, nivelDeRisco) 
    values ('confusao', 3);
insert into sintomas(nome, nivelDeRisco) 
    values ('Dores no peito', 3);

insert into pessoa(nome, cpf, telefone, cep)
    values ('fulano', '12345678910', 99999999999, '1234-678');

insert into pessoa_sintoma(codigoPessoa, codigoSintoma)
    values (1,2);
    insert into pessoa_sintoma(codigoPessoa, codigoSintoma)
    values (1,6);
    insert into pessoa_sintoma(codigoPessoa, codigoSintoma)
    values (1,7);
    insert into pessoa_sintoma(codigoPessoa, codigoSintoma)
    values (1,9);
    insert into pessoa_sintoma(codigoPessoa, codigoSintoma)
    values (1,4);

select pes.nome as Nome, pes.cep as CEP, sint.nome as Sintomas
    from pessoa pes
     join pessoa_sintoma ps 
        on pes.codigo = ps.codigoPessoa
     join sintomas sint 
        on ps.codigoSintoma = sint.codigo
        order by pes.nome;

select pes.nome as Nome, sum(sint.nivelDeRisco) as Nivel_De_Risco
    from pessoa pes
     join pessoa_sintoma ps 
        on pes.codigo = ps.codigoPessoa
     join sintomas sint 
        on ps.codigoSintoma = sint.codigo
		group by pes.nome
        order by pes.nome;

