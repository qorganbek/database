--1problem
--a
select title from course where dept_name='Biology' and credits>3;
--b
select * from classroom where building='Watson' or building='Painter';
--c
select * from course where dept_name='Comp. Sci.';
--d
select * from course where course_id in(select course_id from section where semester='Spring');
--e
select * from student where tot_cred>45 and tot_cred<85;
--f
select *
from course
where right(title,1) in ('a', 'e', 'i', 'o', 'u','y');

--g
select * from course where course_id in(select course_id from prereq where prereq_id='EE-181');
--2task
--a
select distinct dept_name, avg(salary)
from instructor
group by dept_name
order by avg(salary);

--b
select building ,count(course_id) as count from section group by building
having count(course_id) in(select  max(res) from (select count(course_id) as res from section group by building)as foo);

--c
select dept_name, count(course_id) as count from course group by dept_name
having count(course_id) in (select min(res) from (select count(course_id) as res from course group by dept_name) as foo);

--d
select id,name from student where id in
                                  (select id from takes where course_id in
                                                                   (select course_id from course where course.dept_name='Comp. Sci.')
                                                        group by takes.id
                                                        having count(*)>3);
--e
select id,name from instructor where dept_name in(select dept_name from department where building ='Taylor');
--f
select * from instructor where dept_name='Biology' or dept_name='Music' or dept_name='Philosophy';
--g
select * from instructor where id in (
select id from teaches where year='2018'
intersect
select id
from teaches
group by id
having count(year)=1);

--3task
--a
select distinct s.id,name,s.dept_name,tot_cred from takes join course c on takes.course_id = c.course_id join student s on takes.id = s.id
          where c.dept_name='Comp. Sci.' and (grade='A' or grade='A-') order by name;
--b
select distinct s_id,i_id from advisor join student s on s.id = advisor.s_id where id in (
select id from takes where grade='B+' or grade='A-' or grade='A' or grade='A+'
except
select id from takes where not grade='A' and not grade='A-');

--c
select * from department where dept_name in (select dept_name from student where id in (
    select id from takes
    except
    select id from takes where grade='F' or grade='C' or grade='C+' or grade='C-'
    ));
--d
select distinct instructor.id, name,dept_name,salary from instructor join teaches t on instructor.id = t.id where course_id in(
select course_id from takes
except
select course_id from takes where grade='A' or grade='A-');

--e
select * from course where course_id in(
select course_id from section where time_slot_id in(
    select time_slot_id from time_slot where end_hr<13
    ));