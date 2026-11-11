/*
=============================================================
Create Database and Schemas
=============================================================

*/

USE master;
GO

-- Drop and recreate the 'IKEA_DB' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'IKEA_DB')
BEGIN
    ALTER DATABASE IKEA_DB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE IKEA_DB;
END;
GO

-- Create the 'IKEA_DB' database
CREATE DATABASE IKEA_DB;
GO

USE IKEA_DB;
GO


