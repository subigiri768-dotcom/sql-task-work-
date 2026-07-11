
-- create database for collegeDB

CREATE DATABASE CollegeDB;

USE CollegeDB;

-- create student tables
CREATE TABLE Student (
    StudentID VARCHAR(10) PRIMARY KEY,
    StudentName VARCHAR(100),
    Email VARCHAR(100)
);

-- create teacher table 
CREATE TABLE Teacher (
    TeacherID VARCHAR(10) PRIMARY KEY,
    TeacherName VARCHAR(100)
);

-- create department table
CREATE TABLE Department (
    DepartmentID VARCHAR(10) PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

-- create classroom table
CREATE TABLE Classroom (
    RoomID VARCHAR(10) PRIMARY KEY,
    RoomNumber VARCHAR(20)
);

-- create course table 
CREATE TABLE Course (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(100),
    TeacherID VARCHAR(10),
    DepartmentID VARCHAR(10),
    RoomID VARCHAR(10),

    FOREIGN KEY (TeacherID)
        REFERENCES Teacher(TeacherID),

    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID),

    FOREIGN KEY (RoomID)
        REFERENCES Classroom(RoomID)
);

-- enrollment table
CREATE TABLE Enrollment (
    EnrollmentID VARCHAR(10) PRIMARY KEY,
    StudentID VARCHAR(10),
    CourseID VARCHAR(10),
    Grade VARCHAR(5),

    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),

    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

-- insert data of students
INSERT INTO Student VALUES
('S001','Raj Kumar','raj@college.edu'),
('S002','Maya Singh','maya@college.edu'),
('S003','Ali Khan','ali@college.edu'),
('S004','Priya Joshi','priya@college.edu');

-- teachers data
INSERT INTO Teacher VALUES
('T001','Dr. Sharma'),
('T002','Prof. Gupta'),
('T003','Dr. Patel'),
('T004','Dr. Verma');

-- department data
INSERT INTO Department VALUES
('D001','Computer Science'),
('D002','Mathematics'),
('D003','Physics');

-- classroom data
INSERT INTO Classroom VALUES
('R001','A101'),
('R002','B205'),
('R003','Lab-C'),
('R004','C301');

-- course data
INSERT INTO Course VALUES
('C001','Database','T001','D001','R001'),
('C002','Mathematics','T002','D002','R002'),
('C003','Programming','T003','D001','R003'),
('C004','Physics','T004','D003','R004');

-- enrollment values
INSERT INTO Enrollment VALUES
('E001','S001','C001','A'),
('E002','S002','C002','B+'),
('E003','S001','C003','A-'),
('E004','S003','C001','B'),
('E005','S002','C004','A'),
('E006','S004','C003','B+');

-- select query
-- students
SELECT * FROM Student;

-- course 
SELECT * FROM Course;

-- teachers
SELECT * FROM Teacher;

-- departments
SELECT * FROM Department;

-- classrooms
SELECT * FROM Classroom;

-- JOIN QUERY
-- student name and course
SELECT
    Student.StudentName,
    Course.CourseName
FROM Enrollment
INNER JOIN Student
ON Enrollment.StudentID = Student.StudentID
INNER JOIN Course
ON Enrollment.CourseID = Course.CourseID;

-- student name, course and grade
SELECT
    Student.StudentName,
    Course.CourseName,
    Enrollment.Grade
FROM Enrollment
INNER JOIN Student
ON Enrollment.StudentID = Student.StudentID
INNER JOIN Course
ON Enrollment.CourseID = Course.CourseID;

-- course with teacher
SELECT
    Course.CourseName,
    Teacher.TeacherName
FROM Course
INNER JOIN Teacher
ON Course.TeacherID = Teacher.TeacherID;

-- course with department
SELECT
    Course.CourseName,
    Department.DepartmentName
FROM Course
INNER JOIN Department
ON Course.DepartmentID = Department.DepartmentID;

-- course with classroom
SELECT
    Course.CourseName,
    Classroom.RoomNumber
FROM Course
INNER JOIN Classroom
ON Course.RoomID = Classroom.RoomID;

-- complete student information
SELECT
    Student.StudentName,
    Student.Email,
    Course.CourseName,
    Teacher.TeacherName,
    Department.DepartmentName,
    Classroom.RoomNumber,
    Enrollment.Grade
FROM Enrollment
INNER JOIN Student
ON Enrollment.StudentID = Student.StudentID
INNER JOIN Course
ON Enrollment.CourseID = Course.CourseID
INNER JOIN Teacher
ON Course.TeacherID = Teacher.TeacherID
INNER JOIN Department
ON Course.DepartmentID = Department.DepartmentID
INNER JOIN Classroom
ON Course.RoomID = Classroom.RoomID;
