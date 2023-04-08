select * from EmployeeDemographics;

select distinct JobTitle from EmployeeSalary;

select * from EmployeeSalary s join  EmployeeDemographics d on s.EmployeeID = d.EmployeeID ;

select * from EmployeeSalary s full join  EmployeeDemographics d on s.EmployeeID = d.EmployeeID ;

select * from EmployeeSalary s left join  EmployeeDemographics d on s.EmployeeID = d.EmployeeID ;

select * from EmployeeSalary s right join  EmployeeDemographics d on s.EmployeeID = d.EmployeeID ;





select Salary,JobTitle,EmployeeID ,
case
when Salary <= 42000 then 'class c'
else 'none'
end
from EmployeeSalary;


/* Case Statement */

select distinct JobTitle,
case 
when JobTitle = 'HR' then (Salary + Salary*0.3)
when JobTitle = 'Accountant' then (Salary + Salary*0.5)
when JobTitle = 'Receptionist' then (Salary + Salary*0.23)
else (Salary + Salary*0.1)
end 
as new_Salary 
from EmployeeSalary;

select * from EmployeeSalary s join  EmployeeDemographics d on s.EmployeeID = d.EmployeeID ;

select JobTitle , count(JobTitle)  from EmployeeSalary s  join  EmployeeDemographics d on s.EmployeeID = d.EmployeeID 
group by JobTitle 
having count(JobTitle)>1;

select * from EmployeeDemographics;

update EmployeeDemographics 
set Gender = 'male'
where Gender is NULL;


delete from EmployeeDemographics 
where EmployeeID = 1008;

--SELECT column1, column2, SUM(column3) OVER (PARTITION BY partition_column ORDER BY sort_column) AS total
--FROM my_table



select FirstName , LastName , Gender , Salary ,COUNT(Gender) over(Partition  by Gender ) as total_Gender 
from EmployeeSalary s join  EmployeeDemographics d on s.EmployeeID = d.EmployeeID 
group by Gender
;



select * from EmployeeSalary ;

select distinct JobTitle , count(JobTitle) over(partition by JobTitle) as TotalJobTitle  from EmployeeSalary ;

select distinct JobTitle , count(JobTitle)  from EmployeeSalary group by JobTitle;