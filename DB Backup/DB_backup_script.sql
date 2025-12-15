/* ============================================================
   READY SQL SCRIPT (Schema + Data) - school_management_system
   - No hard-coded MDF/LDF paths
   - Drops & recreates the tables, then inserts the data
   ============================================================ */

USE [master];
GO

-- إذا ما عندك صلاحية CREATE DATABASE، احذف/علّق هالجزء وأنشئ DB يدويًا
IF DB_ID(N'school_management_system') IS NULL
BEGIN
    CREATE DATABASE [school_management_system];
END
GO

USE [school_management_system];
GO

/* ⚠️ هذا الجزء يمسح الجداول والبيانات الموجودة (إن وُجدت) */
IF OBJECT_ID(N'dbo.attendence_details', N'U') IS NOT NULL DROP TABLE dbo.attendence_details;
IF OBJECT_ID(N'dbo.billing_details',    N'U') IS NOT NULL DROP TABLE dbo.billing_details;
IF OBJECT_ID(N'dbo.enrollment_details', N'U') IS NOT NULL DROP TABLE dbo.enrollment_details;
IF OBJECT_ID(N'dbo.teachers_details',   N'U') IS NOT NULL DROP TABLE dbo.teachers_details;
IF OBJECT_ID(N'dbo.user_details',       N'U') IS NOT NULL DROP TABLE dbo.user_details;
GO

/* =======================
   CREATE TABLES (Schema)
   ======================= */

CREATE TABLE [dbo].[attendence_details](
    [std_id]    [varchar](50) NULL,
    [firstname] [varchar](50) NULL,
    [lastname]  [varchar](50) NULL,
    [class]     [varchar](50) NULL,
    [date]      [varchar](50) NULL,
    [remarks]   [varchar](50) NULL
);
GO

CREATE TABLE [dbo].[billing_details](
    [std_id]        [varchar](50) NULL,
    [firstname]     [varchar](50) NULL,
    [lastname]      [varchar](50) NULL,
    [class]         [varchar](50) NULL,
    [date]          [varchar](50) NULL,
    [tution_fees]   [varchar](50) NULL,
    [other_charges] [varchar](50) NULL,
    [total_amount]  [varchar](50) NULL,
    [status]        [varchar](50) NULL
);
GO

CREATE TABLE [dbo].[enrollment_details](
    [std_id]         [varchar](50) NULL,
    [s_firstname]    [varchar](50) NULL,
    [s_middlename]   [varchar](50) NULL,
    [s_lastname]     [varchar](50) NULL,
    [birthdate]      [varchar](50) NULL,
    [age]            [varchar](50) NULL,
    [gender]         [varchar](50) NULL,
    [birth_city]     [varchar](50) NULL,
    [birth_province] [varchar](50) NULL,
    [birth_region]   [varchar](50) NULL,
    [p_firstname]    [varchar](50) NULL,
    [p_lastname]     [varchar](50) NULL,
    [occupation]     [varchar](50) NULL,
    [address]        [varchar](50) NULL,
    [home_phone]     [varchar](50) NULL,
    [cell_phone]     [varchar](50) NULL,
    [std_class]      [varchar](50) NULL,
    [tution_fees]    [varchar](50) NULL,
    [other_charges]  [varchar](50) NULL,
    [discount]       [varchar](50) NULL,
    [total_amount]   [varchar](50) NULL,
    [receipt_number] [varchar](50) NULL
);
GO

CREATE TABLE [dbo].[teachers_details](
    [teacher_id]        [varchar](50) NULL,
    [teacher_firstname] [varchar](50) NULL,
    [teacher_lastname]  [varchar](50) NULL,
    [father_name]       [varchar](50) NULL,
    [date_of_birth]     [varchar](50) NULL,
    [age]               [int] NULL,
    [qualification]     [varchar](50) NULL,
    [subjects]          [varchar](50) NULL,
    [salary]            [varchar](50) NULL,
    [phone_no]          [varchar](50) NULL,
    [classes_under]     [varchar](50) NULL
);
GO

CREATE TABLE [dbo].[user_details](
    [user_id]   [varchar](50) NULL,
    [firstname] [varchar](50) NULL,
    [lastname]  [varchar](50) NULL,
    [user_name] [varchar](50) NULL,
    [password]  [varchar](50) NULL,
    [type]      [varchar](50) NULL
);
GO

/* =======================
   INSERT DATA (Rows)
   ======================= */

-- attendence_details
INSERT INTO [dbo].[attendence_details] ([std_id],[firstname],[lastname],[class],[date],[remarks])
VALUES (N'2210213600', N'ahmad', N'khedar', N'Class 3', N'Friday,28 November 2025', NULL);
GO

-- billing_details
INSERT INTO [dbo].[billing_details] ([std_id],[firstname],[lastname],[class],[date],[tution_fees],[other_charges],[total_amount],[status]) VALUES
(N'123456',      N'Muhammad', N'Daniyal', N'Class Matric', N'10/September/2019', N'3.500', N'900', N'4.400', N'Paid'),
(N'123457',      N'Muhammad', N'Ali',     N'Class 9',      N'10/September/2019', N'3.500', N'900', N'4.400', N'Late Paid'),
(N'213213',      N'Muhammad', N'hassan',  N'Class 2',      N'11/September/2019', N'1.500', N'700', N'2.200', N'Late Paid'),
(N'342345',      N'Talha',    N'Ali',     N'Class 8',      N'11/September/2019', N'3.000', N'800', N'3.800', N'UnPaid'),
(N'2210213600',  N'ahmad',    N'khedar',  N'Class 3',      N'28/November/2025',  N'2.000', N'700', N'2.700', N'Paid');
GO

-- enrollment_details
INSERT INTO [dbo].[enrollment_details]
([std_id],[s_firstname],[s_middlename],[s_lastname],[birthdate],[age],[gender],[birth_city],[birth_province],[birth_region],
 [p_firstname],[p_lastname],[occupation],[address],[home_phone],[cell_phone],[std_class],[tution_fees],[other_charges],[discount],[total_amount],[receipt_number])
VALUES
(N'2210213600', N'ahmad', N'abdulrahman', N'khedar', N'Thursday, September 5, 2019', N'21', N'Male', N'domascus',
 N'Damascus',  -- إذا بدك غيّرها للقيمة الصحيحة عندك
 N'syria',
 N'abdulrahman', N'ahmed', N'doctor', N'100.yil', N'5888333993', N'5352173732', N'Class 3', N'2,000', N'700', N'50', N'2,700', N'5000');
GO

-- teachers_details
INSERT INTO [dbo].[teachers_details]
([teacher_id],[teacher_firstname],[teacher_lastname],[father_name],[date_of_birth],[age],[qualification],[subjects],[salary],[phone_no],[classes_under])
VALUES
(N'3244', N'ammar', N'al-qadasi', N'mohammed', N'Tuesday, October 30, 1990', 10, N'bhd', N'Computer science,P.s,t', N'3000000000', N'5449096577', N'Primary classes');
GO

-- user_details
INSERT INTO [dbo].[user_details] ([user_id],[firstname],[lastname],[user_name],[password],[type])
VALUES (N'12332', N'Ali', N'Suliman', N'alisuliman', N'12345', N'Admin');
GO

/* Quick checks */
SELECT 'attendence_details' AS tbl, COUNT(*) AS rows_count FROM dbo.attendence_details
UNION ALL SELECT 'billing_details',    COUNT(*) FROM dbo.billing_details
UNION ALL SELECT 'enrollment_details', COUNT(*) FROM dbo.enrollment_details
UNION ALL SELECT 'teachers_details',   COUNT(*) FROM dbo.teachers_details
UNION ALL SELECT 'user_details',       COUNT(*) FROM dbo.user_details;
GO
