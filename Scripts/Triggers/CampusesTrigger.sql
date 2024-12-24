-- Campuses Trigger --

DROP TABLE IF EXISTS TEST_Campuses

CREATE TABLE TEST_Campuses
([CampusID] int NOT NULL,
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

CREATE TRIGGER CampusesForeignKeyConvertor ON TEST_Campuses
	INSTEAD OF INSERT 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @CampusID nvarchar(30);
	DECLARE @Name nvarchar(30);
	DECLARE @Address nvarchar(50);
	DECLARE @City nvarchar(20);
	DECLARE @State char(2);
	DECLARE @College nvarchar(30);

	DECLARE @CollegeID int;

	SELECT @CampusID = INSERTED.CampusID
	FROM INSERTED

	SELECT @Name = INSERTED.Name
	FROM INSERTED

	SELECT @Address = INSERTED.Address
	FROM INSERTED

	SELECT @City = INSERTED.City
	FROM INSERTED

	SELECT @State = INSERTED.State
	FROM INSERTED

	SELECT @College = INSERTED.College
	FROM INSERTED

	SELECT @CollegeID = CollegeID
	FROM Colleges
	WHERE Name = @College

	SET IDENTITY_INSERT [Campuses] ON
	INSERT INTO Campuses(CampusID, Name, Address, City, State, CollegeID)
	VALUES (@CampusID, @Name, @Address, @City, @State, @CollegeID)
	SET IDENTITY_INSERT [Campuses] OFF
END

GO

INSERT INTO [TEST_Campuses] (CampusID, Name, Address, City, State, College)
VALUES (1, N'Hilton Head',N'1 Sand Shark Drive',N'Hilton Head Island',N'SC', N'USC Beaufort');
INSERT INTO [TEST_Campuses] (CampusID, Name, Address, City, State, College)
VALUES (2, N'Bluffton',N'1 University Blvd',N'Bluffton',N'SC', N'USC Beaufort');
INSERT INTO [TEST_Campuses] (CampusID ,Name, Address, City, State, College)
VALUES (3, N'Beaufort',N'801 Carteret St',N'Beaufort',N'SC', N'USC Beaufort');
INSERT INTO [TEST_Campuses] (CampusID ,Name, Address, City, State, College)
VALUES (4, N'USC Salkehatchie Campus',N'465 James Brandt Blvd',N'Allendale',N'SC', N'USC Salkehatchie');

GO
