drop table tpo;
create table tpo ( tpo_id varchar(20), pass varchar(20), name varchar(20), email_id varchar(50), phone_number varchar(20), start_date date, end_date date, primary key(tpo_id));
insert into tpo values ("231701013", "password", "Santhosh Kumar", "231701013@smail.iitpkd.ac.in", "9343000", '2016-02-01', NULL);

drop table student_rep;
create table student_rep(student_id varchar(10) primary key, pass varchar(20), foreign key(student_id) references student(student_id))ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
insert into student_rep values("111701013","password"), ("111701018","password");

alter table company_req add column verified int(1) default 0;