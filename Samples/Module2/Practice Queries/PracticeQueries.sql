
--1.Calculate total salary of employee as Salary + commission and get employee name and Annual Salary.

Select Empname,(Salary+isnull(Commission,0)) *12 as TotalSal
From Employee

--2.Get all employees in department 10 and name starting with (a-c)

Select * From 
Employee where EmpName like '[a-c]%'

--3.Sort employees by department no and names.

Select * 
From Employee 
Order By FKDeptId,EmpName Desc

--4.Get employees with job as manager or clerk. 

Select *
From Employee 
Where Job In ('clerk', 'manager') 

--5.Get Top 3 Employees having Highest salaries

Select TOP (3) * 
From Employee 
Order By Salary Desc

--6.Get total no of employees in each department.

SELECT FKDeptId,COUNT(*) AS EmpCnt
FROM Employee
GROUP BY FKDeptId

--7.Get Max ,Min, Avg, Sum of Salary for each department.
SELECT FKDeptId,MIN(Salary) as MinSal,Max(Salary) as MaxSal ,Sum(Salary) as TotalSal
FROM Employee
GROUP BY FKDeptId


--8.Get total no of employees in each department with salary more than 1500.

SELECT FKDeptId,Count(*) AS EmpCnt 
FROM Employee
WHERE Salary>1500
GROUP BY FKDeptId

--9.Get total no of employees in 10, 30 department.

SELECT FKDeptId,Count(*) AS EmpCnt 
FROM Employee
WHERE FKDeptId in (10,30)

--10.Get Min,Max Salary  in each department,Department should have more than 3 employees

SELECT FKDeptId,MIN(Salary) as MinSal,Max(Salary) as MaxSal 
FROM Employee
GROUP BY FKDeptId
Having Count(*)>3

--11.Get Total no of employees hired in different years.
SELECT Year(HireDate),COUNT(*) AS EmpCnt
FROM Employee
GROUP BY Year(HireDate)



--12.Get Employee name,salary and DepartmentName

SELECT EmpName,Salary,DeptName
FROM Employee
INNER JOIN Department
ON FKDeptId=PKDeptId

--13.Get all Employee and department details.Include all employees if if department is not assigned to them
SELECT E.*,D.*
FROM Employee E
LEFT OUTER  JOIN Department D
ON E.FKDeptId=D.PKDeptId

--14.Get employee name,manager name and their salaries

SELECT E1.EmpName AS Employee, MGR.EmpName as Manager,E1.Salary as empsal,MGR.Salary AS MgrSal
FROM Employee E1 JOIN Employee MGR
ON E1.MANAGER=MGR.PKEmpId

--15.Get Department for which there is no employee

SELECT D.*
FROM Employee E
RIGHT OUTER  JOIN Department D
ON E.FKDeptId=D.PKDeptId
WHERE E.EmpName IS NULL

--16.Get Manager name and total number of employees working under that manager.
SELECT COUNT(E1.EmpName) AS EmpCnt, E2.EmpName as Manager
FROM Employee E1 JOIN Employee E2
ON E1.MANAGER=E2.PKEmpId
GROUP BY E2.EmpName

--17.Get details of employees with same salary as ‘SCOTT’
Select * 
from EMPLOYEE 
Where SALARY =(Select SALARY From EMPLOYEE Where EMPNAME ='SCOTT')

--18.Get employees having same job as BLAKE or  ALLEN

Select * 
From EMPLOYEE 
Where JOB IN (Select JOB From EMPLOYEE Where EMPNAME='BLAKE' OR EMPNAME='ALLEN')

--19.	Display the names of employees who earn salary more than that of Allen or Scott.
SELECT EmpName 
FROM Employee 
WHERE Salary>(SELECT MAX(Salary) FROM Employee WHERE EmpName IN('allen','Scott'))

--20.Get details of employees under manager ‘JONES’
Select * 
FROM EMPLOYEE
Where MANAGER = (Select PKEMPID From EMPLOYEE Where EMPNAME ='JONES')


--21.Get all employees having salary greater than average salary of their own department.

Select *
from EMPLOYEE E1 
Where E1.SALARY >(Select AVG(E2.SALARY) From EMPLOYEE E2 Where E1.FKDEPTID =E2.FKDEPTID )

/*22.	Select Department details having 
a.	At least one employee
b.	No employee*/

SELECT * 
FROM DEPARTMENT D 
WHERE EXISTS (SELECT * FROM EMPLOYEE E WHERE D.PKDeptId=E.FKDeptId)


SELECT * 
FROM DEPARTMENT D 
WHERE NOT EXISTS (SELECT * FROM EMPLOYEE E WHERE D.PKDeptId=E.FKDeptId)

--23.	Get empname,salary and average salary of department to which employee belongs to.

Select EmpName,Salary,T1.AVGSALARY From EMPLOYEE
INNER JOIN
(Select FKDepptId,AVG(Salary) AS AVGSALARY
From EMPLOYEE
Group By FKDeptId) AS T1
ON EMPLOYEE.FKdeptId = T1. FKdeptId


--24.Get Employee Details along with average Salary of their own Department.

SELECT FKDeptId,Salary,EmpName, Avg(Salary) OVER (PARTITION BY FKDeptid) FROM Employee


--25.Get Employee Details with average Salary of their own Department and difference between Salary and Avg Salary.
SELECT FKDeptId, Salary, EmpName, Avg(Salary) OVER (PARTITION BY FKDeptid),
Salary -Avg(Salary) OVER (PARTITION BY FKDeptid) as DiffSalary FROM Employee


--26 .Give ranks to all Employees based on Salary

Select Empname,Salary,Job,ROW_NUMBER() OVER (ORDER BY SALARY) AS RowNum From Employee
--27 .Give ranks to all Employees with same job, based on Salay

Select Empname,Salary,Job,Rank() OVER (partition by job ORDER BY SALARY) AS RowNum From Employee




