create table pracownik (
	id_pracownika int auto_increment primary key,
    imie varchar(40) not null,
    nazwisko varchar(60) not null,
    data_urodzenia date not null
);

insert into pracownik (imie, nazwisko, data_urodzenia) values
	('Lina', 'Malina', '1999-09-08'),
    ('Kazik', 'Lizbonski', '2003-04-05'),
    ('Anna', 'Wanna', '2137-06-07');

update pracownik
set data_urodzenia = '2001-05-06' where id_pracownika = 1;


create table zadanie (
	id_zadania int auto_increment primary key,
    nazwa_zadania varchar(150) not null,
    priorytet enum('normalny', 'wysoki', 'niski'),
    opis text,
    pracownik int,
    foreign key (pracownik) references pracownik(id_pracownika) on delete set null
);
    
alter table zadanie
modify column priorytet enum('normalny', 'wysoki', 'niski') default 'normalny';

insert into zadanie (nazwa_zadania, priorytet, opis, pracownik) values 
	('Sporzadzenie raportu miesiecznego', 'wysoki', 'dokumentacja finansowa', 1),
    ('Umowienie spotkania', 'normalny', 'stan faktyczny', 2),
    ('Zrobienie kawki dla prezesa', 'niski', 'zadowolenie prezesa', 3);
    
create table projekt (
	id_projektu int auto_increment primary key,
    nazwa_projektu varchar(150) not null,
    data_rozpoczecia date not null,
    data_zakonczenia date
);

alter table projekt
	add column menadzer_projektu int,
	add foreign key (menadzer_projektu) references pracownik(id_pracownika);
    
insert into projekt (nazwa_projektu, data_rozpoczecia, data_zakonczenia) values
	('tajny projekt', '2023-09-08', '2024-07-06', 1),
    ('strefa67', '1999-04-05', null, 2);
    
alter table zadanie
add column projekt int,
add foreign key (projekt) references projekt(id_projektu) on delete cascade;

update zadanie set projekt = 1 where id_zadania = 1;
update zadanie set projekt = 1 where id_zadania = 2;
update zadanie set projekt = 2 where id_zadania = 3;


create table sprint (
	id_sprintu int auto_increment primary key,
    numer_sprintu int unsigned not null,
    data_rozpoczecia date not null,
    data_zakonczenia date
);

alter table zadanie
add column sprint int,
add foreign key (sprint) references sprint(id_sprintu) on delete set null;

insert into sprint (numer_sprintu, data_rozpoczecia, data_zakonczenia) values
	(1, '2022-02-02', '2023-04-04');

update zadanie
set sprint = 1 where id_zadania = 1 or id_zadania = 2;

create table `status` (
	id_statusu int auto_increment primary key,
    nazwa_statusu varchar(20) not null
);

insert into `status`(nazwa_zadania) values
	('nowe'),
    ('w trakcie'),
    ('zakonczone');
    
create table zadanie_has_status (
	id_zdarzenia int auto_increment primary key,
    id_zadania int not null,
    id_statusu int not null,
    data_zdarzenia datetime default current_timestamp,
    foreign key (id_zadania) references zadanie(id_zadania) on delete cascade,
    foreign key (id_statusu) references status(id_statusu) on delete cascade
);

insert into zadanie_has_status (id_zadania, id_statusu) values
	(1, 1),
    (2, 2),
    (3, 3);
    
delete from projekt where id_projektu = 1;
select * from zadanie;

drop table sprint;


