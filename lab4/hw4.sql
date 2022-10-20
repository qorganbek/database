--ex1
--a
select title from course
where dept_name = 'Biology' and credits > 3;

--b
select * from classroom
where building = 'Taylor' or building = 'Watson';

--c
select * from course
where dept_name = 'Comp. Sci.';

--d
select  DISTINCT course.course_id,title,dept_name,credits from course
left join section on course.course_id = section.course_id
where semester = 'Spring';

--e
select * from student
where tot_cred between 45 and 85;

--f
select * from course
where title like '%e' or title like '%a' or title like '%u' or title like '%i' or title like '%o';

-- select * from course
-- where title like '%[aeiou]';
-- select * from course
-- where title like '.*[aeiou]$';

--g

-- select * from course
-- where course_id = 'EE-181';

select prereq_id from course
join prereq p on course.course_id = p.course_id
where p.course_id = 'EE-181';

--ex 2
--a
select avg(salary),dept_name from instructor
group by dept_name order by avg(salary) ASC;

--b


--c


--d










