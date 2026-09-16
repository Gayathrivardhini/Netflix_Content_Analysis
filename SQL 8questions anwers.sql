



select * from gayathri;

Q1. What is the overall distribution of Movies vs TV Shows on Netflix?
SELECT type,COUNT(type)
FROM gayathri
GROUP BY type; 

Q2. How has Netflix's content library changed over the years?
SELECT release_year,COUNT(title) AS total_titles
FROM gayathri
GROUP BY  release_year
ORDER BY total_titles ASC;

Q3. Which countries contribute the most content to Netflix?
SELECT TRIM(UNNEST(String_to_array(country,','))) AS total_country,COUNT(*) AS total_types
FROM gayathri
GROUP BY total_country
ORDER BY total_types DESC;


Q4. What are the most popular genres/categories available on Netflix?
SELECT TRIM(UNNEST(String_to_array(listed_in,','))) AS total_category,COUNT(*) AS by_year
FROM gayathri
GROUP BY total_category
ORDER BY by_year DESC
LIMIT 10;

Q5. Which content ratings are most common on Netflix?
SELECT rating,COUNT(type) AS total_content
FROM gayathri
GROUP BY rating
ORDER BY total_content dESC
LIMIT 10;

Q6. How does the distribution of Movies and TV Shows differ across the top content-producing countries?
SELECT TRIM(UNNEST(String_to_array(country,','))) AS country,type,COUNT(*) AS most_content
FROM gayathri
WHERE type IS NOT NULL AND country IS NOT NULL
GROUP BY country,type
ORDER BY most_content DESC;

Q7. What is the typical duration of Netflix Movies, and what duration is most common?
SELECT  AVG(CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER)) AS average_duration_minutes,COUNT(*) as total_movies
FROM gayathri
WHERE type='Movie' AND duration ~'[0-9]+';
SELECT duration,
    COUNT(*) AS total_movies
FROM gayathri
WHERE type = 'Movie'
  AND duration IS NOT NULL
GROUP BY duration
ORDER BY total_movies DESC
LIMIT 1;

Q8. Which years had the highest number of new titles added to Netflix?
SELECT release_year,COUNT(title) as  highest_numberof_titles
FROM gayathri
WHERE release_year IS NOT NULL
GROUP BY release_year
ORDER BY highest_numberof_titles DESC
LIMIT 5;



1.compare the avg purchase ammounts between standard and express shipping

SELECT shipping type,AVG(purchase amount) as average_purchases
from gayathri
where shipping type in('standard','express')
group by shipping type
order by average_purchases desc;




