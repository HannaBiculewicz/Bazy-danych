use infs_biculewiczh;
show tables;

create table CLIENT as select * from company_2025.CLIENT;
create table `ORDER` as select * from company_2025.`ORDER`;
create table EMPLOYEE as select * from company_2025.EMPLOYEE;

select * from `ORDER`;
select * from `ORDER` where ORDER_STATUS = 5;

SElect ORDER_ID, ORDER_STATUS from `ORDER` where CLIENT_ID in (1, 3, 5);

Select * from EMPLOYEE where FIRST_NAME = 'Agnieszka' and pensja = 3900;

select * from EMPLOYEE where pensja between 5000 and 7000;

select * from CLIENT where SHORT_NAME = '%eco%' and IS_COMPANY = 1;

select * from `ORDER` where month(ORDER_DATE) in (6, 7);

select * from CLIENT where TAX_IDENTIFIER is not null
order by SHORT_NAME ASC;

select * from EMPLOYEE 
order by BIRTH_DATE ASC limit 5;

select distinct FIRST_NAME from EMPLOYEE;

select concat(FIRST_NAME, '-', LAST_NAME) as pracownik from EMPLOYEE where LAST_NAME LIKE 'Ko%';

select LAST_NAME, pensja from EMPLOYEE where year(DATE_OF_EMPLOYMENT) between 2010 and 2014;

select
pensja,
pensja * 0.75 as pensja_netto,
pensja * 0.25 as kwota_podatku
from EMPLOYEE;

select * from CLIENT where TAX_IDENTIFIER is null;

select SHORT_NAME from CLIENT where SHORT_NAME like '%k%' or SHORT_NAME Like '%ski%'
order by SHORT_NAME desc;









