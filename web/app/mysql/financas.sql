/*
regras de negocio do sistema de financas

este sistema servira para controle financeiro e ficara no lugar da planilha
oofficce.

requerimentos:
->deve ter separação de mes,
->cada mes deve ter o seu proprio orçamento de todas as contas,
->o total de contas,
->total de receita,
->total de debitos,
->total de valores parcelados,
->total de valores parcelados pendentes,
->data de vencimento das contas,
->data do pagamento das contas,
->acusar se conta foi paga em atraso ou nao
->valores de investimentos entre outros.

erros encontrados:
=>criticos
->tratar melhor as exceções na inserção das contas
->delete funciona mas precisa colocar um confirm para evitar exclusão acidental
->norelatorio falta calcular o total das contas

=>moderados
->adicionar validacao de data js antes de passar dados para o jsp
->melhorar a validação do jsp
->falta colocar css no sistema inteiro
->falta organizar os arquivos no minimo possivel

*/

create database financas;

create table financas.mes(
id          integer primary key not null,
descricao   character varying(30) not null);

select * from financas.mes

insert into financas.mes
(id,descricao)
values
(1,'Janeiro'),(2,'Fevereiro'),(3,'Março'),(4,'Abril'),(5,'Maio'),(6,'Junho'),
(7,'Julho'),(8,'Agosto'),(9,'Setembro'),(10,'outubro'),(11,'Novembro'),(12,'Dezembro');

create table financas.ano(
id          integer primary key auto_increment not null,
descricao   integer not null);

insert into financas.ano
(descricao)
values
(2010),(2011),(2012),(2013),(2014),(2015);

create table financas.campos(
id          integer primary key auto_increment not null,
descricao   character varying(250) not null,
ativo       boolean default false);

insert into financas.campos
(descricao,ativo)
values
('conta',true),('valor',true),('vencimento',true),('sacado',true),('status',true);

create table financas.sacado(
id          integer primary key auto_increment not null,
descricao   character varying(250) not null,
ativo       boolean default false);

insert into financas.sacado
(descricao,ativo)
values
('usuario 1',true),('usuario 2',true);

insert into financas.sacado
(descricao,ativo)
values
('outros',true);

create table financas.status(
id          integer primary key auto_increment not null,
descricao   character varying(250) not null,
ativo       boolean default false);

insert into financas.status
(descricao,ativo)
values
('aberto',true),('pago',true);

rollback;

drop table financas.conta;
create table financas.conta(
id          integer primary key auto_increment not null,
nome        character varying(250) not null,
valor       double not null,
vencimento  timestamp not null,
sacado      integer not null,
status      integer not null,
contames    integer not null,
contaano    integer not null,
observacoes character varying(250)
);

create table financas.totalcontames(
id              integer primary key auto_increment not null,
mes             integer not null,
ano             integer not null,
valorsacado1    double precision not null,
valorsacado2    double precision not null,
valor total     double precision not null
);

select nome,valor,vencimento,fs.descricao as sacado,fst.descricao as status,
fm.descricao as contames,fa.descricao as contaano--,sum(valor) as valortotal
from financas.conta as fc
left join financas.sacado as fs on fc.sacado=fs.id
left join financas.status as fst on fc.status=fst.id
left join financas.mes as fm on fc.contames=fm.id
left join financas.ano as fa on fc.contaano=fa.id
where
nome=''
valor=
vencimento='' sacado= status= contames= contaano=


insert into financas.conta
(nome,valor,vencimento,sacado,status,contames,contaano)
values
('conta de luz',2.34,now(),1,1,1,1),
('conta de agua',2.34,now(),1,1,1,1);

select * from financas.ano;
truncate table financas.conta;
select * from financas.campos;
select * from financas.conta;
select * from financas.mes;
select * from financas.sacado;
select * from financas.status;

drop table financas.log;
create table financas.log(
id              integer primary key auto_increment not null,
data            timestamp default now() not null,
modulo          integer default 0 not null,
descricao       character varying(250) not null);



txtNomeConta
txtValorConta
txtVencimentoConta
txtObservacoes
cmbSacado
cmbStatus
cmbContaMes
cmbContaAno




select nome,valor,vencimento,fs.descricao as sacado, fst.descricao as status,
 fm.descricao as contames,fa.descricao as contaano
from financas.conta as fc left join financas.sacado as fs on fc.sacado=fs.id left join financas.status as fst on fc.status=fst.id left join financas.mes as fm on fc.contames=fm.id left join financas.ano as fa on fc.contaano=fa.id where true and sacado=1 and contames=1 and status=1 and contaano=1


select nome,valor,vencimento,fs.descricao as sacado, fst.descricao as status,
fm.descricao as contames,fa.descricao as contaano, fc.observacoes as obs
from financas.conta as fc left join financas.sacado as fs on fc.sacado=fs.id
left join financas.status as fst on fc.status=fst.id
left join financas.mes as fm on fc.contames=fm.id
left join financas.ano as fa on fc.contaano=fa.id
where true and sacado=1 and contames=1 and status=1 and contaano=1


select fc.id,nome,valor,vencimento,fs.descricao as sacado, fst.descricao as status, fm.descricao as contames,fa.descricao as contaano, fc.observacoes as obs from financas.conta as fc left join financas.sacado as fs on fc.sacado=fs.id left join financas.status as fst on fc.status=fst.id left join financas.mes as fm on fc.contames=fm.id left join financas.ano as fa on fc.contaano=fa.id where fc.id=1

delete from financas.conta where id=4


update financas.conta
set nome='conta debug update' ,
valor=1,3 ,
vencimento='10 00:00:00.0/12/2010' ,
sacado=2 ,
status=1 ,
contames=7 ,
contaano=6 ,
observacoes='conta ja paga'
where id=5

alter table financas.conta
add vencimento date  not null ;



update financas.conta set nome='conta de luz' ,valor=1393.99 ,vencimento='2010-12-10' ,observacoes='nao vou pagar' where id=2


select fc.id,nome,valor,vencimento,fs.id as idDescSacado,
fs.descricao as sacado, fst.id as idDescStatus,fst.descricao as status,
fm.id as idContaMes,fm.descricao as contames,fa.id as idContaAno,
 fa.descricao as contaano, fc.observacoes as obs
from financas.conta as fc
left join financas.sacado as fs on fc.sacado=fs.id
left join financas.status as fst on fc.status=fst.id
left join financas.mes as fm on fc.contames=fm.id
left join financas.ano as fa on fc.contaano=fa.id
where fc.id=3


select fc.id,nome,valor,vencimento,fs.descricao as sacado, fst.descricao as status,
fm.descricao as contames,fa.descricao as contaano, fc.observacoes as obs
from financas.conta as fc
left join financas.sacado as fs on fc.sacado=fs.id
left join financas.status as fst on fc.status=fst.id
left join financas.mes as fm on fc.contames=fm.id
left join financas.ano as fa on fc.contaano=fa.id
where fc.nome like  '%wall%'


select fc.id,nome,valor,vencimento,fs.descricao as sacado, fst.descricao as status,
fm.descricao as contames,fa.descricao as contaano, fc.observacoes as obs
from financas.conta as fc
left join financas.sacado as fs on fc.sacado=fs.id
left join financas.status as fst on fc.status=fst.id
left join financas.mes as fm on fc.contames=fm.id
left join financas.ano as fa on fc.contaano=fa.id
where fc.nome like '%java%'

--------------------------------------------------------------------------------
/* replicação de contas para o próximo mês */
select * from conta
select (vencimento + 30)::date from conta where id=9

insert into conta
(nome,valor,sacado,status,contames,contaano,vencimento)
select nome,valor,sacado,1,5,2011,vencimento  from conta where contames=4;


--------------------------------------------------------------------------------
show tables;
select * from tb_pontos

select func_id,func_nome,func_sobrenome, from tb_funcionarios
update tb_funcionarios
set func_nome='áéúíó àèùìò',
func_sobrenome='áéúíó àèùìò'
where func_id=7

select * from  tb_disparo_email;
select * from tb_campanha
select * from tb_disparo_email_campanha
select * from tb_email
select func_id,func_nome,func_email,func_cpf,prop_id from tb_funcionarios order by 1 desc
select * from tb_convite_funcionario order by 1 desc
select * from tb_quiz
select * from tb_faleconosco_assunto
delete from tb_faleconosco_assunto where assunto_id >=6
select * from tb_banner
select * from tb_usuario order by 1 desc
select * from tb_proprietarios order by 1 desc
update tb_proprietarios set prop_nome_fantasia='BSY áéíou' where prop_id=1
select * from tb_controle_importacao
select * from tb_acesso
select * from tb_perfil
select * from tb_tela
select * from  tb_disparo_email_campanha;
update tb_tela set tela_subcanal='Relatórios' where tela_id = 7;
select * from tb_campanha order by 1 desc
select select count(disparo_id) from tb_disparo_email_campanha where campanha_id=tc.camp_id as counter,* from tb_campanha as tc order by 1 desc
select count(disparo_id) from tb_disparo_email_campanha where campanha_id=27
select * from tb_disparo_email_campanha where campanha_id=27
select * from tb_disparo_email_campanha order by 1 desc
select camp_id from tb_campanha order by 1 desc limit 1
select * from tb_parametro_tipo_disparo_email_campanha
select * from tb_parametro_data_disparo_email_campanha
select * from tb_parametro_modulo_disparo_email_campanha

select * from tb_perfil

select      tc.camp_id,tc.camp_inicio,tc.camp_fim,tc.camp_termo,tc.camp_titulo,
            te.email_titulo,te.email_conteudo
from        tb_disparo_email_campanha  as tdec
left join   tb_campanha                as tc   on tc.camp_id=tdec.campanha_id
left join   tb_email                   as te   on tdec.disparo_modulo_dados=te.email_id
where       tc.camp_id=29

where       tc.camp_fim                >= current_date
and         tc.camp_ativa              =1
and         tdec.disparo_tipo          =2

select * from  tb_disparo_email_campanha;
select * from  tb_email;

update td_campanha
set camp_ativa=0
where camp_id = 28

select * from  tb_disparo_email_campanha;
select * from  tb_disparo_email;
->email a ser disparado
->se disparado ou ñ
->campanha relacionada
->

Create Table tb_disparo_email(
disparo_email_id        int(10)     not null auto_increment,
disparo_email_contato   text        not null ,
disparo_email_enviado   int(1)      not null  default 0,
disparo_email_data      timestamp,
primary key (disparo_email_id));

insert into tb_disparo_email
(disparo_email_contato)
values
('marcosptf@yahoo.com.br');



select concat(f.func_nome,' ',f.func_sobrenome) as nome,e.prop_razao_social
from tb_funcionarios f
join tb_usuario u on f.func_cpf = u.usua_login
join tb_proprietarios e on f.prop_id = e.prop_id
where u.usua_id = '$midf'


select      tdec.disparo_id,tc.camp_id,tptdec.nome_tipo_disparo,tpmdec.nome_modulo_disparo,te.email_titulo as email,tq.q_questao as quiz,tb.b_titulo as banner,tpddec.nome_data_disparo,tc.camp_inicio,tc.camp_fim,tc.camp_termo,tc.camp_ativa,tc.camp_titulo,tdec.campanha_id
from        tb_disparo_email_campanha                   as tdec
left join   tb_banner                                   as tb       on tdec.disparo_modulo_dados    = tb.b_banner_id
left join   tb_email                                    as te       on tdec.disparo_modulo_dados    = te.email_id
left join   tb_quiz                                     as tq       on tdec.disparo_modulo_dados    = tq.q_id
left join   tb_campanha                                 as tc       on tdec.campanha_id             = tc.camp_id
left join   tb_parametro_tipo_disparo_email_campanha    as tptdec   on tdec.disparo_tipo            = tptdec.tipo_disparo_id
left join   tb_parametro_data_disparo_email_campanha    as tpddec   on tdec.disparo_parametro       = tpddec.data_disparo_id
left join   tb_parametro_modulo_disparo_email_campanha  as tpmdec   on tdec.disparo_modulo          = tpmdec.modulo_disparo_id
where       tc.camp_id=27
order by    tc.camp_id desc


select * from tb_faleconosco_assunto

Create Table tb_faleconosco_assunto(
assunto_id int(10) not null auto_increment,
assunto char(120),
assunto_ativo int(1),
primary key (assunto_id));

select * from tb_faleconosco order by 1 desc
select * from tb_faleconosco_assunto order by 1 desc

Create Table tb_faleconosco(
faleconosco_id int(10) not null auto_increment,
faleconosco_assunto int(1),
faleconosco_mensagem text,
faleconosco_data timestamp default now() not null,
primary key (faleconosco_id));

alter table tb_faleconosco add faleconosco_funcionario_id char(120) after faleconosco_id;
alter table tb_faleconosco add faleconosco_funcionario_empresario char(1) after faleconosco_funcionario_id;

insert into tb_faleconosco
(faleconosco_assunto,faleconosco_mensagem)
values
(1,'javascripter 1'),
(2,'javascripter 2');

insert into tb_faleconosco_assunto
(assunto,assunto_ativo)
values
('Sugestões',1),
('Resgate de Pontos',1),
('Cadastro',1),
('Regulamento',1),
('Outros',1);

Create Table tb_disparo_email_campanha(
disparo_id int(10) not null auto_increment,
campanha_id int(10) not null,
disparo_tipo char(120),
disparo_modulo char(120),
disparo_modulo_dados char(120),
disparo_parametro char(120),
disparo_intervalo char(120),
primary key (disparo_id));

parametros desta tabela:
disparo_id int(10) not null auto_increment,
--id sequencial da tabela

campanha_id int(10) not null,
--relaciona com tb_campanha.camp_id

disparo_tipo char(120),
--> 1 => Automatico
--> 2 => Data

disparo_modulo char(120),
--> 1 => Quiz
--> 2 => Banner
--> 3 => Email

disparo_modulo_dados char(120),
--relaciona com os ids das respectivas tabelas de modulo selecionada acima

disparo_parametro char(120),
--> 1 => Data Início
--> 2 => Data Fim

disparo_intervalo char(120),
-->marca o intervalo de dias

Create Table tb_parametro_tipo_disparo_email_campanha(
tipo_disparo_id int(10) not null auto_increment,
nome_tipo_disparo char(120),
ativo_tipo_disparo int(1),
primary key (tipo_disparo_id));

insert into tb_parametro_tipo_disparo_email_campanha
(nome_tipo_disparo,ativo_tipo_disparo)
values
('Automatico',1),
('Data',1);

Create Table tb_parametro_data_disparo_email_campanha(
data_disparo_id int(10) not null auto_increment,
nome_data_disparo char(120),
ativo_data_disparo int(1),
primary key (data_disparo_id));

insert into tb_parametro_data_disparo_email_campanha
(nome_data_disparo,ativo_data_disparo)
values
('Data Início',1),
('Data Fim',1);

Create Table tb_parametro_modulo_disparo_email_campanha(
modulo_disparo_id int(10) not null auto_increment,
nome_modulo_disparo char(120),
ativo_modulo_disparo int(1),
primary key (modulo_disparo_id));

insert into tb_parametro_modulo_disparo_email_campanha
(nome_modulo_disparo,ativo_modulo_disparo)
values
('Quiz',1),
('Banner',1),
('Email',1);


select * from tb_parametro_tipo_disparo_email_campanha
select * from tb_parametro_data_disparo_email_campanha
select * from tb_parametro_modulo_disparo_email_campanha

alter table tb_campanha add modo_disparo char(120) after pub;
alter table tb_campanha add modulo_disparo char(120) after modo_disparo;
alter table tb_campanha add dados_disparo char(120) after modulo_disparo;
alter table tb_campanha add data_disparo char(120) after dados_disparo;
alter table tb_campanha add intervalo_disparo char(120) after data_disparo;
select * from tb_proprietarios =>4
select * from tb_usuario =>13
select * from tb_controle_importacao =>0
































