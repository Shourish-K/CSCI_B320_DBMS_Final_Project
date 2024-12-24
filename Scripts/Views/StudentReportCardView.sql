-- StudentReportCard View --

DROP VIEW IF EXISTS StudentReportCard
GO

CREATE VIEW StudentReportCard AS

SELECT Students.StudentID,
	   Students. FirstName,
	   Students.LastName,
	   ROUND(CAST(SUM(GPA)/COUNT(GPA) AS FLOAT), 2) AS [Cumulative GPA],
	   SUM(MinCreditHours) AS [Credits],
	   CASE
	   WHEN SUM(MinCreditHours) IS NULL THEN 'Incoming'
	   WHEN SUM(MinCreditHours) < 30 THEN 'Freshman'
	   WHEN SUM(MinCreditHours) > 30 AND SUM(MinCreditHours) < 60 THEN 'Sophmore'
	   WHEN SUM(MinCreditHours) > 60 AND SUM(MinCreditHours) < 90 THEN 'Junior'
	   WHEN SUM(MinCreditHours) > 90 AND SUM(MinCreditHours) < 120 THEN 'Sophmore'
	   WHEN SUM(MinCreditHours) > 120 THEN 'Alumni'
	   END AS 'Classification',
	   Major
FROM Students
	LEFT JOIN EnrolledCourses
		ON Students.StudentID = EnrolledCourses.StudentID
	LEFT JOIN Grades
		ON EnrolledCourses.ReceivedGrade = LetterGrade
	INNER JOIN CourseOfferings
		ON EnrolledCourses.CourseOfferingID = CourseOfferings.CourseOfferingID
	INNER JOIN Courses
		ON CourseOfferings.CourseID = Courses.CourseID
	INNER JOIN Majors
		ON Students.MajorID = Majors.MajorID
GROUP BY Students.StudentID, 
		 Students.FirstName, 
		 Students.LastName,
		 Major

GO

SELECT * FROM StudentReportCard
