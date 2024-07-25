# 1. 查詢 imdb 資料庫 movies 資料表中第八至第十列的觀測值。

SELECT *
 FROM imdb.movies
LIMIT 3
OFFSET 7;



# 2. 查詢 covid19 資料庫 locations 資料表中第十三列至第十六列的觀測值。

SELECT *
 FROM covid19.locations
LIMIT 4
OFFSET 12;



# 3. 查詢 imdb 資料庫 movies 資料表中於 1994 年上映的電影。

SELECT id,
       title,
       release_year,
       rating
 FROM imdb.movies
WHERE release_year = 1994;



# 4. 查詢 covid19 資料庫 locations 資料表中台灣的資料。

SELECT id,
       country_name,
       iso2,
       iso3,
       population        
 FROM covid19.locations
WHERE country_name = 'Taiwan';



# 5. covid19 資料庫 calendars 資料表中最小的日期與最大的日期。

SELECT min(recorded_on) AS min_date,
       max(recorded_on) AS max_date
 FROM covid19.calendars;



# 6. 查詢 imdb 資料庫 movies 資料表中最短的片長與最長的片長。

SELECT min(runtime) AS min_runtime,
       max(runtime) AS max_runtime
 FROM imdb.movies;



# 7. 查詢 imdb 資料庫 movies 資料表中最短片長與最長片長的電影。

SELECT title,
	   runtime
FROM imdb.movies
WHERE runtime = (SELECT min(runtime)FROM imdb.movies) OR   
      runtime = (SELECT max(runtime) FROM imdb.movies);



# 8. covid19 資料庫 accumulative_cases 資料表中最小的日期與最大的日期。

SELECT DISTINCT calendars.recorded_on AS min_max_date
 FROM covid19.accumulative_cases 
 JOIN covid19.calendars
 ON accumulative_cases.calendar_id = calendars.id
 WHERE accumulative_cases.calendar_id = (SELECT min(calendar_id) FROM covid19.accumulative_cases) OR 
 	   accumulative_cases.calendar_id = (SELECT max(calendar_id) FROM covid19.accumulative_cases)



# 9. covid19 資料庫台灣的資料。

SELECT locations.country_name,
       calendars.recorded_on,
       accumulative_cases.confirmed,
       accumulative_cases.deaths
 FROM covid19.accumulative_cases
 JOIN covid19.calendars
 ON accumulative_cases.calendar_id = calendars.id
 JOIN covid19.locations
 ON accumulative_cases.location_id = locations.id
 WHERE locations.country_name = 'Taiwan';



# 10. 查詢 imdb 資料庫 Top Gun: Maverick 的演員陣容。

SELECT movies.title,
       movies.release_year,
       actors.name,
       movies_actors.ord
 FROM imdb.movies_actors
 JOIN imdb.movies
 ON imdb.movies_actors.movie_id = movies.id
 JOIN imdb.actors
 ON imdb.movies_actors.actor_id = actors.id
 WHERE movies.title = 'Top Gun: Maverick';
