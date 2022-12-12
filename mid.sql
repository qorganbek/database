create type WalletType as enum('KZT', 'USD', 'RUB', 'EUR');

create table person(
    name varchar(255),
    surname varchar(255),
    balance integer,
    type_wallet WalletType
);

select * from person;