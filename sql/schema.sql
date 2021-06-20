/* Schema for SQL database/table. We haven't discussed this type of file yet */
DROP DATABASE IF EXISTS managementDB;

/* Create database */
CREATE DATABASE managementDB;
USE managementDB;

/* Create new table with a primary key that auto-increments, and a text field */
CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);
CREATE TABLE role (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    salary DECIMAL NOT NULL,
    department_id INT UNSIGNED NOT NULL,
    INDEX dep_id (department_id),
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id)ON DELETE CASCADE 
);
CREATE TABLE employee (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT UNSIGNED NOT NULL,
    INDEX role_id (role_id),
     FOREIGN KEY (role_id) REFERENCES role(id),
    manager_id INT UNSIGNED,
    INDEX manager_id (manager_id),
	FOREIGN KEY (manager_id) REFERENCES employee(id)
);