
USE TestingSystem2;
-- Question1


-- Question2
SELECT * 
FROM Department; 

-- Question3
SELECT 	DepartmentID
FROM 	Department
WHERE 	DepartmentName = 'Sale';

-- Question4
SELECT 	*
FROM 	`Account`
ORDER BY length(FullName)  DESC
LIMIT 1;

-- Question5
SELECT 	*
FROM  	`Account`
WHERE 	DepartmentID = 3
ORDER BY 	length(FullName)  DESC
LIMIT 	1;

-- Question6
SELECT groupName
FROM `Group`
WHERE CreateDate < '2019-12-20';


-- Question7
SELECT QuestionID
FROM Answer
GROUP BY QuestionID
HAVING Count(QuestionID) >= 4;

-- Question8
SELECT `Code`
FROM Exam
WHERE Duration >= '01:00:00' AND CreateDate < '2019-12-20';

-- Question9
SELECT *
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;


-- Question10
SELECT DepartmentID,Count(DepartmentID) AS `Count`
FROM `Account`
WHERE DepartmentID = 2 OR DepartmentID = 3;


-- Question11
SELECT *
FROM `Account`
WHERE FullName LIKE 'D%o' ; 


-- Question12
DELETE
FROM exam
WHERE CreateDate < '2019-12-20';


-- Question13
DELETE
FROM Question
WHERE content LIKE 'cau hoi%';

-- Question14
UPDATE `Account`
SET 
	FullName = 'Nguyen Ba Loc',
    email = 'loc.nguyenba@vti.com.vn'
WHERE AccountID =5;


-- Question15
UPDATE `Group`
SET GroupID = 4
WHERE AccountID = 5;