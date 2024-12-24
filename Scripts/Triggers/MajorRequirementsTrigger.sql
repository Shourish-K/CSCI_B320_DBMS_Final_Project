-- MajorRequirements Trigger --

DROP TABLE IF EXISTS TEST_MajorRequirements

CREATE TABLE TEST_MajorRequirements
( [MajorRequirementID] int NOT NULL,
  [Major] VARCHAR(30) NOT NULL,
  [CourseMain] VARCHAR(30) NOT NULL,
  [CourseAlt] VARCHAR(30) NULL,
  CONSTRAINT PK_TESTMajorRequirements PRIMARY KEY CLUSTERED 
    (
	    MajorRequirementID ASC
    )
)

GO

CREATE TRIGGER MajorRequirementsForeignKeyConvertor ON TEST_MajorRequirements
	INSTEAD OF INSERT 
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @MajorRequirementID INT;
	DECLARE @Major VARCHAR(30);
	DECLARE @CourseMain VARCHAR(30);
	DECLARE @CourseAlt VARCHAR(30);

	DECLARE @MajorID int;
	DECLARE @CourseMainID int;
	DECLARE @CourseAltID int;

	SELECT @MajorRequirementID = INSERTED.MajorRequirementID
	FROM INSERTED

	SELECT @Major = INSERTED.Major
	FROM INSERTED

	SELECT @CourseMain = INSERTED.CourseMain
	FROM INSERTED

	SELECT @CourseAlt = INSERTED.CourseAlt
	FROM INSERTED

	SELECT @MajorID = MajorID
	FROM Majors
	WHERE Majors.Major = @Major

	SELECT @CourseMainID = CourseID
	FROM Courses
		INNER JOIN Subjects
			ON Courses.SubjectID = Subjects.SubjectID
	WHERE SubjectAbbreviation + ' ' + CourseNumber = @CourseMain

	SELECT @CourseAltID = CourseID
	FROM Courses
		INNER JOIN Subjects
			ON Courses.SubjectID = Subjects.SubjectID
	WHERE SubjectAbbreviation + ' ' + CourseNumber = @CourseAlt

	SET IDENTITY_INSERT [MajorRequirements] ON
	INSERT INTO MajorRequirements(MajorRequirementID, MajorID, CourseMainID, CourseAltID)
	VALUES (@MajorRequirementID, @MajorID, @CourseMainID, @CourseAltID)
	SET IDENTITY_INSERT [MajorRequirements] OFF
END

GO

INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (1,N'ISAT',N'CSCI B102',N'ISAT B102');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (2,N'ISAT',N'MATH B115',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (3,N'ISAT',N'ENGL B101',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (4,N'ISAT',N'CSCI B104',N'ISAT B104');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (5,N'ISAT',N'MATH B141',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (6,N'ISAT',N'CSCI B150',N'ISAT B150');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (7,N'ISAT',N'ENGL B102',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (8,N'ISAT',N'CSCI B145',N'ISAT B145');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (9,N'ISAT',N'CSCI B201',N'ISAT B201');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (10,N'ISAT',N'CSCI B211',N'ISAT B211');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (11,N'ISAT',N'CSCI B146',N'ISAT B146');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (12,N'ISAT',N'CSCI B207',N'ISAT B207');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (13,N'ISAT',N'CSCI B212',N'ISAT B212');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (14,N'ISAT',N'CSCI B320',N'ISAT B320');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (15,N'ISAT',N'MGMT B371',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (16,N'ISAT',N'CSCI B350',N'ISAT B350');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (17,N'ISAT',N'STAT B240',N'STAT B340');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (18,N'ISAT',N'CSCI B321',N'ISAT B321');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (19,N'ISAT',N'CSCI B416',N'ISAT B416');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (20,N'ISAT',N'ENGL B262',N'ENGL B462');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (21,N'ISAT',N'CSCI B401',N'ISAT B401');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (22,N'ISAT',N'CSCI B437',N'ISAT B437');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (23,N'ISAT',N'CSCI B470',N'ISAT B470');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (24,N'ISAT',N'CSCI B499',N'ISAT B499');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (25,N'CSCI',N'CSCI B104',N'ISAT B104');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (26,N'CSCI',N'MATH B115',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (27,N'CSCI',N'ENGL B101',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (28,N'CSCI',N'MATH B141',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (29,N'CSCI',N'CSCI B150',N'ISAT B150');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (30,N'CSCI',N'ENGL B102',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (31,N'CSCI',N'CSCI B145',N'ISAT B145');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (32,N'CSCI',N'MATH B142',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (33,N'CSCI',N'ENGL B262',N'ENGL B462');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (34,N'CSCI',N'CSCI B146',N'ISAT B146');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (35,N'CSCI',N'MATH B240',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (36,N'CSCI',N'CSCI B280',N'ISAT B280');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (37,N'CSCI',N'CSCI B350',N'ISAT B350');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (38,N'CSCI',N'CSCI B320',N'ISAT B320');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (39,N'CSCI',N'STAT B240',N'STAT B340');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (40,N'CSCI',N'CSCI B365',N'ISAT B365');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (41,N'CSCI',N'CSCI B422',N'ISAT B422');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (42,N'CSCI',N'CSCI B466',NULL);
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (43,N'CSCI',N'CSCI B450',N'ISAT B450');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (44,N'CSCI',N'CSCI B469',N'ISAT B469');
INSERT INTO TEST_MajorRequirements(MajorRequirementID,Major,CourseMain,CourseAlt) VALUES (45,N'CSCI',N'CSCI B470',N'ISAT B470');
