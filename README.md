# **Data Analysts Job Analysis** *Skills, Salaries & No Degree Opportunities*
## Table of Contents
- [**Introduction**](#introduction)
- [**Background**](#background)
- [**Tools Used**](#tools-i-used)
- [**The Analysis**](#the-analysis)
- [**What I learned**](#what-i-learned)
- [**Conclusions**](#conclusions)

## Introduction


Breaking into data analytics without a traditional degree can feel challenging, especially for people looking for flexible remote work. This project explores remote data analyst job postings that do not list a degree as a requirement, with the goal of identifying realistic opportunities for skills-based candidates, through SQL-based analysis.

This project was completed as part of Luke Barousse's SQL course and showcases practical SQL skills including filtering, aggregation, joins, common table expressions, and data-driven storytelling. [Luke Barousse SQL Course](https://www.youtube.com/watch?v=7mz73uXD9DA)

SQL queries? Check them out here: [project_sql folder](/project_sql/)

### Project Highlights

📌 5 business questions answered  
📌 25+ SQL queries written  
📌 4 database tables analyzed  
📌 Thousands of job postings examined  
📌 Multiple visualizations created

## Background
Many aspiring data analysts, as well as myself, are entering the field through online courses, self-study, and portfolio projects rather than traditional degree programs. Because of this, I wanted to focus my analysis on jobs that may be more accessible to candidates without a college degree.

The main questions I wanted to answer were:

1. What are the top-paying data analyst jobs?
2. What skills are required for the top-paying data analyst jobs?
3. What are the most in-demand skills for data analysts?
4. What are the top skills based on salary?
5. What are the most high demand and high-paying skills for a data analyst?

## Tools I Used
- **SQL**
- **PostgreSQL**
- **VS Code**
- **GitHub**

## The Analysis
### 💰1. Top Paying Data Analyst Jobs
<details>
<summary><strong> Click Here</strong></summary>


```sql
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
    AND job_no_degree_mention = TRUE
ORDER BY salary_year_avg DESC
LIMIT 10
```
### Results

To better understand the salary potential for remote data analyst roles that do not require a degree, I analyzed the highest-paying job postings from the dataset. The results show that several remote analyst roles offer salaries well above $150,000, especially for senior, lead, principal, and analytics leadership positions.

| Rank | Job Title | Company | Country | Schedule Type | Average Yearly Salary |
|---:|---|---|---|---|---:|
| 1 | Data Analyst | Mantys | India | Full-time | $650,000 |
| 2 | Director of Analytics | Meta | United States | Full-time | $336,500 |
| 3 | DTCC Data Analyst | Robert Half | United States | Full-time | $170,000 |
| 4 | Principal Data Analyst | Realtime Recruitment | Canada | Full-time | $160,000 |
| 5 | SQL Developer / Data Analyst | Robert Half | United States | Full-time | $160,000 |
| 6 | Staff Business Data Analyst | Zscaler | United States | Full-time | $152,625 |
| 7 | Staff Business Data Analyst | Zscaler | United States | Full-time | $152,625 |
| 8 | Lead Data Analyst, Growth | Rocket Money | United States | Full-time | $152,500 |
| 9 | Management & Program Analyst, Data Analytics | US Patent and Trademark Office | United States | Full-time and Part-time | $152,222 |
| 10 | Data Analyst | CyberCoders | United States | Full-time | $145,000 |


![Top Paying Roles](assets\top_paying_remote_data_analyst_jobs.png)

### Key Insights

- The highest-paying role was a remote **Data Analyst** position at **Mantys**, with an average yearly salary of **$650,000**.
- Most of the top-paying jobs were located in the **United States**, showing strong salary potential for remote U.S.-based data analyst roles.
- Several of the highest-paying roles were senior or specialized positions, such as **Director of Analytics**, **Principal Data Analyst**, **Staff Business Data Analyst**, and **Lead Data Analyst**.
- The top 10 salaries ranged from **$145,000 to $650,000**, showing that remote data analyst roles can offer high earning potential even when degree requirements are not listed.
- It is important to note that the top two salaries appear to be **significant** **outliers** within the dataset. Even when excluding these outliers, the remaining top-paying data analyst roles consistently offered salaries above **$150,000**.

> ### Key Takeaways

> - Remote data analyst roles can still offer strong salary potential without explicit degree requirements.
> - Most high-paying positions were senior or specialized roles rather than entry-level positions.
> - SQL and analytics-focused positions appeared frequently among higher-paying opportunities.
> - The dataset contained significant salary outliers, making it important to interpret averages carefully.
> - Even after excluding outliers, many top roles still exceeded $150,000 annually.

</details>


### 🛠️2. Top Paying Data Analyst Skills
<details>
<summary><strong> Click Here</strong></summary>

<br> 

```sql
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
```
### Results

To better understand which technical skills are associated with the highest-paying remote data analyst jobs that do not require a degree, I analyzed the skills listed within the top-paying job postings from the dataset. The results show that high-paying analyst roles frequently require a combination of programming, database, visualization, and big data technologies.
| Company                        | Job Title                                     |   Salary | Skills Required                                           |
| ------------------------------ | --------------------------------------------- | -------: | --------------------------------------------------------- |
| Robert Half                    | DTCC Data Analyst                             | $170,000 | Java, Go, Excel                                           |
| Robert Half                    | SQL Developer / Data Analyst                  | $160,000 | SQL, Java                                                 |
| Realtime Recruitment           | Principal Data Analyst                        | $160,000 | Snowflake, Power BI, Looker                               |
| Zscaler                        | Staff Business Data Analyst                   | $152,625 | SQL, Hadoop, Excel, Tableau, Looker                       |
| Rocket Money                   | Lead Data Analyst, Growth                     | $152,500 | SQL, Looker                                               |
| US Patent and Trademark Office | Management & Program Analyst (Data Analytics) | $152,221 | SQL, R, Go, Databricks, Tableau, Alteryx                  |
| CyberCoders                    | Data Analyst                                  | $145,000 | Python, Java, R, JavaScript, C++, Tableau, Power BI, Qlik |



### Key Insights
- High-paying remote analyst roles typically required a broad mix of technical and analytical skills rather than expertise in only one area.
- **SQL** appeared across many of the top-paying positions, reinforcing its importance as one of the most valuable core skills for data analysts.
- Visualization platforms such as **Tableau**, **Power BI**, **Looker**, and **Qlik** appeared frequently throughout the results, highlighting the importance of communicating insights effectively.
- Several companies requested programming languages such as **Python**, **Java**, **R**, **Go**, **JavaScript**, and **C++**, suggesting that software and programming experience can significantly increase salary potential.
- Cloud and big data technologies including **Snowflake**, **Databricks**, and **Hadoop** were associated with more advanced or specialized analyst positions.
- The most technically demanding roles often combined querying, visualization, programming, and cloud technologies into a single position.
- Overall, the results suggest that candidates who build a diverse technical skill set may qualify for a wider range of high-paying remote data analyst opportunities.


> ### Key Takeaways
> - SQL appeared in most high-paying roles
> - Tableau and Power BI were highly requested
> - Senior analyst roles required broader technical stacks

</details>

### 📈3. Top Demanded Data Analyst Skills
<details>
<summary><strong> Click Here</strong></summary>

<br>

```sql
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
    AND job_no_degree_mention = TRUE
GROUP BY
    skills
ORDER BY demand_count DESC
LIMIT 5
```

### Results

To better understand which technical skills are most commonly requested in remote data analyst jobs that do not require a degree, I analyzed the frequency of skills appearing throughout the dataset. The results show that SQL, Excel, and Python were the most in-demand skills across remote analyst job postings.

| Skill | Demand Count |
|---|---:|
| SQL | 2,599 |
| Excel | 1,502 |
| Python | 1,479 |
| Tableau | 1,169 |
| Power BI | 875 |

![Most In-Demand Skills](assets\most_in_demand_skills.png)
### Key Findings

- **SQL** was by far the most in-demand skill, appearing in over **2,500** job postings, making it one of the most essential technical skills for aspiring data analysts.
- **Excel** remained one of the most requested tools despite the growth of newer technologies, showing that spreadsheet analysis is still heavily used in business environments.
- **Python** ranked closely behind Excel, highlighting the increasing importance of programming and automation skills within data analytics roles.
- Visualization tools such as **Tableau** and **Power BI** appeared frequently throughout the dataset, reinforcing the importance of dashboarding and data storytelling skills.
- The results suggest that employers value a combination of querying, spreadsheet analysis, programming, and visualization abilities when hiring remote data analysts.

 >### Key Takeaways
> - SQL is the most valuable foundational skill for data analysts.
> - Excel continues to play a major role in analytics workflows.
> - Python is becoming increasingly important for higher-level analytical work.
> - Visualization tools like Tableau and Power BI are highly desirable for communicating insights effectively.

</details>

### 🎯4. Top Paying Data Analyst Skills
<details>
<summary><strong> Click Here</strong></summary>

<br>

```sql
SELECT
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
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
```

### Results

To better understand which technical skills are associated with the highest-paying remote data analyst jobs that do not require a degree, I analyzed the average salaries tied to specific skills throughout the dataset. The results show that cloud technologies, big data tools, and specialized technical skills were often linked to the highest salaries.

| Skill | Average Salary |
|---|---:|
| Databricks | $141,111 |
| NoSQL | $140,000 |
| Hadoop | $137,583 |
| Visio | $130,000 |
| BigQuery | $130,000 |
| DAX | $130,000 |
| Twilio | $127,000 |
| GCP | $120,000 |
| C | $119,875 |
| Snowflake | $114,437 |

![Top Paying Skills](assets\top_10_paying_skills.png)

### Key Findings

- **Databricks**, **NoSQL**, and **Hadoop** were associated with the highest average salaries in the dataset, suggesting that big data and cloud-based technologies are highly valued in advanced analytics roles.
- Several cloud and database-related technologies such as **BigQuery**, **GCP**, and **Snowflake** appeared within the top-paying skills, highlighting the growing importance of cloud data infrastructure.
- Business and analytics-focused tools such as **DAX** and **Visio** also showed strong salary potential, demonstrating that reporting and business intelligence skills remain valuable in analyst roles.
- Programming and technical development skills, including **C**, were associated with above-average salaries, suggesting that software engineering knowledge can improve earning potential for analysts.
- The results suggest that specialized and modern technical skills tend to correlate with higher salaries compared to more traditional analyst tools.

> ### Key Takeaways
> - Big data and cloud technologies were associated with the highest-paying analyst roles.
> - Specialized technical skills can significantly increase salary potential.
> - Cloud database and infrastructure tools are becoming increasingly valuable in analytics careers.
> - Combining analytics, programming, and cloud skills may provide stronger long-term career opportunities for remote data analysts.
> - Higher-paying analyst roles often favor candidates with modern technical expertise beyond foundational spreadsheet and reporting tools.

</details>

### 5. 🏆Most Optimal Data Analyst Skills

<details>
<summary><strong> Click Here</strong></summary>

```sql
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
```

### Results

To better understand which skills offer the best balance between demand and salary for remote data analyst jobs that do not require a degree, I analyzed both the number of job postings associated with each skill and the average salary tied to those postings. The results show that SQL, Excel, Python, Tableau, and R were among the most common skills, while Looker, Python, R, Tableau, and SAS were associated with stronger average salaries.

| Skill | Demand Count | Average Salary |
|---|---:|---:|
| SQL | 398 | $97,237 |
| Excel | 256 | $87,288 |
| Python | 236 | $101,397 |
| Tableau | 230 | $99,288 |
| R | 148 | $100,499 |
| Power BI | 110 | $97,431 |
| SAS | 63 | $98,902 |
| PowerPoint | 58 | $88,701 |
| Looker | 49 | $103,795 |
| Word | 48 | $82,576 |

![Top 10 Skills by Demand and Salary](assets\top_10_optimal_skills_demand_salary_updated.png)

### Key Findings

- **SQL** was the most in-demand skill by a wide margin, appearing in **398** job postings, which reinforces its importance as a foundational data analyst skill.
- **Excel** had the second-highest demand count, showing that spreadsheet skills remain highly relevant in analyst roles even alongside more technical tools.
- **Python**, **Tableau**, and **R** stood out because they had both strong demand and average salaries near or above **$100,000**.
- **Looker** had the highest average salary in the top 10 at **$103,795**, despite having a lower demand count than SQL, Excel, Python, and Tableau.
- **Power BI** appeared in over **100** job postings and had an average salary of **$97,431**, showing that business intelligence tools remain valuable for remote analyst roles.
- General office tools like **PowerPoint** and **Word** had lower average salaries compared to more technical tools, suggesting that technical analytics skills may have stronger salary potential.

### Key Takeaways

> - SQL offered the strongest balance of demand and salary, making it the most important foundational skill in the analysis.
> - Python, Tableau, R, and Power BI showed strong value because they combined high demand with competitive salary potential.
> - Looker had the highest average salary among the top 10 skills, despite appearing in fewer postings.
> - Technical analytics and visualization tools generally showed stronger salary potential than general office tools.
> - The most optimal skills were not just the highest-paying skills, but the ones that combined strong demand with strong salaries.

</details>

## What I Learned
Over the course of this project, I progressed from having no prior SQL experience to developing a strong understanding of core SQL concepts and functionality. This project provided me with the foundational skills that will support future projects and give me the confidence to tackle increasingly complex problems as I continue learning.

Throughout this process, I learned essential SQL skills including data aggregation, value and date manipulation, SQL functions, query organization, filtering, sorting, and working with joins across multiple tables.

One of the biggest lessons I learned was the importance of persistence and problem-solving. I encountered countless error messages and debugging challenges throughout the project, often working through many issues at once. Learning to troubleshoot, identify mistakes, and continue refining my queries is my greatest strength and has significantly increased both my technical skills and confidence as a SQL developer.


## Summary
Throughout this analysis, remote data analyst roles showed strong salary potential, with many positions offering salaries above $100,000 and some exceeding $150,000. SQL emerged as the most important foundational skill due to its consistently high demand.

The analysis also showed that specialized technical skills such as programming, data visualization, cloud technologies, and data engineering tools were often associated with stronger salary potential. Higher-paying roles frequently required a combination of database querying, technical analysis, visualization, and business intelligence skills rather than expertise in a single area.

Overall, this project demonstrates how SQL can be used to analyze raw data and uncover meaningful insights while showcasing practical data analysis and problem-solving skills.

>## Key Conclusions

>- Remote data analyst jobs without degree requirements can still offer highly competitive salaries.
>- SQL was the most valuable foundational skill due to its extremely high demand across job postings.
>- Python, Tableau, Power BI, and R provided a strong balance between market demand and salary potential.
>- Specialized technologies such as Databricks, Hadoop, Snowflake, BigQuery, and cloud platforms were associated with some of the highest salaries in the dataset.
>- Higher-paying analyst roles often favored candidates with broader technical skill sets that combined querying, visualization, programming, and cloud technologies.
>- Visualization and business intelligence tools remained highly valuable throughout the dataset, reinforcing the importance of data storytelling and reporting skills.
>- General office tools such as Word and PowerPoint appeared frequently but were associated with lower salaries compared to more technical analytics tools.