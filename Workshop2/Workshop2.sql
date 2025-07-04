CREATE TABLE dbo.tblUsers (
    username      VARCHAR(50)   PRIMARY KEY,
    name          VARCHAR(100)  NOT NULL,
    password      VARCHAR(255)  NOT NULL,
    role          VARCHAR(20)   NOT NULL
        CONSTRAINT CK_tblUsers_role 
        CHECK (role IN ('Instructor','Student'))
);
GO

CREATE TABLE dbo.tblExamCategories (
    category_id   INT           IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(50)   NOT NULL,
    description   TEXT          NULL
);
GO

CREATE TABLE dbo.tblExams (
    exam_id       INT           IDENTITY(1,1) PRIMARY KEY,
    exam_title    VARCHAR(50)   NOT NULL,
    subject       VARCHAR(50)   NOT NULL,
    category_id   INT           NOT NULL
        CONSTRAINT FK_tblExams_Category 
        REFERENCES dbo.tblExamCategories(category_id),
    total_marks   INT           NOT NULL,
    duration      INT           NOT NULL  
);
GO

CREATE TABLE dbo.tblQuestions (
    question_id     INT         IDENTITY(1,1) PRIMARY KEY,
    exam_id         INT         NOT NULL
        CONSTRAINT FK_tblQuestions_Exam 
        REFERENCES dbo.tblExams(exam_id),
    question_text   TEXT        NOT NULL,
    option_a        VARCHAR(100) NOT NULL,
    option_b        VARCHAR(100) NOT NULL,
    option_c        VARCHAR(100) NOT NULL,
    option_d        VARCHAR(100) NOT NULL,
    correct_option  CHAR(1)     NOT NULL
        CONSTRAINT CK_tblQuestions_correct
        CHECK (correct_option IN ('A','B','C','D'))
);
GO

INSERT INTO dbo.tblExamCategories (category_name, description)
VALUES 
('Quiz', 'Short quizzes to test quick understanding.'),
('Midterm', 'Midterm exams covering half of the course.'),
('Final', 'Comprehensive exams at the end of the course.'),
('Practice', 'Optional practice tests for students.');
SELECT*FROM dbo.tblExamCategories

INSERT INTO dbo.tblExams (exam_title, subject, category_id, total_marks, duration)
VALUES 
('Java Midterm', 'Java', 2, 50, 60),
('SQL Quiz', 'Database', 1, 30, 40),
('Web Final', 'Web Programming', 3, 100, 90),
('JavaScript Quiz', 'Web', 1, 25, 30);
SELECT*FROM dbo.tblExams