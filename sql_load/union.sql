SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs


-- UNION ALL returns all rows including dublicates


-- Practice Problem
-- Find job posting from the quarter that have a salary greater that $70k 
-- combile job posting tables from the first quarter of 2023 (Jan-Mar)
-- Gets job posting with an average yearly salary > $70,000


SELECT 
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM(
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings
WHERE 
    salary_year_avg > 7000 AND
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC

