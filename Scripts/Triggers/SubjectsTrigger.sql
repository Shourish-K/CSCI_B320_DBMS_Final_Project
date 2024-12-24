-- Subjects Trigger --

DROP TABLE IF EXISTS TEST_Subjects

CREATE TABLE TEST_Subjects
( [SubjectID] int NOT NULL,
  [Subject] nvarchar(50) NULL,
  [SubjectAbbreviation] nvarchar(50) NULL,
  [Department] varchar(50) NOT NULL,
  CONSTRAINT PK_TESTSubjects PRIMARY KEY CLUSTERED 
    (
	    SubjectID ASC
    )
)

GO

CREATE TRIGGER SubjectForeignKeyConvertor ON TEST_Subjects
	INSTEAD OF INSERT 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @SubjectID int;
	DECLARE @Subject nvarchar(30);
	DECLARE @SubjectAbbreviation nvarchar(50);
	DECLARE @Department nvarchar(30);

	DECLARE @DepartmentID int;

	SELECT @SubjectID = INSERTED.SubjectID
	FROM INSERTED

	SELECT @Subject = INSERTED.Subject
	FROM INSERTED

	SELECT @SubjectAbbreviation = INSERTED.SubjectAbbreviation
	FROM INSERTED

	SELECT @Department = INSERTED.Department
	FROM INSERTED

	SELECT @DepartmentID = DepartmentID
	FROM Departments
	WHERE DepartmentName = @Department OR DepartmentName IS NULL

	SET IDENTITY_INSERT [Subjects] ON
	INSERT INTO Subjects(SubjectID, SubjectName, SubjectAbbreviation, DepartmentID)
	VALUES (@SubjectID, @Subject, @SubjectAbbreviation, @DepartmentID)
	SET IDENTITY_INSERT [Subjects] OFF
END

GO

INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (1,N'ACCT',N'Accounting',N'USC-B Business & Comm');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (2,N'AFAM',N'African Amer Studies',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (3,N'ANTH',N'Anthropology',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (4,N'ARTE',N'Art Education',N'USC-B English & Visual Arts');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (5,N'ARTH',N'Art History',N'USC-B English & Visual Arts');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (6,N'ARTS',N'Art Studio',N'USC-B English & Visual Arts');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (7,N'ASTR',N'Astronomy',N'USC-B Natural Sciences');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (8,N'BADM',N'Business Administration',N'USC-B Business & Comm');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (9,N'BIOL',N'Biology',N'USC-B Natural Sciences');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (10,N'CHEM',N'Chemistry',N'USC-B Natural Sciences');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (11,N'COMM',N'Communications',N'USC-B Business & Comm');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (12,N'CPLT',N'Comparative Literature',N'USC-B English & Visual Arts');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (13,N'CSCI',N'Computer Science',N'USC-B Math & Comp Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (14,N'CSXE',N'Computational Engr',N'USC-B Computer Science');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (15,N'ECON',N'Economics',N'USC-B Business & Comm');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (16,N'EDCI',N'Curriculum, Instruction',N'USC-B Education');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (17,N'EDEC',N'Early Childhood Educ',N'USC-B Education');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (18,N'EDEL',N'Elementary Education',N'USC-B Education');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (19,N'EDEX',N'Exceptional Children',N'USC-B Education');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (20,N'EDFO',N'Educ - Foundations',N'USC-B Education');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (21,N'EDME',N'Mathematics Education',N'USC-B Education');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (22,N'EDPH',N'Physical Education',N'USC-B Education');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (23,N'EDPY',N'Educational Psychology',N'USC-B Education');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (24,N'EDRD',N'Reading',N'USC-B Education');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (25,N'EDRM',N'Research & Measurement',N'USC-B Education');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (26,N'ENGL',N'English',N'USC-B English & Visual Arts');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (27,N'ENGR',N'Engineering',N'USC-B Computer Science');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (28,N'ENTR',N'Entrepreneurship',N'USC-B Hospitality Management');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (29,N'FREN',N'French',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (30,N'GEOG',N'Geography',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (31,N'GERM',N'German',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (32,N'GLST',N'Global Studies',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (33,N'HIST',N'History',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (34,N'HMSV',N'Human Services',N'USC-B Public Hlth & Human Serv');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (35,N'HPRO',NULL,NULL);
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (36,N'HRTM',N'Hotel Rest Tourism Mgmt',N'USC-B Hospitality Management');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (37,N'IDST',N'Interdisciplnry Studies',N'USC-B English & Visual Arts');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (38,N'INTL',N'Intl Study Abroad',NULL);
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (39,N'ISAT',N'Info Science & Tech',N'USC-B Math & Comp Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (40,N'LANG',N'Language Studies',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (41,N'LBST',NULL,NULL);
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (42,N'LING',N'Linguistics',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (43,N'MART',N'Media Arts',N'USC-B English & Visual Arts');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (44,N'MATH',N'Mathematics',N'USC-B Math & Comp Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (45,N'MATH',N'Mathematics',N'USC-B Mathematics');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (46,N'MGMT',N'Management',N'USC-B Business & Comm');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (47,N'MGSC',N'Management Science',N'USC-B Business & Comm');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (48,N'MKTG',N'Marketing',N'USC-B Business & Comm');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (49,N'MSCI',N'Marine Science',N'USC-B Natural Sciences');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (50,N'MUSC',N'Music',N'USC-B English & Visual Arts');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (51,N'NURS',N'Nursing',N'USC-B Nursing');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (52,N'PEDU',N'Physical Education',N'USC-B Public Hlth & Human Serv');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (53,N'PHIL',N'Philosophy',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (54,N'PHYS',N'Physics',N'USC-B Natural Sciences');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (55,N'POLI',N'Political Science',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (56,N'PSYC',N'Psychology',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (57,N'PUBH',N'Public Health',N'USC-B Public Hlth & Human Serv');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (58,N'RELG',N'Religious Studies',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (59,N'SOCY',N'Sociology',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (60,N'SPAN',N'Spanish',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (61,N'SPRT',N'Sport Management',N'USC-B Hospitality Management');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (62,N'STAT',N'Statistics',N'USC-B Math & Comp Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (63,N'STAT',N'Statistics',N'USC-B Mathematics');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (64,N'THEA',N'Theatre',N'USC-B English & Visual Arts');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (65,N'UNIV',N'University Experience',N'USC-B Humanities & Social Sci');
INSERT INTO TEST_Subjects(SubjectID,SubjectAbbreviation,Subject,Department) VALUES (66,N'USC',N'SC Pseudo Course (USC)',NULL);


GO

/*

-- View to assist in Subjects --

DROP TABLE IF EXISTS TEMP_Subjects

CREATE TABLE TEMP_Subjects
( [SubjectID] int NOT NULL,
  [SubjectName] nvarchar(50) NOT NULL,
  [SubjectAbbreviation] nvarchar(50) NOT NULL,
  [Department] varchar(30) NULL
  CONSTRAINT PK_TEMPSubjects PRIMARY KEY CLUSTERED 
    (
	    SubjectID ASC
    )
)

GO

INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (1,N'Accounting',N'ACCT');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (2,N'African Amer Studies',N'AFAM');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (3,N'Anthropology',N'ANTH');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (4,N'Art Education',N'ARTE');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (5,N'Art History',N'ARTH');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (6,N'Art Studio',N'ARTS');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (7,N'Astronomy',N'ASTR');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (8,N'Biology',N'BIOL');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (9,N'Business Administration',N'BADM');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (10,N'Chemistry',N'CHEM');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (11,N'Communications',N'COMM');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (12,N'Comparative Literature',N'CPLT');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (13,N'Computational Engr',N'CSXE');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (14,N'Computer Science',N'CSCI');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (15,N'Curriculum, Instruction',N'EDCI');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (16,N'Early Childhood Educ',N'EDEC');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (17,N'Economics',N'ECON');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (18,N'Educ - Foundations',N'EDFO');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (19,N'Educational Psychology',N'EDPY');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (20,N'Elementary Education',N'EDEL');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (21,N'Engineering',N'ENGR');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (22,N'English',N'ENGL');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (23,N'Entrepreneurship',N'ENTR');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (24,N'Exceptional Children',N'EDEX');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (25,N'French',N'FREN');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (26,N'Geography',N'GEOG');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (27,N'German',N'GERM');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (28,N'Global Studies',N'GLST');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (29,N'Health Programs',N'HPRO');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (30,N'History',N'HIST');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (31,N'Hotel Rest Tourism Mgmt',N'HRTM');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (32,N'Human Services',N'HMSV');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (33,N'Info Science & Tech',N'ISAT');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (34,N'Interdisciplnry Studies',N'IDST');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (35,N'Intl Study Abroad',N'INTL');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (36,N'Language Studies',N'LANG');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (37,N'Liberal Studies',N'LBST');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (38,N'Linguistics',N'LING');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (39,N'Management',N'MGMT');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (40,N'Management Science',N'MGSC');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (41,N'Marine Science',N'MSCI');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (42,N'Marketing',N'MKTG');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (43,N'Mathematics',N'MATH');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (44,N'Mathematics Education',N'EDME');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (45,N'Media Arts',N'MART');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (46,N'Music',N'MUSC');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (47,N'Nursing',N'NURS');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (48,N'Philosophy',N'PHIL');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (49,N'Physical Education',N'EDPH');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (50,N'Physical Education',N'PEDU');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (51,N'Physics',N'PHYS');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (52,N'Political Science',N'POLI');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (53,N'Psychology',N'PSYC');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (54,N'Public Health',N'PUBH');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (55,N'Reading',N'EDRD');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (56,N'Religious Studies',N'RELG');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (57,N'Research & Measurement',N'EDRM');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (58,N'SC Pseudo Course (USC)',N'USC');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (59,N'Sociology',N'SOCY');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (60,N'Spanish',N'SPAN');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (61,N'Sport Management',N'SPRT');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (62,N'Statistics',N'STAT');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (63,N'Theatre',N'THEA');
INSERT INTO TEMP_Subjects(SubjectID,SubjectName,SubjectAbbreviation) VALUES (64,N'University Experience',N'UNIV');

UPDATE TEMP_Subjects
SET Department = LOAD_CourseCatalog.Department_Description 
				 FROM LOAD_CourseCatalog 
				 WHERE Subject = TEMP_Subjects.SubjectAbbreviation

SELECT * FROM TEMP_Subjects
*/