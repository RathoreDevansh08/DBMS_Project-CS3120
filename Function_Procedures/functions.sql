
alter table student
add column semester enum('1','2','3','4','5','6','7','8');//

update student
set semester='6' where name="Devansh Rathore";//

update student
set semester='6' where name="Himanshu Jain";//

update student
set semester='2' where name="Sneha Jain";//

update student
set semester='2' where name="Suresh Gupta";//

update student
set semester='6' where name="Supriya S";//

create procedure companies_applied(in stud_id varchar(10))
begin
select C.name from company as C, company_req, applied
where C.company_id = company_req.company_id and applied.application_id = company_req.application_id
and applied.student_id=stud_id;
end//

create procedure company_selected(in stud_id varchar(10))
begin
select C.name, selected.semester
from company as C, company_req, selected
where C.company_id = company_req.company_id and selected.application_id=company_req.application_id
and selected.student_id=stud_id;
end//

create function isVerified(stud_id varchar(10))
returns tinyint(1)
return (select verified from student where student_id=stud_id);//

create procedure company_details(in company_name char(30))
begin
select * from company,company_req
where company.company_id=company_req.company_id and company.name=company_name;
end//

create procedure my_details(in stud_id varchar(10))
begin
select * from student
where student_id=stud_id;
end//

create procedure received_messages(in stud_id varchar(10))
begin
select notice from msg_tostud_view
where not_to=stud_id;
end//

create procedure sent_messages(in stud_id varchar(10))
begin
select notice from msg_fromstud_view
where not_from=stud_id;
end//

update notifications
set notice="You are selected";//

update notifications
set notice="When will I need to join in the company"
where not_from="tpo";//




--Devansh Part

-- tpo functions and procedures >>>>>>>>>>>>

create procedure print_stats () 
begin
select * from selected;
select * from applied;
select * from company;
select @app_cnt := count(distinct student_id) from applied;
select @sel_cnt := count(distinct student_id) from selected;
select @sel_cnt/(@app_cnt + @sel_cnt) * 100 as selected_percentage; 
select count(distinct student_id) as core_selections from selected where core='core';
select count(distinct student_id) as noncore_selections from selected where core='noncore';
end //

create procedure print_tpo_msgs ()
begin
select message_id, not_to as reciever, notice from msg_fromtpo_view;
select message_id, not_from as sender, notice from msg_totpo_view;
end //

-- also to reps
create procedure get_stud_details (in sid varchar(10))
begin
select * from student where student_id = sid ;
select * from applied where student_id = sid ;
select * from selected where student_id = sid ;
select * from grades where student_id = sid ;
select * from electives where student_id = sid ;
select * from project where student_id = sid ;
select * from technical_skills where student_id = sid ;
select * from extracurricular where student_id = sid ;
select * from por where student_id = sid ;
end //

create procedure get_rep_details ()
begin
select student_rep_id, student_id from student_rep ;
select staff_id from staff_rep ;
end //

-- also to reps
create procedure get_company_details ()
begin
select * from company;
select * from company_req;
end //


-- rep functions and procedures >>>>>>>>>>>

create function verified_cnt ()
returns int(10)
begin
declare vcnt int(10);
select count(*) into vcnt from student where verified = 1;
return vcnt; 
end //

create procedure upd_verified (sid varchar(10))
begin
update student set verified = 1 where student_id = sid;
end //

-- student rep
create procedure print_studrep_msgs (in srid varchar(10))
begin
select message_id, not_to as reciever, notice from msg_fromstudrep_view where not_from = srid;
select message_id, not_from as sender, notice from msg_tostudrep_view where not_to = srid;
end //

-- staff rep
create procedure print_staffrep_msgs (in srid varchar(10))
begin
select message_id, not_to as reciever, notice from msg_fromstaffrep_view where not_from = srid;
select message_id, not_from as sender, notice from msg_tostaffrep_view where not_to = srid;
end //


--Sakshi Part

create procedure select_student_cgpa(in threshold int, in app_id varchar(10))
begin
select student_id, cgpa from grades natural join selected natural join company_req where cgpa>=threshold and application_id=app_id order by cgpa desc;
end//

update applied set semester = 2 where student_id="111701018" or student_id="111701019";//

update applied set semester = 6 where student_id="111701020";//

create procedure applied_student_cgpa(in threshold int, in app_id varchar(10))
begin
select student_id, cgpa from grades natural join applied natural join company_req  where cgpa>=threshold and application_id=app_id order by cgpa desc;
end//

create procedure select_student_profile(in app_id varchar(10))
begin
select student_id, name, mail_id, admission_year, admission_cat, branch, jee_rank, dob, nationality, contact, address, stream, semester from student natural join selected where application_id = app_id;
end//

create procedure applied_student_profile(in app_id varchar(10))
begin
select student_id, name, mail_id, admission_year, admission_cat, branch, jee_rank, dob, nationality, contact, address, stream, semester from student natural join applied where application_id = app_id;
end//

create procedure select_student_branch(in br varchar(30), in app_id varchar(10))
begin
select student_id from selected natural join student where branch=br and app_id=application_id;
end//

create procedure applied_student_branch(in br varchar(30), in app_id varchar(10))
begin
select student_id from applied natural join student where branch=br and app_id=application_id;
end//

create procedure select_student_sem(in app_id varchar(10))
begin
select student_id, semester from selected where app_id=application_id;
end//

create procedure applied_student_sem(in app_id varchar(10))
begin
select student_id, semester from applied where app_id=application_id;
end//

-- grants starts here

grant execute on procedure companies_applied to stud_role;//

grant execute on procedure company_selected to stud_role;//

grant execute on procedure isVerified to stud_role;//

grant execute on function isVerified to stud_rep_role;//

grant execute on function isVerified to tpo_role;//

grant execute on procedure company_details to stud_role;//

grant execute on procedure my_details to stud_role;//

grant execute on procedure received_messages to stud_role;//

grant execute on procedure sent_messages to stud_role;//

grant execute on procedure print_stats to tpo_role;//

grant execute on procedure print_tpo_msgs to tpo_role;//

grant execute on procedure get_stud_details to tpo_role;//

grant execute on procedure get_stud_details to stud_rep_role;//

grant execute on procedure get_stud_details to staff_rep_role;//

grant execute on procedure get_rep_details to tpo_role;//

grant execute on procedure get_company_details to tpo_role;//

grant execute on procedure get_company_details to stud_rep_role, staff_rep_role;//

grant execute on function verified_cnt to stud_rep_role, staff_rep_role;//

grant execute on procedure upd_verified to stud_rep_role, staff_rep_role;//

grant execute on procedure print_studrep_msgs to stud_rep_role; //

grant execute on procedure print_staffrep_msgs to staff_rep_role;//

grant execute on procedure select_student_cgpa to comp_role;//

grant execute on procedure applied_student_cgpa to comp_role;//

grant execute on procedure select_student_sem to comp_role;//

grant execute on procedure applied_student_sem to comp_role;//

grant execute on procedure select_student_profile to comp_role;//

grant execute on procedure applied_student_profile to comp_role;//

grant execute on procedure applied_student_branch to comp_role;//

grant execute on procedure select_student_branch to comp_role;//

grant select on student to stud_role;//

grant select on company to stud_role;//

grant select on applied to stud_role;//

grant select on selected to stud_role;//

grant select on company_req to stud_role;//

grant select on student to comp_role;//
grant select on selected to comp_role;//
grant select on applied to comp_role;//
grant select on grades to comp_role;//
grant select on company_req to comp_role;//
grant select on company to comp_role;//


