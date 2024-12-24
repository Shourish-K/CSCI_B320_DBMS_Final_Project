-- Departments Trigger --

DROP TABLE IF EXISTS TEST_Departments

CREATE TABLE TEST_Departments
([DepartmentID] int NOT NULL,
  [DepartmentAbbreviation] char(4) NOT NULL,
  [DepartmentName] nvarchar(40) NOT NULL,
  [College] varchar(50) NOT NULL,
  CONSTRAINT PK_TestDepartments PRIMARY KEY CLUSTERED 
    (
	    DepartmentID ASC
    )
)

GO

CREATE TRIGGER DepartmentsForeignKeyConvertor ON TEST_Departments
	INSTEAD OF INSERT 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @DepartmentID int;
	DECLARE @DepartmentAbbreviation nvarchar(30);
	DECLARE @DepartmentName nvarchar(50);
	DECLARE @College nvarchar(30);

	DECLARE @CollegeID int;

	SELECT @DepartmentID = INSERTED.DepartmentID
	FROM INSERTED

	SELECT @DepartmentAbbreviation = INSERTED.DepartmentAbbreviation
	FROM INSERTED

	SELECT @DepartmentName = INSERTED.DepartmentName
	FROM INSERTED

	SELECT @College = INSERTED.College
	FROM INSERTED

	SELECT @CollegeID = CollegeID
	FROM Colleges
	WHERE Name = @College


	SET IDENTITY_INSERT [Departments] ON
	INSERT INTO Departments(DepartmentID, DepartmentAbbreviation, DepartmentName, CollegeID)
	VALUES (@DepartmentID, @DepartmentAbbreviation, @DepartmentName, @CollegeID)
	SET IDENTITY_INSERT [Departments] OFF
END

GO

INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College) 
VALUES (1,NULL,NULL,'USC Beaufort');
INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College)
VALUES (2,'2BUC','USC-B Business & Comm','USC Beaufort');
INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College) 
VALUES (3,'2CSC','USC-B Computer Science','USC Beaufort');
INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College) 
VALUES (4,'2EDU','USC-B Education','USC Beaufort');
INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College) 
VALUES (5,'2EVA','USC-B English & Visual Arts','USC Beaufort');
INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College) 
VALUES (6,'2HSM','USC-B Hospitality Management','USC Beaufort');
INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College) 
VALUES (7,'2HSS','USC-B Humanities & Social Sci','USC Beaufort');
INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College) 
VALUES (8,'2MCS','USC-B Math & Comp Sci','USC Beaufort');
INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College) 
VALUES (9,'2MTH','USC-B Mathematics','USC Beaufort');
INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College) 
VALUES (10,'2NUR','USC-B Nursing','USC Beaufort');
INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College) 
VALUES (11,'2PHH','USC-B Public Hlth & Human Serv','USC Beaufort');
INSERT INTO TEST_Departments(DepartmentID,DepartmentAbbreviation,DepartmentName,College) 
VALUES (12,'2SMT','USC-B Natural Sciences','USC Beaufort');

GO