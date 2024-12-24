/****** Drop Tables ***************************************************/
DROP TABLE IF EXISTS Grades
DROP TABLE IF EXISTS Prerequisites
DROP TABLE IF EXISTS CourseEvaluationsOnlineResponses
DROP TABLE IF EXISTS CourseEvaluationsOnline
DROP TABLE IF EXISTS CourseEvaluationsF2FResponses
DROP TABLE IF EXISTS CourseEvaluationsF2F
DROP TABLE IF EXISTS EnrolledCourses
DROP TABLE IF EXISTS CourseOfferings
DROP TABLE IF EXISTS Locations
DROP TABLE IF EXISTS Campuses
DROP TABLE IF EXISTS Professors
DROP TABLE IF EXISTS CourseTerms
DROP TABLE IF EXISTS StudentLevels
DROP TABLE IF EXISTS Students
DROP TABLE IF EXISTS MajorRequirements
DROP TABLE IF EXISTS Courses
DROP TABLE IF EXISTS Subjects
DROP TABLE IF EXISTS Departments
DROP TABLE IF EXISTS Colleges
DROP TABLE IF EXISTS Majors
GO

/****** Create Tables ***************************************************/
-- Create the Majors table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Majors] (
  [MajorID] int IDENTITY(1,1) NOT NULL,
  [Major] nvarchar(10) NOT NULL,
  [MajorDescription] nvarchar(50) NULL,
  CONSTRAINT PK_Majors PRIMARY KEY CLUSTERED 
    (
	    MajorID ASC
    )
);

-- Create the Courses table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Courses] (
  [CourseID] int IDENTITY(1,1) NOT NULL,
  [CourseNumber] nvarchar(10) NOT NULL,
  [Title] nvarchar(50) NOT NULL,
  [MinCreditHours] int NULL,
  [MaxCreditHours] int NULL,
  [CourseDescription] nvarchar(2000) NULL,
  [GradeType] nvarchar(50) NULL,
  [CourseType] nvarchar(560) NULL,
  [SubjectID] int NULL,
  CONSTRAINT PK_Courses PRIMARY KEY CLUSTERED 
    (
	    CourseID ASC
    )
);

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [MajorRequirements] (
  [MajorRequirementID] int IDENTITY(1,1) NOT NULL,
  [MajorID] INT NOT NULL,
  [CourseMainID] INT NOT NULL,
  [CourseAltID] INT NULL,
  CONSTRAINT PK_MajorRequirements PRIMARY KEY CLUSTERED 
    (
	    MajorRequirementID ASC
    )
);

-- Create the Students table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Students] (
  [StudentID] int IDENTITY(1,1) NOT NULL,
  [FirstName] nvarchar(50) NOT NULL,
  [MiddleName] nvarchar(50) NULL,
  [LastName] nvarchar(50) NOT NULL,
  [Email] nvarchar(100) NOT NULL,
  [Phone] nvarchar(12) NOT NULL,
  [Address1] nvarchar(100) NOT NULL,
  [Address2] nvarchar(100) NULL,
  [City] nvarchar(30) NOT NULL,
  [State] nchar(2) NOT NULL,
  [USCID] nchar(9) NOT NULL,
  [VIPID] int NOT NULL,
  [MajorID] int NOT NULL,
  CONSTRAINT PK_Students PRIMARY KEY CLUSTERED 
    (
	    StudentID ASC
    )
);

-- Create the Departments table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Departments] (
  [DepartmentID] int IDENTITY(1,1) NOT NULL,
  [DepartmentAbbreviation] char(4) NULL,
  [DepartmentName] nvarchar(40) NULL,
  [CollegeID] int NOT NULL,
  CONSTRAINT PK_Departments PRIMARY KEY CLUSTERED 
    (
	    DepartmentID ASC
    )
);

-- Create the Subjects table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Subjects] (
  [SubjectID] int IDENTITY(1,1) NOT NULL,
  [SubjectName] nvarchar(30) NULL,
  [SubjectAbbreviation] char(4) NOT NULL,
  [DepartmentID] int NULL,
  CONSTRAINT PK_Subjects PRIMARY KEY CLUSTERED 
    (
	    SubjectID ASC
    )
);

-- Create the StudentLevels table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StudentLevels] (
  [StudentLevelID] int IDENTITY(1,1) NOT NULL,
  [LevelDescription] nvarchar(15) NOT NULL,
  CONSTRAINT PK_StudentLevels PRIMARY KEY CLUSTERED 
    (
	    StudentLevelID ASC
    )
);

-- Create the CourseTerms table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CourseTerms] (
  [CourseTermID] int IDENTITY(1,1) NOT NULL,
  [TermStartDate] date NOT NULL,
  [TermEndDate] date NOT NULL,
  [Semester] nvarchar(10) NOT NULL,
  [Year] int NOT NULL,
  [TermType] nvarchar(30) NOT NULL,
  CONSTRAINT CHK_Semester CHECK (Semester IN('Spring', 'Fall', 'Summer') ),
  CONSTRAINT CHK_Term CHECK (TermType IN 
							('Beaufort Summer 2nd Half Term',
							 'Beaufort Full Term',
							 'Columbia Full Term',
							 'Beaufort Summer 1st Half Term',
							 'Beaufort Second Half Term',
							 'Beaufort First Half Term',
							 'Beaufort Summer Full Term',
							 'Beaufort Summer May Term')),
  CONSTRAINT PK_CourseTerms PRIMARY KEY CLUSTERED 
    (
	    CourseTermID ASC
    )
);

-- Create the Professors table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Professors] (
  [ProfessorID] int IDENTITY(1,1) NOT NULL,
  [FirstName] nvarchar(50) NULL,
  [MiddleName] nvarchar(50) NULL,
  [LastName] nvarchar(50) NULL,
  [Email] nvarchar(100) NULL,
  [Phone] char(12) NULL
  CONSTRAINT PK_Professors PRIMARY KEY CLUSTERED 
    (
	    ProfessorID ASC
    )
);

-- Create the Campuses table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Campuses] (
  [CampusID] int IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(50) NOT NULL,
  [Address] nvarchar(100) NOT NULL,
  [City] nvarchar(30) NOT NULL,
  [State] char(2) NOT NULL,
  [CollegeID] int NOT NULL,
  CONSTRAINT PK_Campuses PRIMARY KEY CLUSTERED 
    (
	    CampusID ASC
    )
);

-- Create the Colleges table
CREATE TABLE [Colleges] (
  [CollegeID] int IDENTITY(1,1) NOT NULL,
  [Name] nvarchar(50) NOT NULL,
  [Address] nvarchar(100) NOT NULL,
  [City] nvarchar(30) NOT NULL,
  [ZipCode] nvarchar(10) NOT NULL,
  [State] char(2) NOT NULL,
  CONSTRAINT PK_Colleges PRIMARY KEY CLUSTERED 
    (
	    CollegeID ASC
    )
);

-- Create the Locations table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Locations] (
  [LocationID] int IDENTITY(1,1) NOT NULL,
  [BuildingName] nvarchar(50) NULL,
  [BuildingDescription] nvarchar(50) NULL,
  [RoomNumber] nvarchar(7) NULL,
  [CampusID] int NOT NULL,
  CONSTRAINT PK_Locations PRIMARY KEY CLUSTERED 
    (
	    LocationID ASC
    )
);

-- Create the CourseOfferings table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CourseOfferings] (
  [CourseOfferingID] int IDENTITY(1,1) NOT NULL,
  [Section] char(3) NULL,
  [Days] nvarchar(6) NULL,
  [StartTime] time NULL,
  [EndTime] time NULL,
  [MeetingType] nvarchar(50) NULL,
  [ProfessorID] int NOT NULL,
  [InstructionalMethod] nvarchar(50) NULL,
  [CRN] nvarchar(10) NULL,
  [MaxNumberOfSeats] int NULL,
  [CourseID] int NOT NULL,
  [CourseTermID] int NOT NULL,
  [StudentLevelID] int NOT NULL,
  [LocationID] int NOT NULL,
  CONSTRAINT PK_CourseOfferings PRIMARY KEY CLUSTERED 
    (
	    CourseOfferingID ASC
    )
);

-- Create the EnrolledCourses table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [EnrolledCourses] (
  [EnrolledCoursesID] int IDENTITY(1,1) NOT NULL,
  [ReceivedGrade] nvarchar(10) NULL,
  [StudentID] int NOT NULL,
  [CourseOfferingID] int NOT NULL,
  CONSTRAINT PK_EnrolledCourses PRIMARY KEY CLUSTERED 
    (
	    EnrolledCoursesID ASC
    )
);

-- Create the CourseEvaluationsF2F table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CourseEvaluationsF2F] (
  [CourseEvaluationF2FID] int IDENTITY(1,1) NOT NULL,
  [Q1] nvarchar(500) NULL,
  [Q2] nvarchar(500) NULL,
  [Q3] nvarchar(500) NULL,
  [Q4] nvarchar(500) NULL,
  [Q5] nvarchar(500) NULL,
  [Q6] nvarchar(500) NULL,
  [Q7] nvarchar(500) NULL,
  [Q8] nvarchar(500) NULL,
  [Q9] nvarchar(500) NULL,
  [Q10] nvarchar(500) NULL,
  [Q11] nvarchar(500) NULL,
  [Q12] nvarchar(500) NULL,
  [Q13] nvarchar(500) NULL,
  [Q14] nvarchar(500) NULL,
  CONSTRAINT PK_CourseEvaluationsF2F PRIMARY KEY CLUSTERED 
    (
	    CourseEvaluationF2FID ASC
    )
);

-- Create the CourseEvaluationsF2FResponse table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CourseEvaluationsF2FResponses] (
  [CourseEvaluationsF2FResponseID] int IDENTITY(1,1) NOT NULL,
  [EnrolledCoursesID] int,
  [Q1Response] int NULL,
  [Q2Response] int NULL,
  [Q3Response] int NULL,
  [Q4Response] int NULL,
  [Q5Response] int NULL,
  [Q6Response] int NULL,
  [Q7Response] int NULL,
  [Q8Response] int NULL,
  [Q9Response] int NULL,
  [Q10Response] int NULL,
  [Q11Response] int NULL,
  [Q12Response] int NULL,
  [Q13Response] int NULL,
  [Q14Response] int NULL,
  CONSTRAINT PK_CourseEvaluationsF2FResponses PRIMARY KEY CLUSTERED 
    (
	    CourseEvaluationsF2FResponseID ASC
    )
);

-- Create the CourseEvaluationsOnline table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CourseEvaluationsOnline] (
  [CourseEvaluationOnlineID] int IDENTITY(1,1) NOT NULL,
  [Q1] nvarchar(500) NULL,
  [Q2] nvarchar(500) NULL,
  [Q3] nvarchar(500) NULL,
  [Q4] nvarchar(500) NULL,
  [Q5] nvarchar(500) NULL,
  [Q6] nvarchar(500) NULL,
  [Q7] nvarchar(500) NULL,
  [Q8] nvarchar(500) NULL,
  [Q9] nvarchar(500) NULL,
  [Q10] nvarchar(500) NULL,
  [Q11] nvarchar(500) NULL,
  [Q12] nvarchar(500) NULL,
  [Q13] nvarchar(500) NULL,
  [Q14] nvarchar(500) NULL,
  [Q15] nvarchar(500) NULL,
  [Q16] nvarchar(500) NULL,
  [Q17] nvarchar(500) NULL,
  [Q18] nvarchar(500) NULL,
  [Q19] nvarchar(500) NULL,
  CONSTRAINT PK_CourseEvaluationsOnline PRIMARY KEY CLUSTERED 
    (
	    CourseEvaluationOnlineID ASC
    )
);

-- Create the CourseEvaluationsOnlineResponse table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CourseEvaluationsOnlineResponses] (
  [CourseEvaluationResponseID] int IDENTITY(1,1) NOT NULL,
  [EnrolledCoursesID] int NOT NULL,
  [Q1Response] int NULL,
  [Q2Response] int NULL,
  [Q3Response] int NULL,
  [Q4Response] int NULL,
  [Q5Response] int NULL,
  [Q6Response] int NULL,
  [Q7Response] int NULL,
  [Q8Response] int NULL,
  [Q9Response] int NULL,
  [Q10Response] int NULL,
  [Q11Response] int NULL,
  [Q12Response] int NULL,
  [Q13Response] int NULL,
  [Q14Response] int NULL,
  [Q15Response] int NULL,
  [Q16Response] int NULL,
  [Q17Response] int NULL,
  [Q18Response] int NULL,
  [Q19Response] int NULL,
  CONSTRAINT PK_CourseEvaluationsOnlineResponses PRIMARY KEY CLUSTERED 
    (
	    CourseEvaluationResponseID ASC
    )
);

-- Create the Prerequisites table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Prerequisites] (
  [PrerequisiteID] int IDENTITY(1,1) NOT NULL,
  [PrereqFor] int NULL,
  [PrereqIs] int NULL,
  CONSTRAINT PK_Prerequisites PRIMARY KEY CLUSTERED 
    (
	    PrerequisiteID ASC
    )
);

-- Create the Grades table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Grades] (
  [GradeID] int IDENTITY(1,1) NOT NULL,
  [LetterGrade] nvarchar(20) NOT NULL,
  [GPA] decimal(3,2) NULL,
  CONSTRAINT PK_Grades PRIMARY KEY CLUSTERED
    (
	    GradeID ASC
    )
);

/****** Create Constraints ***************************************************/
ALTER TABLE MajorRequirements WITH NOCHECK ADD CONSTRAINT [FK_MajorRequirements_MajorID] FOREIGN KEY ([MajorID])
	REFERENCES [Majors]([MajorID])
GO
ALTER TABLE MajorRequirements WITH NOCHECK ADD CONSTRAINT [FK_MajorRequirements_CourseMainID] FOREIGN KEY ([CourseMainID])
	REFERENCES [Courses]([CourseID])

	ALTER TABLE MajorRequirements WITH NOCHECK ADD CONSTRAINT [FK_MajorRequirements_CourseAltID] FOREIGN KEY ([CourseAltID])
	REFERENCES [Courses]([CourseID])
GO
ALTER TABLE Students WITH NOCHECK ADD CONSTRAINT [FK_Students_MajorID] FOREIGN KEY ([MajorID])
	REFERENCES [Majors]([MajorID])
GO
ALTER TABLE Departments WITH NOCHECK ADD CONSTRAINT [FK_Departments_CollegeID] FOREIGN KEY ([CollegeID])
	REFERENCES [Colleges]([CollegeID])
GO
ALTER TABLE Subjects WITH NOCHECK ADD CONSTRAINT [FK_Subjects_DepartmentID] FOREIGN KEY ([DepartmentID])
	REFERENCES [Departments]([DepartmentID])
GO
ALTER TABLE Courses WITH NOCHECK ADD CONSTRAINT [FK_Courses_SubjectID] FOREIGN KEY ([SubjectID])
	REFERENCES [Subjects]([SubjectID])
GO
ALTER TABLE Campuses WITH NOCHECK ADD CONSTRAINT [FK_Campuses_CollegeID] FOREIGN KEY ([CollegeID])
	REFERENCES [Colleges]([CollegeID])
GO
ALTER TABLE Locations WITH NOCHECK ADD CONSTRAINT [FK_Locations_CampusID] FOREIGN KEY ([CampusID])
	REFERENCES [Campuses]([CampusID])
GO
ALTER TABLE CourseOfferings WITH NOCHECK ADD CONSTRAINT [FK_CourseOfferings_LocationID] FOREIGN KEY ([LocationID])
	REFERENCES [Locations]([LocationID])
GO
ALTER TABLE CourseOfferings WITH NOCHECK ADD CONSTRAINT [FK_CourseOfferings_CourseID] FOREIGN KEY ([CourseID])
	REFERENCES [Courses]([CourseID])
GO
ALTER TABLE CourseOfferings WITH NOCHECK ADD CONSTRAINT [FK_CourseOfferings_ProfessorID] FOREIGN KEY ([ProfessorID])
	REFERENCES [Professors]([ProfessorID])
GO
ALTER TABLE CourseOfferings WITH NOCHECK ADD CONSTRAINT [FK_CourseOfferings_CourseTermID] FOREIGN KEY ([CourseTermID])
	REFERENCES [CourseTerms]([CourseTermID])
GO
ALTER TABLE CourseOfferings WITH NOCHECK ADD CONSTRAINT [FK_CourseOfferings_StudentLevelID] FOREIGN KEY ([StudentLevelID])
	REFERENCES [StudentLevels]([StudentLevelID])
GO
ALTER TABLE EnrolledCourses WITH NOCHECK ADD CONSTRAINT [FK_EnrolledCourses_StudentID] FOREIGN KEY ([StudentID])
	REFERENCES [Students]([StudentID])
GO
ALTER TABLE EnrolledCourses WITH NOCHECK ADD CONSTRAINT [FK_EnrolledCourses_CourseOfferingID] FOREIGN KEY ([CourseOfferingID])
	REFERENCES [CourseOfferings]([CourseOfferingID])
GO
ALTER TABLE Prerequisites WITH NOCHECK ADD CONSTRAINT [FK_Prerequisites_PrereqFor] FOREIGN KEY ([PrereqFor])
	REFERENCES [Courses]([CourseID])
GO
ALTER TABLE Prerequisites WITH NOCHECK ADD CONSTRAINT [FK_Prerequisites_PrereqIs] FOREIGN KEY ([PrereqIs])
	REFERENCES [Courses]([CourseID])
GO
ALTER TABLE CourseEvaluationsOnlineResponses WITH NOCHECK ADD CONSTRAINT [FK_CourseEvaluationsOnlineResponse_EnrolledCoursesID] FOREIGN KEY ([EnrolledCoursesID])
	REFERENCES [EnrolledCourses]([EnrolledCoursesID])
GO
ALTER TABLE CourseEvaluationsF2FResponses WITH NOCHECK ADD CONSTRAINT [FK_CourseEvaluationsF2FResponse_EnrolledCoursesID] FOREIGN KEY ([EnrolledCoursesID])
	REFERENCES [EnrolledCourses]([EnrolledCoursesID])
GO

/****** Drop Constraints ******/
/*
ALTER TABLE Subjects DROP CONSTRAINT [FK_Subjects.DepartmentID];
ALTER TABLE Courses DROP CONSTRAINT [FK_Courses.SubjectID];
ALTER TABLE Campuses DROP CONSTRAINT [FK_Campuses.CollegeID];
ALTER TABLE Locations DROP CONSTRAINT [FK_Locations.CampusID];
ALTER TABLE CourseOfferings DROP CONSTRAINT [FK_CourseOfferings.LocationID];
ALTER TABLE CourseOfferings DROP CONSTRAINT [FK_CourseOfferings.CourseID];
ALTER TABLE CourseOfferings DROP CONSTRAINT [FK_CourseOfferings.ProfessorID];
ALTER TABLE CourseOfferings DROP CONSTRAINT [FK_CourseOfferings.CourseTermsID];
ALTER TABLE CourseOfferings DROP CONSTRAINT [FK_CourseOfferings.StudentLevelID];
ALTER TABLE EnrolledCourses DROP CONSTRAINT [FK_EnrolledCourses.StudentID];
ALTER TABLE EnrolledCourses DROP CONSTRAINT [FK_EnrolledCourses.CourseOfferingID];
ALTER TABLE Prerequisites DROP CONSTRAINT [FK_Prerequisites.PrereqFor];
ALTER TABLE Prerequisites DROP CONSTRAINT [FK_Prerequisites.PrereqIs];
ALTER TABLE CourseEvaluationsOnlineResponse DROP CONSTRAINT [FK_CourseEvaluationsOnlineResponse.EnrolledCoursesID];
ALTER TABLE CourseEvaluationsF2FResponse DROP CONSTRAINT [FK_CourseEvaluationsF2FResponse.EnrolledCoursesID];
*/
