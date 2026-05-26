-- Create employees table
CREATE TABLE IF NOT EXISTS employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    joining_date DATE NOT NULL
);

-- Insert sample data
INSERT INTO employees (name, email, department, salary, joining_date) VALUES
('Navya Sri', 'navya@example.com', 'DevOps Engineer', 180000.00, '2024-01-10'),
('Arjun Reddy', 'arjun@example.com', 'Software Engineer', 95000.00, '2023-02-18'),
('Priya Sharma', 'priya@example.com', 'HR', 72000.00, '2023-03-25'),
('Rahul Verma', 'rahul@example.com', 'Finance', 88000.00, '2023-04-12'),
('Sneha Iyer', 'sneha@example.com', 'Marketing', 76000.00, '2023-05-20');

-- Create a simple stored procedure
DELIMITER //
CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(50))
BEGIN
    SELECT * FROM employees WHERE department = dept_name;
END //
DELIMITER ;

-- Create index for performance
CREATE INDEX idx_department ON employees(department);
