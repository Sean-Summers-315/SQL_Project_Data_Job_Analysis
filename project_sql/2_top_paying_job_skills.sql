/*
QUESTION: What skills are required for the top-paying data analyst jobs?
-Use the top 10 highest-paying Data Analyst jobs from the first query.
-Add specific skills from these roles.
-Why? It provides a detalied look at which high-paying jobs demand certain skills,
    helping job seekers understand which skils to develop that align with top salaries
*/
WITH top_paying_jobs AS (
    SELECT
    job_id,
    job_title,
    job_title_short,
    job_schedule_type,
    salary_year_avg,
    job_location,
    job_country,
    job_posted_date,
    name AS company_name
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
    AND job_no_degree_mention = TRUE
ORDER BY 
    salary_year_avg DESC
LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

