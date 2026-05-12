/*
QUESTION: What are the top-paying data analyst jobs?
-Identify the top 10 highest-paying Data Analyst roles that are available remotely.
-Focuses on job postings with specified salaries (remove nulls).
-Why? Highlight the top-paying opportunities for Data Analysts, offering insights into emplyers
*/

SELECT
    job_id,
    job_title,
    job_title_short,
    job_schedule_type,
    salary_year_avg,
    job_location,
    job_country,
    job_posted_date,
    name
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
ORDER BY salary_year_avg DESC
LIMIT 10
