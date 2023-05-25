USE Testing_System2;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale Sử dụng VIEW

CREATE OR REPLACE VIEW vw_DSNV_Sale AS
SELECT A.*, D.DepartmentName
FROM 
	account A
INNER JOIN 
	department D ON A.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'Sale';
SELECT * FROM vw_DSNV_Sale;