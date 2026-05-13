/*
QUESTION: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill) for a data analyst?

- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

WITH salary_average AS (
    SELECT
        skills_dim.skill_id,
        skills,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
        AND job_no_degree_mention = TRUE
    GROUP BY
        skills_dim.skill_id
),
skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills,
        COUNT(skills_job_dim.job_id) AS skill_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY
        skills_dim.skill_id
)
SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    skill_count,
    avg_salary
FROM skills_demand
INNER JOIN salary_average ON skills_demand.skill_id = salary_average.skill_id
WHERE
    skill_count > 10
ORDER BY 
    skill_count DESC,
    avg_salary DESC;


-- SIMPLER WAY TO WRITE WITHOUT CTE's
SELECT 
    skills_dim.skill_id,
    skills,
    COUNT(skills_job_dim.job_id) AS skill_count,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY 
    skill_count DESC,
    avg_salary DESC;