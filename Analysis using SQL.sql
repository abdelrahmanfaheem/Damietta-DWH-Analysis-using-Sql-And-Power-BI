/*Calculate   the average marks for each subject. */
select   cast (AVG (f.Material_Percentage) as decimal(10,1)) as [Marks%], m.Material_Name_Eng
from  Fact_Student_Result f inner join Dim_Material m
on f.Material_SK=m.[Material SK]
where m.Material_Name_Eng !='Total'
group by m.Material_Name_Eng
order by [Marks%] desc

/*Find the students with the highest  in Total */
select   top 10 s.Student_name , cast (f.Material_Percentage as decimal (10,2) ) as[ Marks%], m.Material_Name_Eng
from Fact_Student_Result f inner join Dim_Student s 
on f.Studet_SK=s.Student_SK
inner join Dim_Material m 
on m.[Material SK] = f.Material_SK
where m.Material_Name_Eng='Total'
order by f.Material_Percentage desc

/*Find the students with the highest English */
select   top 10 s.Student_name , cast (f.Material_Percentage as decimal (10,2) ) as[ Marks%], m.Material_Name_Eng
from Fact_Student_Result f inner join Dim_Student s 
on f.Studet_SK=s.Student_SK
inner join Dim_Material m 
on m.[Material SK] = f.Material_SK
where m.Material_Name_Eng='English'
order by f.Material_Percentage desc

/*Find the students with the highest Arabic */
select   top 10 s.Student_name , cast (f.Material_Percentage as decimal (10,2) ) as[ Marks%], m.Material_Name_Eng
from Fact_Student_Result f inner join Dim_Student s 
on f.Studet_SK=s.Student_SK
inner join Dim_Material m 
on m.[Material SK] = f.Material_SK
where m.Material_Name_Eng='Arabic'
order by f.Material_Percentage desc

/*Find the students with the highest Math */
select   top 10 s.Student_name , cast (f.Material_Percentage as decimal (10,2) ) as[ Marks%], m.Material_Name_Eng
from Fact_Student_Result f inner join Dim_Student s 
on f.Studet_SK=s.Student_SK
inner join Dim_Material m 
on m.[Material SK] = f.Material_SK
where m.Material_Name_Eng='Math'
order by f.Material_Percentage desc

/*Find the students with the highest Science */
select   top 10 s.Student_name , cast (f.Material_Percentage as decimal (10,2) ) as[ Marks%], m.Material_Name_Eng
from Fact_Student_Result f inner join Dim_Student s 
on f.Studet_SK=s.Student_SK
inner join Dim_Material m 
on m.[Material SK] = f.Material_SK
where m.Material_Name_Eng='Science'
order by f.Material_Percentage desc


/*Find the students with  lowest average marks.*/
select   top 10 s.Student_name , cast (f.Material_Percentage as decimal (10,2) ) as[ Marks%], m.Material_Name_Eng
from Fact_Student_Result f inner join Dim_Student s 
on f.Studet_SK=s.Student_SK
inner join Dim_Material m 
on m.[Material SK] = f.Material_SK
where m.Material_Name_Eng='Total'
order by f.Material_Percentage asc


/*School-wise Analysis*/

/*Calculate the average marks for each subject within each school.*/
select  s.School_name,cast (AVG (f.Material_Percentage) as  decimal (8,2))as [Material%]
from Fact_Student_Result f inner join Dim_School s
on f.School_SK = s.School_SK
group by s.School_name


/*Identify the top-performing schools based on subject averages.*/
select top 10  s.School_name,cast (AVG (f.Material_Percentage) as  decimal (8,2))as [Material%]
from Fact_Student_Result f inner join Dim_School s
on f.School_SK = s.School_SK
group by s.School_name
order by [Material%] desc



/*Determine the average marks for each  education department.*/

select d.Edu_Dept_Name ,cast (avg(f.Material_Percentage)as decimal (10,2))as [Material %]
from Fact_Student_Result f inner join Dim_Education_Department d
on f.Edu_Dept_SK=d.Edu_Dept_SK
group by d.Edu_Dept_Name
order by [Material %] desc


/*Find the students who scored the highest in each subject*/

select    m.Material_Name_Eng  , s.Student_name , avg (f.Material_Percentage)as [Material %]
from Fact_Student_Result f  inner join Dim_Material m 
on f.Material_SK = m.[Material SK]
inner join Dim_Student s 
on f.Studet_SK=s.Student_SK
group by m.Material_Name_Eng , s.Student_name
order by [Material %] desc


/*Department-wise Analysis*/

/*Determine the average marks for each subject within each education department.*/


select  d.Edu_Dept_Name ,m.Material_Name_Eng,cast (avg(f.Material_Percentage)as decimal (10,2))as [Material %]
from Fact_Student_Result f inner join Dim_Education_Department d
on f.Edu_Dept_SK=d.Edu_Dept_SK
inner join Dim_Material m 
on f.Material_SK=m.[Material SK]
where m.Material_Name_Eng !='Total'
group by d.Edu_Dept_Name , m.Material_Name_Eng
order by d.Edu_Dept_Name

 