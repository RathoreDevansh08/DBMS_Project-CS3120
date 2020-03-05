alter table notifications add notice varchar(100);

create view company_prof_view as select company_id,name,about,location,required_skills from company natural join company_req; 

create view company_elig_view as select company_id,name,eligibility,start_date,end_date,stipend,deadline from company natural join company_req;

create view applied_view as select student_id,student.name as student_name,branch,company_id,company.name as company_name,semester,status from applied natural join student natural join company;

create view selected_view as select student_id,student.name as student_name,student.branch,type,company_id,company.name as company_name from selected natural join student natural join company;

-- roles
create role tpo_role;
create role stud_role;
create role stud_rep_role;
create role staff_rep_role;
create role comp_role;

-- student roles
grant select on company_prof_view to stud_role;
grant select on company_elig_view to stud_role;
grant select,update on applied_view to stud_role;

-- student_rep, staff_rep roles
grant stud_role to stud_rep_role;
grant select on company_prof_view to stud_rep_role;
grant select on company_elig_view to stud_rep_role;
grant select on applied_view to stud_rep_role;
grant select on selected_view to stud_rep_role;

grant select on company_prof_view to staff_rep_role;
grant select on company_elig_view to staff_rep_role;
grant select on applied_view to staff_rep_role;
grant select on selected_view to staff_rep_role;

-- tpo
grant all privileges on cdc.* to tpo_role with grant option;

-- to notifications view
create view msg_totpo_view as 
(select * from notifications where notifications.not_to in (select tpo_id from tpo));

create view msg_tostud_view as 
(select * from notifications where notifications.not_to in (select student_id from student));

create view msg_tostudrep_view as 
(select * from notifications where notifications.not_to in (select student_rep_id from student_rep));

create view msg_tostaffrep_view as 
(select * from notifications where notifications.not_to in (select staff_id from staff_rep));

create view msg_tocomp_view as 
(select * from notifications where notifications.not_to in (select company_id from company));

--from notifications view
create view msg_fromtpo_view as 
(select * from notifications where notifications.not_from in (select tpo_id from tpo));

create view msg_fromstud_view as 
(select * from notifications where notifications.not_from in (select student_id from student));

create view msg_fromstudrep_view as 
(select * from notifications where notifications.not_from in (select student_rep_id from student_rep));

create view msg_fromstaffrep_view as 
(select * from notifications where notifications.not_from in (select staff_id from staff_rep));

create view msg_fromcomp_view as 
(select * from notifications where notifications.not_from in (select company_id from company));

create view stud_technical_skills as
(select student_id, student.name as name, title, description from student natural join technical_skills);

create view stud_extracurricular as
(select student_id, student.name as name, title, description from student natural join extracurricular);

create view stud_por as
(select student_id, student.name as name, description from student natural join por);

--grant views to roles
grant select on msg_fromcomp_view to comp_role;
grant select on msg_fromstud_view to stud_role;
grant select on msg_fromstudrep_view to stud_rep_role;
grant select on msg_fromstaffrep_view to staff_rep_role;

grant select on msg_tocomp_view to comp_role;
grant select on msg_tostud_view to stud_role;
grant select on msg_tostudrep_view to stud_rep_role;
grant select on msg_tostaffrep_view to staff_rep_role;

create view tenth_twelth as
(select student_id,name,admission_year,tenth_percent,tenth_school,tenth_board,twelth_percent,twelth_school,twelth_board
from student);

create view stud_profile as
(select student_id,name,dob,jee_rank,nationality,admission_year,stream,branch,admission_cat
from student);

create view stud_grades as
(select S.student_id,S.name,G.sem1,G.sem2,G.sem3,G.sem4,G.sem5,G.sem6,G.sem7,G.sem8 
from student as S, grades as G
where S.student_id = G.student_id);

create view stud_electives as
(select S.student_id,S.name, E.course_id,E.title
from student as S, electives as E
where S.student_id = E.student_id);

create view stud_verified as
(select student_id,name,verified
from student);

create view stud_project as
(select S.student_id,S.name,P.title,P.description
from student as S, project as P
where S.student_id = P.student_id);

grant all privileges on tenth_twelth to stud_role;
grant all privileges on stud_profile to stud_role;
grant all privileges on stud_grades to stud_role;
grant all privileges on stud_electives to stud_role;
grant all privileges on stud_project to stud_role;
grant all privileges on stud_technical_skills to stud_role;
grant all privileges on stud_extracurricular to stud_role;
grant all privileges on stud_por to stud_role;

grant select on tenth_twelth to stud_rep_role;
grant select on stud_profile to stud_rep_role;
grant select on stud_grades to stud_rep_role;
grant select on stud_electives to stud_rep_role;
grant select on stud_project to stud_rep_role;
grant select on stud_technical_skills to stud_rep_role;
grant select on stud_extracurricular to stud_rep_role;
grant select on stud_por to stud_rep_role;
grant all privileges on stud_verified to stud_rep_role;

grant select on tenth_twelth to tpo_role;
grant select on stud_profile to tpo_role;
grant select on stud_grades to tpo_role;
grant select on stud_electives to tpo_role;
grant select on stud_project to tpo_role;
grant select on stud_technical_skills to tpo_role;
grant select on stud_extracurricular to tpo_role;
grant select on stud_por to tpo_role;
grant all privileges on stud_verified to tpo_role;

--create user
create user 'Sneha'@'localhost' identified by '$neha';
create user 'Himanshu'@'localhost' identified by '2047';
create user 'Devansh'@'localhost' identified by '2047';
create user 'Google'@'localhost' identified by '2047';

--assigned roles to users
grant stud_rep_role to 'Sneha'@'localhost';
grant stud_role to 'Devansh'@'localhost';
grant stud_role to 'Himanshu'@'localhost';
grant comp_role to 'Google'@'localhost';


