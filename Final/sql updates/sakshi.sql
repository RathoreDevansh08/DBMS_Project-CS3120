delete from company;
delete from company_req;
alter table company add column phoneno varchar(12);
alter table company add column email_id varchar(30);
insert into company values ("10101","Google","google","Banglore","Tech Company","11111","google@gmail.com");
insert into company values ("10102","Detect Technology","Detect","Chennai","Tech Company","11011","detect@gmail.com");
insert into company values ("10103","Google","Adobe","Banglore","Tech Company","11110","adobe@gmail.com");
alter table company_req add column posted_by varchar(30) not null;
alter table company_req add column company_overview varchar(100) not null;
alter table company_req add column selection_procedure varchar(100) not null;
alter table company_req add column additional_info varchar(100);
alter table company_req add column location varchar(30) not null;
alter table company_req add column intern_details varchar(100) not null;
alter table company_req add column profile_name varchar(100) not null;

insert into company_req values ('1', '10101', 'coding', '1', '1', '2', '70000', '2020-05-01', '2020-06-30', '2020-04-18', 'google', 'American multinational company', '2 Interviews', 'asdef', 'Bangalore', 'asdef', 'Product Intern', '0');

insert into company_req values ('2', '10102', 'html css typescript angular', '12', '3', '2', '20000', '2020-05-05', '2020-06-30', '2020-04-18', 'Detect Technology', 'Start-up', 'Telephonic Interview', 'asdef', 'Chennai', 'asdef', 'Web Application', '0');

insert into applied values('111701018','2','IT','1','2','core');
insert into applied values('111701019','2','IT','1','2','core');
