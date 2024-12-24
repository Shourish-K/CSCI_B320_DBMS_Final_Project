-- Location Trigger --

DROP TABLE IF EXISTS TEST_Locations

CREATE TABLE TEST_Locations
( [LocationID] int NOT NULL,
  [BuildingName] nvarchar(50) NULL,
  [BuildingDescription] nvarchar(50) NULL,
  [RoomNumber] nvarchar(7) NULL,
  [Campus] varchar(30) NOT NULL,
  CONSTRAINT PK_TESTLocations PRIMARY KEY CLUSTERED 
    (
	    LocationID ASC
    )
)

GO

CREATE TRIGGER LocationForeignKeyConvertor ON TEST_Locations
	INSTEAD OF INSERT 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @LocationID int;
	DECLARE @BuildingName nvarchar(30);
	DECLARE @BuildingDescription nvarchar(50);
	DECLARE @RoomNumber nvarchar(20);
	DECLARE @Campus nvarchar(30);

	DECLARE @CampusID int;

	SELECT @LocationID = INSERTED.LocationID
	FROM INSERTED

	SELECT @BuildingName = INSERTED.BuildingName
	FROM INSERTED

	SELECT @BuildingDescription = INSERTED.BuildingDescription
	FROM INSERTED

	SELECT @RoomNumber = INSERTED.RoomNumber
	FROM INSERTED

	SELECT @Campus = INSERTED.Campus
	FROM INSERTED

	SELECT @CampusID = CampusID
	FROM Campuses
	WHERE Name = @Campus

	SET IDENTITY_INSERT [Locations] ON
	INSERT INTO Locations(LocationID, BuildingName, BuildingDescription, RoomNumber, CampusID)
	VALUES (@LocationID, @BuildingName, @BuildingDescription, @RoomNumber, @CampusID)
	SET IDENTITY_INSERT [Locations] OFF
END

GO

INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (1,NULL,NULL,NULL,N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (2,N'1100BO',104,N'1100 Boundary Street',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (3,N'1100BO',113,N'1100 Boundary Street',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (4,N'2WEB',1,N'Online',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (5,N'365R',1,N'Sun and Moon Martial Arts Studio',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (6,N'ARTS',101,N'Art Studio',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (7,N'BEAUDO',1,N'Schools in Beaufort',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (8,N'CFA',100,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (9,N'CFA',101,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (10,N'CFA',102,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (11,N'CFA',103,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (12,N'CFA',113,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (13,N'CFA',116,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (14,N'CFA',118,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (15,N'CFA',201,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (16,N'CFA',202,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (17,N'CFA',203,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (18,N'CFA',204,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (19,N'CFA',206,N'Center for the Arts',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (20,N'CLIN2',1,N'Clinical Hospital',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (21,N'CMPCTR',105,N'Campus Center',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (22,N'CMPCTR',113,N'Campus Center',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (23,N'CMPCTR',148,N'Campus Center',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (24,N'ETVLC',1,N'ETV Lowcountry',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (25,N'GRAY',203,N'Grayson House',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (26,N'HARG',NULL,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (27,N'HARG',156,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (28,N'HARG',158,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (29,N'HARG',159,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (30,N'HARG',160,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (31,N'HARG',162,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (32,N'HARG',204,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (33,N'HARG',260,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (34,N'HARG',270,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (35,N'HARG',271,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (36,N'HARG',274,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (37,N'HARG',275,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (38,N'HARG',276,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (39,N'HARG',277,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (40,N'HARG',278,N'Hargray Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (41,N'HHHC',103,N'Hilton Head Hospitality Center',N'Hilton Head');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (42,N'HHHC',104,N'Hilton Head Hospitality Center',N'Hilton Head');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (43,N'HHHC',114,N'Hilton Head Hospitality Center',N'Hilton Head');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (44,N'HHHC',115,N'Hilton Head Hospitality Center',N'Hilton Head');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (45,N'HHHC',202,N'Hilton Head Hospitality Center',N'Hilton Head');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (46,N'HHHC',204,N'Hilton Head Hospitality Center',N'Hilton Head');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (47,N'HHHC',207,N'Hilton Head Hospitality Center',N'Hilton Head');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (48,N'HHHC',213,N'Hilton Head Hospitality Center',N'Hilton Head');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (49,N'HHHC',214,N'Hilton Head Hospitality Center',N'Hilton Head');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (50,N'LIBR2',144,N'Library Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (51,N'LIBR2',147,N'Library Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (52,N'LIBR2',219,N'Library Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (53,N'LIBR2',237,N'Library Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (54,N'LIBR2',238,N'Library Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (55,N'LIBR2',241,N'Library Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (56,N'LIBR2',243,N'Library Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (57,N'LIBR2',267,N'Library Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (58,N'MSCIE',101,N'Marine Science Building',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (59,N'MSCIE',102,N'Marine Science Building',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (60,N'MSCIE',201,N'Marine Science Building',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (61,N'NWCSTL',1,N'New Castle Building',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (62,N'OLDFPL',1,N'Old Field Plantation',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (63,N'RECCTR',1,N'Recreation Center',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (64,N'RHP',1,N'Tennis Courts',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (65,N'S300',1,N'Station 300',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (66,N'SAND',111,N'Sandstone Building',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (67,N'SAND',124,N'Sandstone Building',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (68,N'SCITEC',114,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (69,N'SCITEC',118,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (70,N'SCITEC',122,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (71,N'SCITEC',123,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (72,N'SCITEC',132,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (73,N'SCITEC',136,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (74,N'SCITEC',205,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (75,N'SCITEC',222,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (76,N'SCITEC',223,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (77,N'SCITEC',231,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (78,N'SCITEC',260,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (79,N'SCITEC',261,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (80,N'SCITEC',263,N'Science & Technology Building',N'Bluffton');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (81,N'SIC',1,N'Sea Islands Center',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (82,N'VAD',112,N'Visual Arts & Design Building',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (83,N'VAD',123,N'Visual Arts & Design Building',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (84,N'VAD',200,N'Visual Arts & Design Building',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (85,N'WALTM',120,N'USC Salkehatchie Walterboro',N'USC Salkehatchie Campus');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (86,N'WALTM',206,N'USC Salkehatchie Walterboro',N'USC Salkehatchie Campus');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (87,N'WALTM',213,N'USC Salkehatchie Walterboro',N'USC Salkehatchie Campus');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (88,N'WALTM',214,N'USC Salkehatchie Walterboro',N'USC Salkehatchie Campus');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (89,N'WALTSN',119,N'USC Salkehatchie Clinical Building',N'USC Salkehatchie Campus');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (90,N'WALTSN',120,N'USC Salkehatchie Clinical Building',N'USC Salkehatchie Campus');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (91,N'WEB',NULL,N'Online',N'Beaufort');
INSERT INTO TEST_Locations(LocationID,BuildingName,RoomNumber,BuildingDescription,Campus) VALUES (92,N'WEB2',NULL,N'Online',N'Beaufort');

GO


/********** Temporary View Created used to make Assumption Inserts into Loaction ************/

/*
DROP TABLE IF EXISTS TEMP_Locations

SELECT DISTINCT Building AS BuildingName, 
				Room AS RoomNumber
INTO TEMP_Locations
FROM LOAD_CourseSchedule

ALTER TABLE TEMP_Locations
ADD BuildingDescription nvarchar(50)

ALTER TABLE TEMP_Locations
ADD Campus nvarchar(50)

UPDATE TEMP_Locations 
SET BuildingDescription = 
	CASE
		WHEN BuildingName = 'CLIN2' THEN 'Clinical Hospital'
		WHEN BuildingName = 'RHP' THEN 'Tennis Courts'
		WHEN BuildingName = '365R' THEN 'Sun and Moon Martial Arts Studio'
		WHEN BuildingName = 'GRAY' THEN 'Grayson House'
		WHEN BuildingName = 'BEAUDO' THEN 'Schools in Beaufort'
		WHEN BuildingName = 'CFA' THEN 'Center for the Arts'
		WHEN BuildingName = 'MSCIE' THEN 'Marine Science Building'
		WHEN BuildingName = 'WALTSN' THEN 'USC Salkehatchie Clinical Building'
		WHEN BuildingName = NULL THEN NULL
		WHEN BuildingName = 'CMPCTR' THEN 'Campus Center'
		WHEN BuildingName = 'WEB' OR
			 BuildingName = 'WEB2' OR
			 BuildingName = '2WEB'
			  THEN 'Online'
		WHEN BuildingName = 'SAND' THEN 'Sandstone Building'
		WHEN BuildingName = 'WALTM' THEN 'USC Salkehatchie Walterboro'
		WHEN BuildingName = 'VAD' THEN 'Visual Arts & Design Building'
		WHEN BuildingName = 'SCITEC' THEN 'Science & Technology Building'
		WHEN BuildingName = 'ETVLC' THEN 'ETV Lowcountry'
		WHEN BuildingName = 'RECCTR' THEN 'Recreation Center'
		WHEN BuildingName = 'LIBR2' THEN 'Library Building'
		WHEN BuildingName = 'SIC' THEN 'Sea Islands Center'
		WHEN BuildingName = 'ARTS' THEN 'Art Studio'
		WHEN BuildingName = '1100BO' THEN '1100 Boundary Street'
		WHEN BuildingName = 'HHHC' THEN 'Hilton Head Hospitality Center'
		WHEN BuildingName = 'OLDFPL' THEN 'Old Field Plantation'
		WHEN BuildingName = 'HARG' THEN 'Hargray Building'
		WHEN BuildingName = 'S300' THEN 'Station 300'
		WHEN BuildingName = 'NWCSTL' THEN ' New Castle Building'
	END

UPDATE TEMP_Locations 
SET Campus = 
	CASE
		WHEN BuildingName IN ('CLIN2', 'GRAY', 'BEAUDO', 
							  'CFA', 'MSCIE', 'WEB', 
							  'WEB2', '2WEB', 'SAND', 
							  'VAD', 'ETVLC', 'SIC', 
							  'ARTS', '1100BO', 'NWCSTL') 
		OR BuildingName IS NULL
		THEN 'Beaufort'
		WHEN BuildingName IN ('RHP', '365R', 'CMPCTR',
							  'SCITEC', 'RECCTR', 'LIBR2',
							  'OLDFPL', 'HARG', 'S300') 
		THEN 'Bluffton'
		WHEN BuildingName IN ('HHHC') THEN 'Hilton Head'
		WHEN BuildingName IN ('WALTSN', 'WALTM') THEN 'USC Salkehatchie Campus'
	END
*/
