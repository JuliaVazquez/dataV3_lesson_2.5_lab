-- 1. Select all the actors with the first name ‘Scarlett’
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';


-- 2. How many films (movies) are available for rent 
SELECT COUNT(*) FROM sakila.film;
	-- total films
    
SELECT SUM(ISNULL(return_date))  FROM sakila.rental;
	-- films that have not return_date so didn't have been returned

SELECT 1000 -SUM(ISNULL(return_date))  FROM sakila.rental;
	-- movies available for rent


-- 2.         and how many films have been rented?
SELECT COUNT(rental_rate) FROM sakila.film
WHERE rental_rate >0;
	-- every film has been rented 
    
SELECT SUM(ISNULL(return_date))  FROM sakila.rental;
	-- these are the ones that are still being rented





-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration
SELECT MAX(length), MIN(length) from sakila.film;
SELECT title, length FROM sakila.film
WHERE length = 185 OR length = 46
ORDER BY length;



   
-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT AVG(length) AS avg_length, CONVERT(AVG(length),TIME) AS avg_hours FROM sakila.film;



-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;



-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(last_update),MIN(rental_date)) FROM sakila.rental;




-- 7. Show rental info with additional columns month and weekday. Get 20 results
SELECT rental_date ,DATE_FORMAT(CONVERT(rental_date, DATE), '%D') AS rental_day, DATE_FORMAT(CONVERT(rental_date, DATE), '%M') AS rental_month
FROM sakila.rental
LIMIT 20;




-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week
SELECT rental_id, rental_date,
CASE
WHEN WEEKDAY(rental_date) IN (5,6) THEN 'Weekend'
ELSE 'Workday'
END AS 'Weekday' 
FROM sakila.rental;




-- 9. Get release years
SELECT DISTINCT release_year FROM sakila.film;





-- 10. Get all films with ARMAGEDDON in the title
SELECT film_id, title FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';





-- 11. Get all films which title ends with APOLLO
SELECT film_id, title FROM sakila.film
WHERE title LIKE '%APOLLO';






-- 12. Get 10 the longest films
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 10;






-- 13. How many films include Behind the Scenes content?
SELECT COUNT(*) FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';




