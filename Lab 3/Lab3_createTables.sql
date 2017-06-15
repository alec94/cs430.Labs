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

CREATE TABLE IF NOT EXISTS Professor(
    EmpNo INT NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DeptCode CHAR(4) NOT NULL,
    PRIMARY KEY(EmpNo)  
);

CREATE TABLE IF NOT EXISTS CanTeach(
    EmpNo INT NOT NULL,
    ClassID VARCHAR(255) NOT NULL,
    PRIMARY KEY(EmpNo, ClassID),
    FOREIGN KEY(ClassId) REFERENCES Class(ClassID) ON DELETE CASCADE,
    FOREIGN KEY(EmpNo) REFERENCES Professor(EmpNo) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Section(
    ClassID VARCHAR(255) NOT NULL,
    ProfNo INT NOT NULL,
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
    FOREIGN KEY (ClassID) REFERENCES Class (ClassID) ON DELETE CASCADE,
    FOREIGN KEY (ProfNo) REFERENCES Professor (EmpNo) ON DELETE CASCADE,
    UNIQUE KEY (Semester, Building, RoomNo, Start_Time, End_Time, M, W, T, TH, F)
);

CREATE TABLE IF NOT EXISTS PreReq(
    ClassID VARCHAR(255) NOT NULL,
    ReqID VARCHAR(255) NOT NULL,
    PRIMARY KEY(ClassID, ReqID),
    FOREIGN KEY (ClassID) REFERENCES Class (ClassID) ON DELETE CASCADE,
    FOREIGN KEY (ReqID) REFERENCES Class (ClassID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Enrolled(
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

CREATE TABLE IF NOT EXISTS Audit(
    AuditIndex INT NOT NULL AUTO_INCREMENT,
    TableName VARCHAR(255) NOT NULL,
    Type VARCHAR(255) NOT NULL,
    Date_Time DATETIME NOT NULL,
    PRIMARY KEY (AuditIndex)
);

-- 6)

CREATE TRIGGER Section_Delete AFTER DELETE ON Section
    FOR EACH ROW
        INSERT INTO Audit 
        (TableName, Type, Date_Time) 
        Values ('Section','DELETE',NOW());
    
CREATE TRIGGER Section_Insert AFTER INSERT ON Section
    FOR EACH ROW
        INSERT INTO Audit 
        (TableName, Type, Date_Time) 
        Values ('Section','INSERT',NOW());
        
CREATE TRIGGER Enrolled_Update AFTER UPDATE ON Enrolled
    FOR EACH ROW
        INSERT INTO Audit 
        (TableName, Type, Date_Time) 
        Values ('Enrolled','UPDATE',NOW());
        
CREATE TRIGGER Student_Delete AFTER DELETE ON Student
    FOR EACH ROW
        INSERT INTO Audit 
        (TableName, Type, Date_Time) 
        Values ('Student','DELETE',NOW());
    
CREATE TRIGGER Student_Insert AFTER INSERT ON Student
    FOR EACH ROW
        INSERT INTO Audit 
        (TableName, Type, Date_Time) 
        Values ('Student','INSERT',NOW());
