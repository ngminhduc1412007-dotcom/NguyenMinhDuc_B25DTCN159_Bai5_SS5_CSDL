-- Công cụ SQL dùng để chủ động rẽ nhánh logic và tự tạo ra cột ảo là CASE WHEN END 
-- Luồng dữ liệu NULL là dữ liệu biểu thị cho tệp khách hành mới chưa có dữ liệu đơn mua
-- Nếu không xác định đúng sẽ gây ra gán sai mức độ xếp hạng

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    total_orders INT
);

INSERT INTO Users (user_name, email, total_orders) VALUES
('Nguyễn Văn An', 'an@gmail.com', 650),
('Trần Thị Bình', 'binh@gmail.com', 300),
('Lê Văn Chi', 'chi@gmail.com', 120),
('Phạm Văn Dũng', 'dung@gmail.com', 80),
('Hoàng Thị Lan', 'lan@gmail.com', 20),
('Đỗ Minh Tuấn', 'tuan@gmail.com', NULL),
('Vũ Thị Mai', 'mai@gmail.com', 500),
('Phan Quốc Huy', 'huy@gmail.com', 501);

-- Xử lý tag của khách hàng 
SELECT user_name AS Tên_Khách_Hàng,
CASE 
WHEN total_orders IS NULL THEN 'Khách hàng mới'
WHEN total_orders > 500 THEN 'Kim Cương'
WHEN total_orders BETWEEN 100 AND 500 THEN 'Vàng'
ELSE 'Bạc'
END AS Xep_Hang 
FROM USERS;