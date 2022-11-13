create table person(
    id serial primary key ,
    name_ varchar(25),
    surname varchar(25),
    address varchar(100),
    age integer,
    birth_day date,
    gpa float
);

insert into person(name_, surname, address, age, birth_day, gpa)
values ('Aliya','Duisenbek','Kasym Datka',17,'2005-05-15',3.00);


update person set gpa = 3.2
where id = 3;

select * from person;

create table person2(
    like person including all
);

select * from person2;