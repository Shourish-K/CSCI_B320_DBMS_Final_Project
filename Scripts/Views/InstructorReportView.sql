-- InstructorReportView --

DROP VIEW IF EXISTS InstructorReportCard
GO

CREATE VIEW InstructorReportCard AS
SELECT Professors.ProfessorID,
	   Professors.FirstName,
	   Professors.LastName,
	   COUNT(CourseOfferings.CourseID) [NumberOfCourses]
FROM Professors
	INNER JOIN CourseOfferings
		ON Professors.ProfessorID = CourseOfferings.ProfessorID
	INNER JOIN CourseTerms
		ON CourseOfferings.CourseTermID = CourseTerms.CourseTermID
	INNER JOIN EnrolledCourses
		ON CourseOfferings.CourseOfferingID = EnrolledCourses.CourseOfferingID
	INNER JOIN CourseEvaluationsF2FResponses
		ON CourseEvaluationsF2FResponses.EnrolledCoursesID = EnrolledCourses.EnrolledCoursesID
	INNER JOIN CourseEvaluationsOnlineResponses
		ON CourseEvaluationsOnlineResponses.EnrolledCoursesID = EnrolledCourses.EnrolledCoursesID
WHERE MeetingType = 'Class' AND TermStartDate > CAST(DATEADD(MONTH, -12, GETDATE()) AS DATE)
GROUP BY Professors.ProfessorID,
	   Professors.FirstName,
	   Professors.LastName

GO

/* Professor Course Search */

SELECT 'Dr. ' + Professors.FirstName + ' ' + Professors.LastName AS [FullName],
	   SubjectAbbreviation, CourseNumber, Title, BuildingName + ' ' + RoomNumber AS [Location],
	   Semester, Year
FROM Professors
	INNER JOIN CourseOfferings
		ON Professors.ProfessorID = CourseOfferings.ProfessorID
	INNER JOIN Courses
		ON CourseOfferings.CourseID = Courses.CourseID
	INNER JOIN Subjects
		ON Courses.SubjectID = Subjects.SubjectID
	INNER JOIN CourseTerms
		ON CourseOfferings.CourseTermID = CourseTerms.CourseTermID
	INNER JOIN Locations
		ON CourseOfferings.LocationID = Locations.LocationID
WHERE 'Dr. ' + Professors.FirstName + ' ' + Professors.LastName = 'Dr. Ronald Erdei'

SELECT 'Dr. ' + Professors.FirstName + ' ' + Professors.LastName AS [FullName],
	   SubjectAbbreviation, CourseNumber, Title, BuildingName + ' ' + RoomNumber AS [Location],
	   Semester, Year
FROM Professors
	INNER JOIN CourseOfferings
		ON Professors.ProfessorID = CourseOfferings.ProfessorID
	INNER JOIN Courses
		ON CourseOfferings.CourseID = Courses.CourseID
	INNER JOIN Subjects
		ON Courses.SubjectID = Subjects.SubjectID
	INNER JOIN CourseTerms
		ON CourseOfferings.CourseTermID = CourseTerms.CourseTermID
	INNER JOIN Locations
		ON CourseOfferings.LocationID = Locations.LocationID
WHERE 'Dr. ' + Professors.FirstName + ' ' + Professors.LastName = 'Dr. Diana Gill'

/* Prerequisite Search */
DROP VIEW IF EXISTS PreReqOutput
GO

CREATE VIEW PreReqOutput AS
SELECT Prerequisites.PrereqIs
FROM Prerequisites
INNER JOIN Courses ON Courses.CourseID = Prerequisites.PrereqFor
GO

SELECT Courses.CourseID, Courses.CourseNumber
FROM PreReqOutput
INNER JOIN Courses ON Courses.CourseID = PreReqOutput.PrereqIs
ORDER BY CourseID



