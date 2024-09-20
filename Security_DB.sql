-- Creating a database
CREATE DATABASE SECURITY_DB
GO
USE SECURITY_DB
GO
-- Creating Employee table
CREATE TABLE Employee
(
 ID INT PRIMARY KEY IDENTITY(1,1),
 Name VARCHAR(50),
 Designation VARCHAR(50),
 Salary INT
)
-- Creating Users table
CREATE TABLE Users
(
 ID INT PRIMARY KEY IDENTITY(1,1),
 UserName VARCHAR(50),
 UserPassword VARCHAR(50)
)
-- Creating RoleMaster Table
CREATE TABLE RoleMaster
(
 ID INT PRIMARY KEY IDENTITY(1,1),
 RollName VARCHAR(50)
)
-- Creating User Roles Mapping table
CREATE TABLE UserRolesMapping
(
 ID INT PRIMARY KEY,
 UserID INT NOT NULL,
 RoleID INT NOT NULL,
)
-- Adding Foreign KeyS 
ALTER TABLE UserRolesMapping
ADD FOREIGN KEY (UserID) REFERENCES Users(ID);
ALTER TABLE UserRolesMapping
ADD FOREIGN KEY (RoleID) REFERENCES RoleMaster(ID);