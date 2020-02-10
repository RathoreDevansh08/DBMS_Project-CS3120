-- sakshi
insert into student values ("111701018","Sneha Jain", "111701018@smail.iitpkd.ac.in", "$neha", 1, 2019, 1, 90.90, "Carmel Convent Higher Sec School", "CBSE", 94.90, "Gyan Sagar Academy", "CBSE", "General","CSE", "999", '2000-01-18', "India", "9999955555", "58 Shri Krishna Colony Ankpath Marg Ujjain MP", "BTech");

insert into grades (student_id, sem1, cgpa) values ("111701018", 9.9, 9.99);

insert into project values ("111701018", "Website", "Fest website for the college", '2019-06-09', '2020-08-09');

insert into electives values ("111701018", "CS0011", "Economics");
insert into electives values ("111701018", "CS0012", "Combinatorics");

insert into extracurricular values ("111701018", "TFS Correspondent", "A college indepedent media body coordinator"),("111701018", "BasketBall Player", "Have been selected for a state level tournament");

insert into technical_skills values ("111701018", "Competitive Programmer", "Chefcode, Codeforces"),("111701018", "Computer Lab Admin", "Lab admin");

insert into por values ("111701018", "Head Girl", '2016-08-08', '2017-08-08'), ("111701018", "Technical Sec.", '2019-07-05', '2020-02-12');

insert into company values ("10101", "Microsoft", "@#$%", "9 Ujjain Madhya Pradesh", "Deal with micro soft toys");

insert into company_req values ("I1101", "10101", "Competitive Coding", "1st year CSE, 2nd year CSE, 3rd year CSE", "BTech", 3, "120000", '2020-05-05', '2020-08-08', '2020-04-04');

insert into applied values ("111701018", "I1101", "IT", "Selected", "Second", "CORE");

insert into student_rep values ("Sneha", "111701018", "$neha");


-- himanshu
insert into student values ("111701013", "Himanshu Jain", "111701013@smail.iitpkd.ac.in", "kdhhg", 1, 2017, 1, 50, "St. Anselms North City School", "CBSE", 50, "St. Anselms North City School", "CBSE", "GEN", "CSE", 1, '1999-01-03', "Indian", "9920472047", "69, Narayan Dham, Niwaru Road", "B.Tech");


insert into grades (student_id,sem1,sem2,sem3,sem4,sem5,cgpa)
values ("111701013",1.1, 2.2, 3.3, 4.4, 5.5, 3.6);

insert into project
values ("111701013", "Arm Building Machine", "An automatic machine which build arms", '2018-01-01', 
'2018-01-02'), ("111701013", "Web Development", "Fest Website", '2019-04-01', '2020-01-20');

insert into electives
values ("111701013", "CS-102047", "ECONOMICS"), ("111701013", "CS-102011", "DEEP LEARNING");

insert into technical_skills
values ("111701013", "Programming Languages", "C C++ Python");

insert into extracurricular
values ("111701013", "Drummer", "Indias most wanted Drummer");

insert into por
values ("111701013", "Student General Secretary", '2017-08-01', '2021-04-30');

insert into tpo
values ("231701013", "password", "Santhosh Kumar");

insert into company
values ("000123", "Google", "password", "USA", "Largest growing tech company in the world");

insert into company_req
values ("I0001", "000123", "IQ", "4th year CSE 6th year CSE", "B.Tech", 2, 100000, '2020-05-01', '2020-08-01', '2020-02-20');

insert into notifications
values ("000111", "tpo", "111701013");

insert into selected
values ("111701013", "I0001", "6", "IT", "core");


-- devansh
insert into student values("111701011", "Devansh Rathore", "111701011@smail.iitpkd.ac.in", "dev111", 1, 2017, 1, 95.00, "DPS Aligarh, UP", "CBSE", 91.40, "OPJMS Hisar, Haryana", "CBSE", "General", "CSE", 4633, '1999-06-19', "India", "8078448422", "Houseno. 58, Patel Nagar, Bhatinda, Punjab", "B.Tech");

insert into grades(student_id,sem1,sem2,sem3,sem4,cgpa) values("111701011", 8.72, 8.48, 8.27, 8.78, 8.56);

insert into project values("111701011", "Cartoonifier", "Image processing, OpenCV", '2018-08-01', '2018-08-15');

insert into electives values("111701011", "CS1234", "Cryptography");
insert into electives values("111701011", "CS4321", "FunctionalProgramming");

insert into technical_skills values("111701011", "Competitive Programming", "Codechef, Codeforces");

insert into extracurricular values("111701011", "T.T.", "Intra College Sports");
insert into extracurricular values("111701011", "Chess", "Chess.com");

insert into por values("111701011", "DAC Head", '2018-08-01', '2019-08-01');

insert into student_rep values("shruti27", "111701011", "shruti@27");

insert into company values("GE101", "GE", "GE@101", "IT Park, Bangalore", "Electronic gadgets");

insert into company_req values("I0011", "GE101", "C++, ML", "CSE", "B.Tech 4th year", 10, 80000, '2020-05-01', '2020-07-01', '2019-10-01');

insert into company values("MW102", "MW", "MW@102", "IT Park, Bangalore", "Math softwares");

insert into company_req values("I0010", "MW102", "Python, ML, Web", "CSE", "B.Tech 3rd year", 5, 70000, '2020-05-01', '2020-08-01', '2019-10-05');

insert into applied values("111701011", "I0010", "Software",'verified', 6, "CORE");

insert into selected values("111701011", "I0011", "5", "Electronic", "CORE");

insert into staff_rep values ("Neil5061", "$1084"), ("Nitin8493","#3932"), ("Mukesh8800", "@1001");

insert into notifications values("MS1108", "111701011", "shruti27");
insert into notifications values("MS1109", "111701013", "Nitin8493");
insert into notifications values("MS1107", "231701013", "111701018");

