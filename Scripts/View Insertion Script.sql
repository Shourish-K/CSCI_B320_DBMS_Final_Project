/****** View Insertion Script ***************************************************/

/*
View to split First, Middle, and Last name of the professors, and create their emails
using their last name
*/
SELECT IIF( CHARINDEX(' ', SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor))) != 0, 
			SUBSTRING(SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor)), 1, 
								CHARINDEX(' ', SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor)))), 
								SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor))) AS First_Name,
								IIF( CHARINDEX(' ', SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor))) != 0, 
			SUBSTRING(SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor)), 
								CHARINDEX(' ', SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor))), 
								LEN(SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor)))), 
								NULL) AS Middle_Name,
			SUBSTRING(Professor, 1, CHARINDEX(',', Professor) - 1) AS Last_Name,
			LOWER(TRIM(IIF( CHARINDEX(' ', SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor))) != 0, 
			SUBSTRING(SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor)), 1, 
								CHARINDEX(' ', SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor)))), 
								SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor))))) + 
								LOWER(TRIM(IIF( CHARINDEX(' ', SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor))) != 0, 
			SUBSTRING(SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor)), 
								CHARINDEX(' ', SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor))), 
								LEN(SUBSTRING(Professor, CHARINDEX(',', Professor) + 2, LEN(Professor)))), 
								''))) +
			LOWER(TRIM(SUBSTRING(Professor, 1, CHARINDEX(',', Professor) - 1) + '@uscb.edu')) AS Email

FROM
(SELECT DISTINCT Professor FROM LOAD_CourseSchedule) AS Professors
ORDER BY Last_Name




/*
View to Scrape CourseTerms and split them into Semster, Year, TermType, TermStartDate and TermEndDate
*/

SELECT DISTINCT SUBSTRING(Sub_Academic_Term, CHARINDEX('-', Sub_Academic_Term) + 2, LEN(Sub_Academic_Term)) AS TermType,
				SUBSTRING(ACADEMIC_PERIOD_DESC, 1, CHARINDEX(' ', ACADEMIC_PERIOD_DESC) - 1) AS Semester,
				SUBSTRING(ACADEMIC_PERIOD_DESC, CHARINDEX(' ', ACADEMIC_PERIOD_DESC) + 1, LEN(ACADEMIC_PERIOD_DESC)) AS Year,
				SUBSTRING(ACADEMIC_PERIOD, 1, 4) + '-' +
				 (CASE
				 WHEN SUBSTRING(ACADEMIC_PERIOD_DESC, 1, CHARINDEX(' ', ACADEMIC_PERIOD_DESC) - 1) = 'Summer' THEN '05-08'
				 WHEN SUBSTRING(ACADEMIC_PERIOD_DESC, 1, CHARINDEX(' ', ACADEMIC_PERIOD_DESC) - 1) = 'Fall' THEN '08-24'
				 WHEN SUBSTRING(ACADEMIC_PERIOD_DESC, 1, CHARINDEX(' ', ACADEMIC_PERIOD_DESC) - 1) = 'Spring' THEN '01-08'
				 END) AS TermStartDate,
				SUBSTRING(ACADEMIC_PERIOD, 1, 4)+ '-' +
				 (CASE
				 WHEN SUBSTRING(ACADEMIC_PERIOD_DESC, 1, CHARINDEX(' ', ACADEMIC_PERIOD_DESC) - 1) = 'Summer' THEN '05-25'
				 WHEN SUBSTRING(ACADEMIC_PERIOD_DESC, 1, CHARINDEX(' ', ACADEMIC_PERIOD_DESC) - 1) = 'Fall' THEN '12-16'
				 WHEN SUBSTRING(ACADEMIC_PERIOD_DESC, 1, CHARINDEX(' ', ACADEMIC_PERIOD_DESC) - 1) = 'Spring' THEN '04-22'
				 END) AS TermEndDate
FROM LOAD_CourseSchedule
ORDER BY TermStartDate

/*
Views Helpful for planning courses
*/

SELECT Semester + ' ' + CAST(Year AS NVARCHAR) + ' ' + TermType AS Term
FROM CourseTerms 
ORDER BY Year, Semester

SELECT IIF(Middle_Name IS NOT NULL, 
		   First_Name + ' ' + Middle_Name + ' ' + Last_Name,
		   First_Name + ' ' + Last_Name) AS [Student Full Name]
FROM Students

/*
All Subject in the data dump
*/

SELECT DISTINCT Subs.Subject, SUBSTRING(LOAD_CourseCatalog.Subject_Description, 
				CHARINDEX('-', LOAD_CourseCatalog.Subject_Description) + 2, LEN(LOAD_CourseCatalog.Subject_Description)) AS SubjectName, 
				LOAD_CourseCatalog.Department_Description
FROM
(SELECT Subject 
FROM (SELECT TRIM(Subject) AS Subject FROM LOAD_CourseSchedule
	  UNION
	  SELECT TRIM(Subject) FROM LOAD_CourseCatalog) AS Subjects) AS Subs
LEFT JOIN LOAD_CourseCatalog
ON Subs.Subject = LOAD_CourseCatalog.Subject
ORDER BY Subs.Subject

/*
All Subjects not present in both tables
*/
SELECT Subject FROM LOAD_CourseCatalog
WHERE Subject NOT IN (SELECT Subject FROM LOAD_CourseSchedule)
UNION
SELECT Subject FROM LOAD_CourseSchedule
WHERE Subject NOT IN (SELECT Subject FROM LOAD_CourseCatalog);

/*
View to get all courses offered by USCB
*/

DROP TABLE IF EXISTS DistinctCourses

SELECT *
INTO DistinctCourses
FROM 
(SELECT DISTINCT Subject, Course_Number AS Course, Title_Short_Description AS Title
FROM LOAD_CourseCatalog
UNION
SELECT DISTINCT Subject, Course, Title
FROM LOAD_CourseSchedule) AS DistinctCourses

SELECT DistinctCourses.Subject, 
	   Course, Title, 
	   Minimum_Credit, 
	   Maximum_Credit,
	   Default_Grade_Mode_Description,
	   Schedule_Type
FROM DistinctCourses
LEFT JOIN LOAD_CourseCatalog
ON DistinctCourses.Subject + DistinctCourses.Course + DistinctCourses.Title =
   LOAD_CourseCatalog.Subject + LOAD_CourseCatalog.Course_Number + LOAD_CourseCatalog.Title_Short_Description

/*
Alternate View to get all courses offered by USCB
*/

DROP TABLE IF EXISTS DistinctCourses

SELECT *
INTO DistinctCourses
FROM 
(SELECT DISTINCT Subject, Course_Number AS Course, Title_Short_Description AS Title, Department_Description
FROM LOAD_CourseCatalog
UNION
SELECT DISTINCT LOAD_CourseSchedule.Subject, Course, Title, Department_Description
FROM LOAD_CourseSchedule
LEFT JOIN LOAD_CourseCatalog
	  ON LOAD_CourseCatalog.Subject = LOAD_CourseSchedule.Subject) AS DistinctCourses 


SELECT DistinctCourses.Department_Description,
	   DistinctCourses.Subject, 
	   Course, Title, 
	   Minimum_Credit, 
	   Maximum_Credit,
	   Course_Description,
	   Default_Grade_Mode_Description,
	   Schedule_Type
FROM DistinctCourses
LEFT JOIN LOAD_CourseCatalog
ON DistinctCourses.Subject + DistinctCourses.Course + DistinctCourses.Title + DistinctCourses.Department_Description=
   LOAD_CourseCatalog.Subject + LOAD_CourseCatalog.Course_Number + LOAD_CourseCatalog.Title_Short_Description + LOAD_CourseCatalog.Department_Description
ORDER BY Title

/*
View to get course names from course catalog without truncation
Helped Test that Title_Long_Descripiton can't be used since the 
Course Schedule uses references of Title_Short Description, hence
we can't create a composite key out of it.
*/

SELECT * FROM LOAD_CourseCatalog
SELECT * FROM TEMP_CourseCatalog

DROP TABLE IF EXISTS TEMP_CourseCatalog

SELECT Academic_Term, 
	   Course_Campus,
	   Course_Identification,
	   Subject,
	   Subject_Description,
	   Course,
	   Status,
	   Status_Description,
	   Schedule_Type,
	   College,
	   College_Description,
	   Dept,
	   Department_Description,
	   Minimum_Credit,
	   Maximum_Credit,
	   Title,
	   Course_Description,
	   Default_Grade_Mode_Description
INTO TEMP_CourseCatalog
FROM
(SELECT DISTINCT Academic_Term,
	   Course_Campus,
	   Course_Identification,
	   Subject,
	   Subject_Description,
	   Course_Number AS Course, 
	   Status,
	   Status_Description,
	   Schedule_Type,
	   College,
	   College_Description,
	   Dept,
	   Department_Description,
	   Minimum_Credit,
	   Maximum_Credit,
	   IIF(Title_Long_Description IS NOT NULL, Title_Long_Description, Title_Short_Description) AS Title,
	   Course_Description,
	   Default_Grade_Mode_Description
FROM LOAD_CourseCatalog) AS TEMP

/*
View to help in course offerings populations.
*/
DROP Table IF EXISTS CourseSchedule

SELECT * INTO CourseSchedule
FROM
(SELECT Section, Days, CAST(SUBSTRING(Time, 1, CHARINDEX('-', Time) - 1 ) AS TIME) AS StartTime, 
	   CAST(SUBSTRING(Time, CHARINDEX('-', Time) + 1, LEN(Time) ) AS TIME) AS EndTime, 
	   MEETING_TYPE_DESC AS Meeting_Type, Max_Enrollment AS MaxNumberOfSeats,
	   IIF(SUBSTRING(Course, CHARINDEX('B', Course) + 1, 3) >= 500, 'Graduate', 'Undergraduate') AS Level,
	   IIF(Building IN ('WEB', '2WEB', 'WEB2'), 'Online', 'F2F') AS InstructionalMethod,
	   CRN, Building, Room, TRIM(Subject + ' ' + Course + ' ' + Title) AS Course,
	   TRIM(Professor) AS Professor, ACADEMIC_PERIOD_DESC + ' ' + SUBSTRING(Sub_Academic_Term, CHARINDEX('-', Sub_Academic_Term) + 2, LEN(Sub_Academic_Term)) AS Term

FROM LOAD_CourseSchedule) AS Course
ORDER BY Course

GO

/* Useful CourseOfferings Data */

SELECT Section, 
	   Days, 
	   StartTime, 
	   EndTime, 
	   MeetingType,
	   Professors.FirstName,
	   Professors.MiddleName,
	   Professors.LastName,
	   InstructionalMethod,
	   CRN,
	   MaxNumberOfSeats,
	   SubjectAbbreviation,
	   CourseNumber,
	   Title,
	   Semester,
	   Year,
	   TermType,
	   LevelDescription,
	   BuildingName,
	   RoomNumber
FROM CourseOfferings
	INNER JOIN Professors
		  ON Professors.ProfessorID = CourseOfferings.ProfessorID
	INNER JOIN Courses
		  ON CourseOfferings.CourseID = Courses.CourseID
	INNER JOIN CourseTerms
		  ON CourseTerms.CourseTermID = CourseOfferings.CourseTermID
	INNER JOIN StudentLevels
		  ON StudentLevels.StudentLevelID = CourseOfferings.StudentLevelID
	INNER JOIN Locations
		  ON Locations.LocationID = CourseOfferings.LocationID
	INNER JOIN Subjects
		  ON Subjects.SubjectID = Courses.SubjectID
ORDER BY SubjectAbbreviation, CourseNumber

/* View used to populate EnrolledCourses */

SELECT Section, 
	   Days, 
	   StartTime, 
	   EndTime, 
	   MeetingType,
	   InstructionalMethod,
	   CRN,
	   MaxNumberOfSeats,
	   SubjectAbbreviation,
	   CourseNumber,
	   Title,
	   Semester,
	   Year,
	   TermType
FROM CourseOfferings
	INNER JOIN Courses
		  ON CourseOfferings.CourseID = Courses.CourseID
	INNER JOIN CourseTerms
		  ON CourseTerms.CourseTermID = CourseOfferings.CourseTermID
	INNER JOIN Subjects
		  ON Subjects.SubjectID = Courses.SubjectID
ORDER BY SubjectAbbreviation, CourseNumber

DROP TABLE IF EXISTS CourseEvaluationsF2FResponses
DROP TABLE IF EXISTS CourseEvaluationsOnlineResponses
DROP TABLE IF EXISTS EnrolledCourses

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [EnrolledCourses] (
  [EnrolledCoursesID] int IDENTITY(1,1) NOT NULL,
  [ReceivedGrade] nvarchar(10) NOT NULL,
  [StudentID] int NOT NULL,
  [CourseOfferingID] int NOT NULL,
  CONSTRAINT PK_EnrolledCourses PRIMARY KEY CLUSTERED 
    (
	    EnrolledCoursesID ASC
    )
);

/* Evaluation Responses */

SELECT InstructionalMethod, ReceivedGrade
FROM EnrolledCourses
	INNER JOIN CourseOfferings
		  ON EnrolledCourses.CourseOfferingID = CourseOfferings.CourseOfferingID

--SELECT * FROM Students
--SELECT * FROM Professors
--SELECT * FROM StudentLevels
--SELECT * FROM CourseEvaluationsF2F
--SELECT * FROM CourseEvaluationsOnline
--SELECT * FROM CourseEvaluationsF2FResponses
--SELECT * FROM CourseEvaluationsOnlineResponses
--SELECT * FROM Colleges
--SELECT * FROM Grades
--SELECT * FROM CourseTerms
--SELECT * FROM Campuses 
--SELECT * FROM Departments
--SELECT * FROM Locations
--SELECT * FROM Subjects
--SELECT * FROM Courses
--SELECT * FROM CourseOfferings
--SELECT * FROM Majors
--SELECT * FROM MajorRequirements
--SELECT * FROM EnrolledCourses
--SELECT * FROM Prerequisites
