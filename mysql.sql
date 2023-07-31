create database class2;

use class2;

create table SalesPeople(
snum int(4) primary key,
sname char unique,
city varchar(20),
comm int(2)
);

select * from SalesPeople;

alter table SalesPeople
modify column sname char(15);

insert into SalesPeople values(1001,'Peel','London',12);
insert into SalesPeople values(1002,'Serres','Sanjose',13);
insert into SalesPeople values(1004,'Motika','London',11);
insert into SalesPeople values(1007,'Rifkin','Barcelona',15);
insert into SalesPeople values(1003,'Axelrod','Newyork',10);

create table customers(
cnum int(4) primary key,
cname varchar(15),
city varchar(20),
snum int(4),
foreign key (snum) references SalesPeople (snum)
);

select * from customers;

insert into customers values(2001,'Hoffman','London',1001);
insert into customers values(2002,'Giovanni','Rome',1003);
insert into customers values(2003,'Liu','Sanjose',1002);
insert into customers values(2004,'Grass','Berlin',1002);
insert into customers values(2006,'Clemens','London',1001);
insert into customers values(2008,'Cisneros','Sanjose',1007);
insert into customers values(2007,'Pereira','Rome',1004);

create table orders(
onum int(4) primary key,
amt float(7),
odate date,
cnum int(4),
foreign key (cnum) references customers(cnum),
snum int(4),
foreign key (snum) references SalesPeople(snum)
);

select * from orders;

insert into orders values(3001,18.69,'1990-10-3',2008,1007);
insert into orders values(3003, 767.19, '1990-10-03', 2001, 1001);
insert into orders values(3002, 1900.10, '1990-10-03', 2007, 1004);
insert into orders values(3005, 5160.45, '1990-10-03', 2003, 1002);
insert into orders values(3006, 1098.16, '1990-10-03', 2008, 1007);
insert into orders values(3009, 1713.23, '1990-10-04', 2002, 1003);
insert into orders values(3007, 75.75, '1990-10-04', 2004, 1002);
insert into orders values(3008, 4273.00, '1990-10-05', 2006, 1001);
insert into orders values(3010, 1309.95, '1990-10-06', 2004, 1002);
insert into orders values(3011, 9891.88, '1990-10-06', 2006, 1001);

select * from orders;

--Count the number of Salesperson whose name begin with ‘a’/’A’
select count(*) as count_aA
from SalesPeople
where sname like 'a%' or sname like 'A%';

-- Display all the Salesperson whose all orders worth is more than Rs. 2000.
select * from orders
where amt > 2000;

-- Count the number of Salesperson belonging to Newyork.
select count(*) as count_Newyork
from SalesPeople
where city = 'Newyork'; 

-- Display the number of Salespeople belonging to London and belonging to Paris.
select * from SalesPeople
where city = 'London' or 'Paris';

-- Display the number of orders taken by each Salesperson and their date of orders.
select snum, count(onum) as num_orders, odate
from orders
group by snum, odate;
