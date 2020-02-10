-- database: cdc

-- table student
create table student(
student_id varchar(10) NOT NULL,
name varchar(30) NOT NULL,
mail_id varchar(30) NOT NULL,
pass varchar(20) NOT NULL,
applicability bool NOT NULL DEFAULT 1,
admission_year YEAR NOT NULL,
verified bool DEFAULT 1,
tenth_percent decimal(4,2) NOT NULL,
tenth_school varchar(50) NOT NULL,
tenth_board varchar(30) NOT NULL,
twelth_percent decimal(4,2) NOT NULL, 
twelth_school varchar(50) NOT NULL,
twelth_board varchar(30) NOT NULL,
admission_cat varchar(10) NOT NULL,
branch varchar(30) NOT NULL,
jee_rank int(10) NOT NULL,
dob DATE NOT NULL, 
nationality varchar(20) NOT NULL,
contact varchar(15) NOT NULL,
address varchar(50) NOT NULL,
stream varchar(20) NOT NULL,
PRIMARY KEY (student_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table grades
create table grades(
student_id varchar(10) NOT NULL,
sem1 decimal(4,2),
sem2 decimal(4,2),
sem3 decimal(4,2),
sem4 decimal(4,2),
sem5 decimal(4,2),
sem6 decimal(4,2),
sem7 decimal(4,2),
sem8 decimal(4,2),
cgpa decimal(4,2),
PRIMARY KEY (student_id),
FOREIGN KEY (student_id) references student(student_id) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table project 
create table project(
student_id varchar(10) NOT NULL,
title varchar(30) NOT NULL,
description varchar(50),
start_date DATE NOT NULL,
end_date DATE NOT NULL,
PRIMARY KEY (student_id, title),
FOREIGN KEY (student_id) references student(student_id) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table electives
create table electives(
student_id varchar(10) NOT NULL,
course_id varchar(10) NOT NULL,
title varchar(30) NOT NULL,
PRIMARY KEY (student_id, course_id),
FOREIGN KEY (student_id) references student(student_id) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table technical_skills
create table technical_skills(
student_id varchar(10) NOT NULL,
title varchar(30) NOT NULL,
description varchar(50),
PRIMARY KEY (student_id, title),
FOREIGN KEY (student_id) references student(student_id) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table extracurricular
create table extracurricular(
student_id varchar(10) NOT NULL,
title varchar(30) NOT NULL,
description varchar(50),
PRIMARY KEY (student_id, title),
FOREIGN KEY (student_id) references student(student_id) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table por
create table por(
student_id varchar(10) NOT NULL,
description varchar(50) NOT NULL,
start_date DATE,
end_date DATE,
PRIMARY KEY (student_id, description),
FOREIGN KEY (student_id) references student(student_id) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table student_rep
create table student_rep(
student_rep_id varchar(10) NOT NULL,
student_id varchar(10) NOT NULL,
pass varchar(20) NOT NULL,
PRIMARY KEY (student_rep_id),
FOREIGN KEY (student_id) references student(student_id) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--table staff_rep
create table staff_rep(
staff_id varchar(10) NOT NULL,
pass varchar(20) NOT NULL,
PRIMARY KEY (staff_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- table tpo
create table tpo(
tpo_id varchar(10) NOT NULL,
pass varchar(20) NOT NULL,
name char(30) NOT NULL,
PRIMARY KEY (tpo_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table company_id
create table company(
company_id varchar(10) NOT NULL,
name char(30) NOT NULL,
pass varchar(20) NOT NULL,
location varchar(50) NOT NULL,
about varchar(50),
PRIMARY KEY (company_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table company_req
create table company_req(
application_id varchar(10) NOT NULL,
company_id varchar(10) NOT NULL,
required_skills varchar(50) NOT NULL,
eligibility varchar(50) NOT NULL,
eligible_disciplines varchar(50) NOT NULL,
vacancies int(6) NOT NULL DEFAULT 0,
stipend int(10) NOT NULL DEFAULT 0,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
deadline DATE NOT NULL,
PRIMARY KEY (application_id),
FOREIGN KEY (company_id) references company(company_id) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table applied
create table applied(
student_id varchar(10) NOT NULL,
application_id varchar(10) NOT NULL,
type varchar(10),
status varchar(10) NOT NULL DEFAULT 'unverified',
semester varchar(10) NOT NULL,
core varchar(10),
PRIMARY KEY (student_id, application_id),
FOREIGN KEY (application_id) references company_req(application_id) on delete cascade,
FOREIGN KEY (student_id) references student(student_id) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table selected
create table selected(
student_id varchar(10) NOT NULL,
application_id varchar(10) NOT NULL,
semester varchar(10) NOT NULL,
type varchar(10),
core varchar(10) NOT NULL,
PRIMARY KEY (student_id, application_id, semester),
FOREIGN KEY (application_id) references company_req(application_id) on delete cascade,
FOREIGN KEY (student_id) references student(student_id) on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- table notifications
create table notifications(
message_id varchar(10) NOT NULL,
not_from varchar(10) NOT NULL,
not_to varchar(10) NOT NULL,
PRIMARY KEY (message_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;






