--1.
-- create database ass_6;
--2
create table locations(
    location_id serial primary key ,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);
create table departments(
    department_id   serial primary key,
    department_name varchar(50) unique,
    budget          integer,
    location_id     integer references locations
);

create table employees(
    employee_id serial primary key,
    first_name varchar (50),
    last_name varchar (50),
    email varchar (50),
    phone_number varchar (20),
    salary integer,
    department_id integer references departments
    );
-- 3

INSERT INTO locations(street_address, postal_code, city, state_province) VALUES('Tole Bi 59', '050000', 'Almaty', 'Almaty');
INSERT INTO locations(street_address, postal_code, city, state_province) VALUES('Lenina 10', '101000', 'Moscow', 'Moscow ');
INSERT INTO departments(department_id, department_name, budget, location_id) VALUES(30,'BS', 20000000, 1);
INSERT INTO departments(department_id, department_name, budget, location_id) VALUES(50,'ISE', 30000000, 4);
INSERT INTO departments(department_id, department_name, budget, location_id) VALUES(60,'FOGI', 40000000, 1);
INSERT INTO departments(department_id, department_name, budget, location_id) VALUES(70,'SAM', 50000000, 1);
INSERT INTO departments(department_id, department_name, budget, location_id) VALUES(80,'SCE', 20000000, 1);


select * from departments;
INSERT INTO employees(first_name, last_name, email,phone_number , salary,department_id )
VALUES('Ali', 'Alimov', 'a_aliomov@kbtu.kz', '7 778 305 15 26', 400000, 30);

INSERT INTO employees(first_name, last_name, email,phone_number , salary,department_id )
VALUES('Serik', 'Serikov', 's_serikov@kbtu.kz', '7 778 305 15 86', 500000, 50);

INSERT INTO employees(first_name, last_name, email,phone_number , salary,department_id )
VALUES('Berik', 'Berikov', 'b_berikov@kbtu.kz', '7 778 305 15 26', 400000, 60);

INSERT INTO employees(first_name, last_name, email,phone_number , salary,department_id )
VALUES('Malik', 'Malikov', 'm_malikov@kbtu.kz', '7 778 305 15 26', 400000, Null);

INSERT INTO employees(first_name, last_name, email,phone_number , salary,department_id )
VALUES('Murat', 'Muratov', 'm_muratov@kbtu.kz', '7 778 305 15 26', 400000, 80);

select e.first_name, e.last_name, e.department_id, d.department_name   from employees e left  outer join departments d on d.department_id = e.department_id


