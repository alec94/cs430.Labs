CREATE TABLE IF NOT EXISTS Student(
StudentID INT NOT NULL,
FirstName VARCHAR(255) NOT NULL,
LastName VARCHAR(255) NOT NULL,
DOB DATE NULL,
Major VARCHAR(255) NULL,
    
PRIMARY KEY (StudentID)
);

CREATE TABLE IF NOT EXISTS Phone(
PNumber VARCHAR(255) NOT NULL,
StudentID INT NOT NULL,
Type VARCHAR(255),
    
PRIMARY KEY (PNumber,StudentID),
FOREIGN KEY (StudentID) REFERENCES Student (StudentID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Class(
ClassID VARCHAR(255) NOT NULL,
Description TEXT NULL,
Credits INT NOT NULL,
PRIMARY KEY(ClassID)
);

CREATE TABLE IF NOT EXISTS Section(
ClassID VARCHAR(255) NOT NULL,
SecNo INT NOT NULL,
Semester VARCHAR(255) NOT NULL,
Building VARCHAR(255) NULL,
RoomNo INT NULL,
Start_Time TIME,
End_Time TIME,
M CHAR NULL,
T CHAR NULL,
W CHAR NULL,
TH CHAR NULL,
F CHAR NULL,

PRIMARY KEY(ClassID, SecNo, Semester),
FOREIGN KEY (ClassID) REFERENCES Class (ClassID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PreReq(
ClassID VARCHAR(255) NOT NULL,
ReqID VARCHAR(255) NOT NULL,

PRIMARY KEY(ClassID, ReqID),
FOREIGN KEY (ClassID) REFERENCES Class (ClassID) ON DELETE CASCADE,
FOREIGN KEY (ReqID) REFERENCES Class (ClassID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Taken(
StudentID INT NOT NULL,
SecNo INT NOT NULL,
ClassID VARCHAR(255) NOT NULL,
Semester VARCHAR(255) NOT NULL,
Grade CHAR(1) NULL,
Drop_Date DATE NULL,

FOREIGN KEY (StudentID) REFERENCES Student (StudentID) ON DELETE CASCADE,
FOREIGN KEY (ClassID) REFERENCES Class (ClassID) ON DELETE CASCADE,
PRIMARY KEY(StudentID, SecNo, Semester, ClassID)
);

