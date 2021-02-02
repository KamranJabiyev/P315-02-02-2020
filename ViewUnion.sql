SELECT COUNT(*) FROM Students

SELECT * FROM Students

SELECT DISTINCT Name,Lastname FROM Students

SELECT COUNT(DISTINCT Name) FROM Students

SELECT Name,COUNT(Name) 'Count' FROM Students
GROUP BY Name
HAVING 
COUNT(Name)>1


CREATE TABLE Employees(
	Id int primary key identity,
	Name nvarchar(100) not null,
	Surname nvarchar(100)
)

CREATE TABLE OldEmployees(
	Id int primary key identity,
	Name nvarchar(100) not null,
	Surname nvarchar(100)
)

SELECT Name,Surname FROM Employees
UNION
SELECT Name,Surname FROM OldEmployees

SELECT Name,Surname FROM Employees
UNION All
SELECT Name,Surname FROM OldEmployees

SELECT Name,Surname FROM Employees
EXCEPT
SELECT Name,Surname FROM OldEmployees

SELECT Name,Surname FROM OldEmployees
EXCEPT
SELECT Name,Surname FROM Employees

SELECT Name,Surname FROM Employees
INTERSECT
SELECT Name,Surname FROM OldEmployees

CREATE TABLE Students(
	Id int primary key identity,
	Fullname nvarchar(150) not null,
	Email nvarchar(255) unique
)

CREATE TABLE StudentGroups(
	Id int primary key identity,
	StudentId int references Students(Id),
	GroupId int references Groups(Id)
)

ALTER TABLE Students
ADD Result int check(Result<=100 AND Result>=0)


CREATE VIEW GetStudentInfo
AS
SELECT st.Fullname,Email,g.Name 'Group',gt.Name 'Type',Result,Letter FROM Students st

JOIN StudentGroups sg
ON
st.Id=sg.StudentId

JOIN Groups g
ON
g.Id=sg.GroupId

JOIN GroupTypes gt
ON
gt.Id=g.GroupTypeId

JOIN Grades gr
ON
st.Result BETWEEN gr.MinGrade AND gr.MaxGrade


SELECT DISTINCT Fullname FROM GetStudentInfo
