create table customer(
  CustomerID int not null primary key ,
  Name nvarchar(50),
  City nvarchar(50),
  Country nvarchar(50),
  Phone nvarchar(50),
  Email nvarchar(50)
);

create table customerAccount(
AccountNumber char(9) not null primary key,
CustomerID int not null foreign key references Customer(CustomerID),
Balance money not null,
MinAccount money
);
 
create table CustomerTransaction(
TransactionID int primary key not null,
AccountNumber char(9)foreign key references customerAccount(AccountNumber),
TransactionDate smalldatetime,
Amount money,
DepositorWithdraw bit
);


/* 3.inser into each table at least 3 records.*/
insert into customer(CustomerID,Name,City,Country,Phone,Email)
values
(1,'Nguyen Van An','Ha Noi','Viet Nam ', '0123456789','annguyen@gmail.com'),
(2,'Nguyen Bui linh','Sai Gon','Viet Nam ', '098765432','annguyen@gmail.com'),
(3,'Tran Van Thai','Da Nang','Viet Nam ', '0345678236','annguyen@gmail.com');
 select * from customer;

insert into customerAccount(AccountNumber,CustomerID,Balance,MinAccount)
values
('000000088', 1 , 150000 ,500),
('000000066', 2 , 150000 ,500),
('000000044', 3 , 150000 ,500);


insert into CustomerTransaction (TransactionID,AccountNumber,TransactionDate,Amount,DepositorWithdraw)
values 
(1,'0000055', '2021-10-12',200000, 1),
(1,'0000045', '2022-01-21',200000, 1),
(1,'0000075', '20202-09-27',200000, 1);

/*.4*/
select * from customer where City = ' Ha Noi ';

/* 5 */
select A.Name, A.phone , A.Email, C.AccountNumber, C.Balance from customer A
inner join customerAccount C on A.CustomerID = C.CustomerID;
/* 6 */
Alter table CustomerTransaction
add check ( Amount >0 and Amount <= 100000);
/* 7*/
CREATE VIEW CustomerTransaction
AS
SELECT C.Name, CA.AccountNumber, CT.TransactionDate, CT.Amount, CT.DepositorWithdraw
FROM Customer C
JOIN CustomerAccount CA
	ON C.CustomerId = CA.CustomerId
JOIN CustomerTransaction CT
	ON CA.AccountNumber = CT.AccountNumber;
GO