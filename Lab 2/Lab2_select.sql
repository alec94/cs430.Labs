SELECT * FROM Class ORDER BY ClassID ASC;

SELECT * FROM Student ORDER BY LastName ASC, FirstName ASC;

SELECT * FROM Section ORDER BY Semester, ClassID, SecNo;

SELECT * FROM Phone ORDER BY PNumber;

SELECT * FROM PreReq ORDER BY ClassID;

SELECT * FROM Taken ORDER BY StudentID;

SELECT FirstName AS 'First Name', LastName AS 'Last Name' FROM Student WHERE LastName LIKE 'G%';

SELECT ClassID AS 'Class ID', Description FROM Class WHERE ClassID LIKE 'CS%';

SELECT ClassID, FirstName AS 'First Name' FROM (Student NATURAL JOIN Taken) WHERE Taken.Semester = 'FA14' ORDER BY ClassID;
    
SELECT FirstName AS 'First Name' , ClassID AS 'Class ID' FROM (Student NATURAL JOIN Taken) GROUP BY FirstName;

SELECT S.FirstName AS 'First Name', P1.PNumber AS 'Phone Number' FROM Student S, Phone P1, Phone P2 WHERE S.StudentID = P1.StudentID AND P1.PNumber = P2.PNumber AND P1.StudentId != P2.StudentID;