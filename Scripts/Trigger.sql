DROP TABLE IF EXISTS TEST_Campuses

CREATE TABLE TEST_Campuses
([CampusID] int IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(50) NOT NULL,
  [Address] nvarchar(100) NOT NULL,
  [City] nvarchar(30) NOT NULL,
  [State] char(2) NOT NULL,
  [College] varchar(50) NOT NULL,
  CONSTRAINT PK_TestCampuses PRIMARY KEY CLUSTERED 
    (
	    CampusID ASC
    )
)
GO

CREATE TRIGGER CollegesForeignKeyConvertor ON TEST_Campuses
	INSTEAD OF INSERT 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @College nvarchar(30);
	DECLARE @Name nvarchar(30);
	DECLARE @Address nvarchar(50);
	DECLARE @City nvarchar(20);
	DECLARE @State char(2);

	DECLARE @CollegeID int;
	
	SELECT @College = INSERTED.College
	FROM INSERTED

	SELECT @Name = INSERTED.Name
	FROM INSERTED

	SELECT @Address = INSERTED.Address
	FROM INSERTED

	SELECT @City = INSERTED.City
	FROM INSERTED

	SELECT @State = INSERTED.State
	FROM INSERTED

	SELECT @CollegeID = CollegeID
	FROM Colleges
	WHERE Name = @College

	INSERT INTO Campuses(Name, Address, City, State, College)
	VALUES (@Name, @Address, @City, @State, @CollegeID)
END
GO

INSERT INTO [TEST_Campuses] (Name, Address, City, State, College)
VALUES (N'Hilton Head',N'1 Sand Shark Drive',N'Hilton Head Island',N'SC',29928,N'USC Beaufort'),
	(N'Bluffton',N'1 University Blvd',N'Bluffton',N'SC',29909,N'USC Beaufort'),
	(N'Beaufort',N'801 Carteret St',N'Beaufort',N'SC',29902,N'USC Beaufort')
GO

SELECT * FROM TEST_Campuses