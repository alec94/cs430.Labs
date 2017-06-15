-- 5)
SELECT * FROM Professor ORDER BY DeptCode, FirstName;

SELECT * FROM CanTeach ORDER BY ClassID;

SELECT * FROM Section ORDER BY ClassID, Semester, SecNo;

SELECT ClassID as 'Class', COUNT(ClassID) FROM CanTeach GROUP BY ClassID;

SELECT FirstName AS 'Professor', ClassID AS 'Class', Semester FROM Section NATURAL JOIN Professor GROUP BY FirstName, ClassID;

-- 7) 
CREATE SQL SECURITY INVOKER VIEW Classes_Offered AS SELECT ClassID as 'Class', Semester, GROUP_CONCAT(DISTINCT LastName) AS 'Professors', COUNT(SecNo) AS 'Sections Offered' FROM Section INNER JOIN Professor ON Section.ProfNo = Professor.EmpNo GROUP BY ClassID, Semester;

-- 8)
SELECT * FROM Classes_Offered ORDER BY Class;


-- ==========Activity Questions==============

-- 1)
INSERT INTO Section (ClassID, ProfNo, SecNo, Semester, Building, RoomNo, Start_Time, End_Time,M,T,W,TH,F) Values ('CS430', 207, 2, 'FA13', 'CSB', 130, '18:00', '19:50', 1,0,1,0,0);

-- 2)
UPDATE Enrolled SET Grade = 'A' WHERE StudentID = 1200 AND Semester = 'SP15' AND ClassID = 'M161' AND SecNo = 1;

-- 3)
DELETE FROM Student WHERE FirstName = 'Larry' AND LastName = 'Lujack';

-- 4)
INSERT INTO Student (StudentID, FirstName, LastName, DOB, Major) 
    Values(2030, 'Tom', 'Servo', NULL, 'CIS');

-- 5)
DELETE FROM Class WHERE ClassID = 'CS451';

-- 6)
INSERT INTO Section (ClassID, ProfNo, SecNo, Semester, Building, RoomNo, Start_Time, End_Time,M,T,W,TH,F) Values ('CS160', (SELECT EmpNo FROM Professor WHERE FirstName = 'Aeon'), 3, 'FA13', 'CSB', 130, '18:00', '19:50', 1,0,1,0,0);

-- 7)
DELETE FROM Section WHERE ClassID = 'M160' AND SecNo = 1 AND Semester = 'FA14';

-- 8)
INSERT INTO Student (StudentID, FirstName, LastName, DOB, Major) 
    Values(2020, 'Jay', 'Garrick', NULL, 'CS');

-- 9)
SELECT * FROM Section;
SELECT * FROM Student;
SELECT * FROM Enrolled;
SELECT * FROM Class;

-- 10)
SELECT TableName AS 'Table', Type AS 'Action', Date_Time AS 'Time' FROM Audit;