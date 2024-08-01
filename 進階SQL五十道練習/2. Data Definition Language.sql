# 建立 cloned_covid19 資料庫，charset 指定 utf8mb4，collation 指定 utf8mb4_unicode_ci
CREATE DATABASE cloned_covid19 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
SHOW DATABASES;


# 在 cloned_covid19 資料庫中，建立 locations 資料表
CREATE TABLE cloned_covid19.locations (
	id int UNSIGNED,
	country_name varchar(200),
	iso2 char(2),
	iso3 char(3),
	longitude float,
	latitude float
);


# 在 cloned_covid19 資料庫中，建立 calendars 資料表
CREATE TABLE cloned_covid19.calendars(
	id int unsigned,
	recorded_on date
);


# 在 cloned_covid19 資料庫中，建立 accumulative_cases 資料表
CREATE TABLE cloned_covid19.accumulative_cases(
	id int unsigned,
	calendar_id int unsigned,
	location_id int unsigned,
	confirmed bigint,
	deaths bigint
);


# 在 covid19 資料庫中，篩選 accumulative_cases.calendar_id = 1164 建立 accumulative_cases_20230309 檢視表
CREATE VIEW covid19.accumulative_cases_20230309
 AS 
SELECT *
 FROM covid19.accumulative_cases
 WHERE calendar_id = 1164;


# 在 covid19 資料庫中，篩選 locations.iso3 IN ('TWN', 'JPN') 建立 locations_twn_jpn 檢視表
CREATE VIEW covid19.locations_twn_jpn
AS
SELECT *
FROM covid19.locations
WHERE iso3 IN ('TWN', 'JPN');


# 在 covid19 資料庫中，建立 views_joined 檢視表，使用 JOIN 連接兩個檢視表。
# 以 accumulative_cases_20230309 作為左檢視表、locations_twn_jpn 作為右檢視表
CREATE VIEW covid19.views_joined
AS
SELECT locations_twn_jpn.country_name,
	   locations_twn_jpn.province_name,
	   accumulative_cases_20230309.confirmed,
	   accumulative_cases_20230309.deaths
FROM covid19.accumulative_cases_20230309
JOIN covid19.locations_twn_jpn
ON accumulative_cases_20230309.location_id = locations_twn_jpn.id


# 在 covid19 資料庫中，建立 views_left_joined 檢視表，使用 LEFT JOIN 連接兩個檢視表。
# 以 accumulative_cases_20230309 作為左檢視表、locations_twn_jpn 作為右檢視表。
CREATE VIEW covid19.views_left_joined
AS 
SELECT locations_twn_jpn.country_name,
	   locations_twn_jpn.province_name,
	   accumulative_cases_20230309.confirmed,
	   accumulative_cases_20230309.deaths
FROM covid19.accumulative_cases_20230309
LEFT JOIN covid19.locations_twn_jpn
ON accumulative_cases_20230309.location_id = locations_twn_jpn.id


# 在 covid19 資料庫中，建立 views_right_joined 檢視表。
# 使用 RIGHT JOIN 連接兩個檢視表，以 accumulative_cases_20230309 作為左檢視表、locations_twn_jpn 作為右檢視表
CREATE VIEW covid19.views_right_joined
AS 
SELECT locations_twn_jpn.country_name,
	   locations_twn_jpn.province_name,
	   accumulative_cases_20230309.confirmed,
	   accumulative_cases_20230309.deaths
FROM covid19.accumulative_cases_20230309
RIGHT JOIN covid19.locations_twn_jpn
ON accumulative_cases_20230309.location_id = locations_twn_jpn.id



















































































