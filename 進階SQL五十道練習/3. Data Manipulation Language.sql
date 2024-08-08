# 建立 cloned_covid19 資料庫，charset 指定 utf8mb4，collation 指定 utf8mb4_unicode_ci
CREATE DATABASE cloned_covid19 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


# 在 cloned_covid19 資料庫中，建立 locations 資料表，下載 locations.csv 匯入外部資料
SELECT *
FROM cloned_covid19.locations;


# 在 cloned_covid19 資料庫中，將 locations 資料表第 496 筆觀測值，將它的 iso2 欄位由原本的空字元 '' 更新為 'NA'
SELECT *
FROM cloned_covid19.locations
WHERE id = 496;

UPDATE cloned_covid19.locations
SET iso2 = 'NA'
WHERE id = 496;


# 在 cloned_covid19 資料庫中，將 locations 資料表中 province_name 欄位原為空字元 '' 的觀測值更新為 NULL
SELECT *
FROM cloned_covid19.locations
WHERE province_name = '';

UPDATE cloned_covid19.locations
SET province_name = NULL
WHERE province_name = 'NULL';

SELECT *
FROM cloned_covid19.locations
WHERE province_name IS NULL;


# 在 cloned_covid19 資料庫中，將 locations 資料表中 iso2 欄位原為空字元 '' 的觀測值更新為 NULL
# 在 cloned_covid19 資料庫中，將 locations 資料表中 iso3 欄位原為空字元 '' 的觀測值更新為 NULL
SELECT *
FROM cloned_covid19.locations
WHERE iso2 = '';

UPDATE cloned_covid19.locations
SET iso2 = NULL,
	iso3 = NULL
WHERE iso2 = '' AND iso3 = '';


# 在 cloned_covid19 資料庫中，將 locations 資料表中的 id 欄位增添約束條件 PRIMARY KEY
ALTER TABLE cloned_covid19.locations
ADD CONSTRAINT PRIMARY KEY (id); 

SHOW INDEX FROM cloned_covid19.locations; 


# 在 cloned_covid19 資料庫中，建立 accumulative_cases 資料表，下載 accumulative_cases.csv 匯入外部資料
SELECT *
FROM cloned_covid19.accumulative_cases
LIMIT 10;


# 在 cloned_covid19 資料庫中，將 accumulative_cases 資料表中的 id 欄位增添約束條件 PRIMARY KEY
ALTER TABLE cloned_covid19.accumulative_cases
ADD CONSTRAINT PRIMARY KEY (id);

SHOW INDEX FROM cloned_covid19.accumulative_cases;


# 在 cloned_covid19 資料庫中，將 accumulative_cases 資料表中的 location_id 欄位增添 fk_accumulative_cases_locations 約束條件 FOREIGN KEY 參照 locations 資料表的 id
ALTER TABLE cloned_covid19.accumulative_cases
ADD CONSTRAINT fk_accumulative_cases_locations FOREIGN KEY (location_id) REFERENCES locations (id); 

SHOW INDEX FROM cloned_covid19.accumulative_cases;
