-- CREATE DATABASE def_ass7;

create table dealer (
    id integer primary key ,
    name varchar(255),
    location varchar(255),
    commission float
);

INSERT INTO dealer (id, name, location, commission) VALUES (101, 'Oleg', 'Astana', 0.15);
INSERT INTO dealer (id, name, location, commission) VALUES (102, 'Amirzhan', 'Almaty', 0.13);
INSERT INTO dealer (id, name, location, commission) VALUES (105, 'Ademi', 'Taldykorgan', 0.11);
INSERT INTO dealer (id, name, location, commission) VALUES (106, 'Azamat', 'Kyzylorda', 0.14);
INSERT INTO dealer (id, name, location, commission) VALUES (107, 'Rahat', 'Satpayev', 0.13);
INSERT INTO dealer (id, name, location, commission) VALUES (103, 'Damir', 'Aktobe', 0.12);

create table client (
    id integer primary key ,
    name varchar(255),
    city varchar(255),
    priority integer,
    dealer_id integer references dealer(id)
);

INSERT INTO client (id, name, city, priority, dealer_id) VALUES (802, 'Bekzat', 'Satpayev', 100, 101);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (807, 'Aruzhan', 'Almaty', 200, 101);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (805, 'Али', 'Almaty', 200, 102);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (808, 'Yerkhan', 'Taraz', 300, 102);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (804, 'Aibek', 'Kyzylorda', 300, 106);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (809, 'Arsen', 'Taldykorgan', 100, 103);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (803, 'Alen', 'Shymkent', 200, 107);
INSERT INTO client (id, name, city, priority, dealer_id) VALUES (801, 'Zhandos', 'Astana', null, 105);

create table sell (
    id integer primary key,
    amount float,
    date timestamp,
    client_id integer references client(id),
    dealer_id integer references dealer(id)
);

INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (201, 150.5, '2021-10-05 00:00:00.000000', 805, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (209, 270.65, '2021-09-10 00:00:00.000000', 801, 105);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (202, 65.26, '2021-10-05 00:00:00.000000', 802, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (204, 110.5, '2021-08-17 00:00:00.000000', 809, 103);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (207, 948.5, '2021-09-10 00:00:00.000000', 805, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (205, 2400.6, '2021-07-27 00:00:00.000000', 807, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (208, 5760, '2021-09-10 00:00:00.000000', 802, 101);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (210, 1983.43, '2021-10-10 00:00:00.000000', 804, 106);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (203, 2480.4, '2021-10-10 00:00:00.000000', 809, 103);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (212, 250.45, '2021-06-27 00:00:00.000000', 808, 102);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (211, 75.29, '2021-08-17 00:00:00.000000', 803, 107);
INSERT INTO sell (id, amount, date, client_id, dealer_id) VALUES (213, 3045.6, '2021-04-25 00:00:00.000000', 802, 101);

--1
--a
SELECT * FROM client WHERE priority < 300;
--b
SELECT * FROM dealer CROSS JOIN client;
--OR
SELECT * FROM dealer, client;
--OR
SELECT * FROM dealer INNER JOIN client ON TRUE;
--c
SELECT * FROM dealer d JOIN client c ON d.id = c.dealer_id
                       JOIN sell s ON d.id = s.dealer_id AND c.id = s.client_id;
--d
SELECT * FROM dealer d JOIN client c ON d.location = c.city;
--e
SELECT s.id, s.amount, c.name, c.city FROM sell s JOIN client c ON s.client_id = c.id
                                      WHERE s.amount > 200 AND s.amount < 500;
--f
SELECT dealer.name, location, client.name, city FROM
        dealer RIGHT JOIN  client on dealer.id = client.dealer_id;
--g
SELECT c.name, c.city, d.name, d.commission FROM dealer d JOIN client c on d.id = c.dealer_id;
--h
SELECT c.name, c.city, d.name, d.commission FROM dealer d JOIN client c on d.id = c.dealer_id
                                            WHERE d.commission > 0.13;
--i
SELECT c.name, city, s.id, date, amount, d.name, commission
    FROM client c LEFT JOIN public.sell s ON c.id = s.client_id
        LEFT JOIN dealer d ON c.dealer_id = d.id;

--j
SELECT client.name, priority, dealer.name, s.id, amount
    FROM client RIGHT JOIN dealer ON client.dealer_id = dealer.id
        RIGHT JOIN sell s ON client.id = s.client_id
        WHERE s.amount >= 2000  AND priority IS NOT NULL;


--2
--a
CREATE OR REPLACE VIEW days AS
    SELECT date, count(DISTINCT id), avg(amount), sum(amount) FROM sell
        GROUP BY date;
SELECT * FROM days;
-- b
CREATE OR REPLACE VIEW top_amounts AS SELECT date, sum(amount)
                                      FROM sell GROUP BY date
                                                ORDER BY sum(amount) DESC LIMIT 5;

SELECT * FROM top_amounts;
-- c
CREATE OR REPLACE VIEW dealer_amounts AS SELECT dealer_id, count(id), avg(amount), sum(amount)
                                         FROM sell GROUP BY dealer_id ORDER BY dealer_id;

SELECT * FROM dealer_amounts;

--d
CREATE OR REPLACE VIEW city_amounts AS SELECT d.location, sum(s.amount) * sum(d.commission) AS total
                                       FROM dealer d INNER JOIN sell s ON d.id = s.dealer_id
                                       GROUP BY d.location;

SELECT * FROM city_amounts;
--e
CREATE OR REPLACE VIEW loc AS
    SELECT location, count(s.id), avg(amount), sum(amount) AS sum
        FROM dealer JOIN sell s on dealer.id = s.dealer_id
        GROUP BY  location;
SELECT * FROM loc;
---f
CREATE OR REPLACE VIEW city AS
    SELECT city, count(s.id), avg(amount), sum(amount) AS summ
        FROM sell s JOIN client c ON c.id = s.client_id
        GROUP BY city;
SELECT * FROM city;
---g
CREATE OR REPLACE VIEW com AS
    SELECT city, sum, summ FROM loc INNER JOIN city ON location = city
        WHERE summ > sum;

select * from com;