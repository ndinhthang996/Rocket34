Use Testing_System2;

-- Question1: danh sách nhân viên và thông tin phòng ban của họ
SELECT *
FROM Account A
LEFT JOIN Department D ON A.departmentID= D.departmentID;

-- Question2 : lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM 	`Account`
WHERE 	
	CreateDate > '2010-12-20';
-- Question3  : lấy ra tất cả các developer 
	SELECT *
	FROM  Position P
    LEFT JOIN Account  A ON P.positionID= A.positionID
    WHERE positionname= "DEV";
    
-- Question4 : lấy ra danh sách các phòng ban có >3 nhân viên
SELECT D.Departmentname,COUNT(A.AccountID) AS SONV
FROM department D LEFT JOIN account A ON D.DepartmentID = A.DepartmentID
GROUP BY D.DepartmentID -- Sắp xếp các nhân viên thành chung 1 phòng ban
HAVING  SONV> 3;

-- Question5 : danh sách câu hỏi được sử dụng trong đề thi nhiều nhất 
SELECT Q.QuestionID, Q.Content,COUNT(EQ.ExamID) AS `SO LAN SU DUNG`   -- QUERY ĐỂ LẤY DANH SÁCH SẮP XẾP CÂU HỎI VÀ SỐ LẦN SỬ DỤNG
FROM Question Q LEFT JOIN Examquestion EQ ON Q.QuestionID = EQ.QuestionID
GROUP BY Q.QuestionID, Q.Content
HAVING COUNT(EQ.ExamID) = (  
			SELECT COUNT(EQ.ExamID) AS `SO LAN SU DUNG`
            FROM Question Q LEFT JOIN Examquestion EQ ON Q.QuestionID = EQ.QuestionID
			GROUP BY Q.QuestionID, Q.Content
            ORDER BY COUNT(EQ.ExamID) DESC
            LIMIT 1); -- Query để lấy câu hỏi xuất hiện nhiều nhất (1 hay nhiều đều có số lớn nhất nên LIMIT) Rồi để bằng như ở trên
		
-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
	SELECT CQ.CategoryID, CQ.CategoryName, COUNT(CQ.categoryID) AS `SO LAN XUAT HIEN CAU HOI`
	FROM categoryquestion CQ LEFT JOIN Question Q
		ON CQ.CategoryID =Q.CategoryID
		GROUP BY CQ.CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT Q.QuestionID,Q.Content, COUNT(EQ.ExamID) AS "SO LAN XUAT HIEN"
FROM Question Q LEFT JOIN ExamQuestion EQ 
		ON Q.QuestionID= EQ.QuestionID
        GROUP BY Q.QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất (3 SELECT)
SELECT 
	Q.QuestionID,
    Q.Content, 
    COUNT(AW.AnswerID) AS "CAU TRA LOI NHIEU NHAT "
FROM 
	Question Q 
JOIN 
	Answer AW ON Q.QuestionID = AW.AnswerID
GROUP BY AW.QuestionID -- AW.QuestionID vì  đếm số câu hỏi trong bảng Answer mỗi lần xuất hiện câu hỏi thì bảng AW lại nói đến 
HAVING COUNT(AW.AnswerID) = ( SELECT MAX(Dem_Answer)
								FROM (
									SELECT COUNT(AW.answerID) AS Dem_Answer
                                    FROM 
										Question q
									JOIN 		
										Answer AW ON q.QuestionID = AW.QuestionID
									GROUP BY AW.QuestionID ) AS Bang_Dem_Answer );
	
-- Question 9: Thống kê số lượng account trong mỗi group
SELECT G.GroupID,G.groupName, COUNT(GA.AccountID) AS " SỐ ACCOUNT"
FROM 
	`Group` G 
LEFT JOIN 
	GroupAccount GA ON G.GroupID = GA.GroupID
    GROUP BY G.GROUPID;
    
-- Question 10: Tìm chức vụ có ít người nhất
SELECT 	P.PositionID,P.PositionName, 
		COUNT(A.PositionID) AS "Chức vụ ít người nhất" 
FROM
	Position P
LEFT JOIN 
	`account` A ON A.PositionID=P.PositionID
GROUP BY P.PositionID
HAVING COUNT(A.PositionID) = (SELECT MIN(Dem_acc)
									FROM (	SELECT COUNT(a.AccountID) AS Dem_acc
											FROM 
												`Position` P
											LEFT JOIN 		
												 `Account` A 	ON p.PositionID = a.PositionID
											GROUP BY 	p.PositionID ) AS Bang_dem_so_luong_acc);
    
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT D.DepartmentID,D.DepartmentName, D.PositionName, count(p.PositionName) AS " SỐ LƯỢNG THÀNH VIÊN"  
FROM 
		`Account` A
INNER JOIN 
		Department d ON a.DepartmentID = D.DepartmentID  -- tìm các tài khoản có phòng ban
INNER JOIN 
		position p ON a.PositionID = p.PositionID   -- tìm các tài khoản có phòng ban và có vị trí 
GROUP BY d.DepartmentID, p.PositionID;   -- => DÙNG CROSS JOIN sẽ tạo ra các phòng ban có giá trị NV như nhau => sai

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì,
SELECT Q.QuestionID, Q.Content, A.FullName, TQ.TypeName AS Author, ANS.Content FROM question Q
INNER JOIN 
		categoryquestion CQ ON Q.CategoryID = CQ.CategoryID
INNER JOIN 
		Typequestion TQ ON Q.TypeID = TQ.TypeID
INNER JOIN 
		Account A ON A.AccountID = Q.CreatorID
INNER JOIN 
		Answer AS ANS ON Q.QuestionID = ANS.QuestionID
ORDER BY Q.QuestionID ASC; -- 4 LẦN JOIN DO CÁC THÔNG TIN PHÂN BỐ TRONG 4 BẢNG

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT 
		TQ.TypeID, TQ.TypeName, COUNT(Q.TypeID) AS SL 
FROM question Q
INNER JOIN 
		Typequestion TQ ON Q.TypeID = TQ.TypeID
GROUP BY Q.TypeID;

-- Question 14:Lấy ra group không có account nào
SELECT * 
	FROM `Group` G
LEFT JOIN GroupAccount GA ON g.GroupID = GA.GroupID
WHERE GA.AccountID IS NULL; -- KHÔNG CÓ QUERY DO DATA 

-- Question 15: Lấy ra group không có account nào
-- cách 1:
SELECT *
FROM `Group`
WHERE GroupID NOT IN (	SELECT GroupID

						FROM GroupAccount);
-- CÁCH 2:
SELECT 		* 
FROM 		groupaccount ga
RIGHT JOIN `group` g ON ga.GroupID = g.GroupID
WHERE 		ga.AccountID IS NULL;

    
    