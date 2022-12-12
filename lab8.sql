create view Hello as select 'Hello World!';

select *  from Hello;

create table Person(
    first_name varchar(20),
    last_name varchar(20),
    age integer not null ,
    b_day date,
    city varchar(50) check ( city != 'asdfgh')
);

insert into person values('Dinmukhammed', 'Korganbek', 18, '2003-12-19', 'Shymkent');
create view from_symkent as select * from person where city = 'Shymkent';

insert into person (first_name, last_name, age, b_day, city)
values ('Aidos', 'Kakimov', 18, '2003-12-12', 'Shymkent');

insert into person (first_name, last_name, age, b_day, city)
values ('Timur', 'Temirzhan', 18, '2004-10-12', 'Oral');

insert into person (first_name, last_name, age, b_day, city)
values ('Bekzat', 'Ratbek', 19, '2003-04-17', 'Shymkent');

update person set city = 'Shymkent' where first_name = 'Bekzat';

select * from from_symkent;

select *
from person;

create table Films(
    id serial,
    title varchar(50),
    kind varchar(50),
    classification varchar(20)
);



create user dima;

create  or replace function from_shym(name varchar ,  OUT surname varchar)
AS $$
    BEGIN
    name = 'Dima';
    END;
$$ language plpgsql;



select * from from_shym();


create or replace view birthday as select distinct b_day, first_name from Person;


select * from birthday;

create type GENDER as ENUM ('Male', 'Famale');

alter table Person
add gender GENDER;

create procedure get_gender(g GENDER)
AS $$
    BEGIN
        update Person set gender = g where age = 18;
    end;
$$ language  plpgsql;


call get_gender();

select * from Person;

update Person set gender = 'Male' where age = 18 or age = 19;

delete
from person
where first_name = 'Aliya';

insert into person values ('Aliya', 'Duisenbek', 17, '2005-06-15', 'Shymkent', 'Famale');



create view endka as select count(gender) from person where Person.gender = 'Famale'
union select  count(gender) from person where Person.gender = 'Male';

select * from endka;


select (select count(gender) from person where gender = 'Male') as Womens, (select count(gender) from person where gender= 'Famale') as Mans;