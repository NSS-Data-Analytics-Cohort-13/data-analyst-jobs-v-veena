-- Q.1 How many rows are in the data_analyst_jobs table?

select count(*)
from data_analyst_jobs ;

-- answer: 1793



--Q.2 Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

select * 
from data_analyst_jobs     
limit 10;
-- answer: ExxonMobile




-- Q.3 How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
select count(location) 
from data_analyst_jobs
where location = 'TN';

select count(location) 
from data_analyst_jobs
where location IN('TN','KY');
-- answer :  Postings Count in TN = 21     Posting  count in TN or KY = 27




-- Q.4 How many postings in Tennessee have a star rating above 4?

select * --count(title)
from data_analyst_jobs
where location = 'TN' and star_rating >4;

-- answer : count in Tennessee above 4 rating = 3




--Q.5 How many postings in the dataset have a review count between 500 and 1000?

select * --count(title)
from data_analyst_jobs
where review_count between 500 and 1000 ;

--answer : review count between 500 and 1000 : 151


--Q.6 Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

select  location ,avg(star_rating) as avg_rating 
from data_analyst_jobs 
where star_rating is not null
group by location 
order by avg_rating desc ;

--Answer : state NE average is high = 4.1999


--Q.7 Select unique job titles from the data_analyst_jobs table. How many are there?

--select count(distinct title) as count_jobs
--from data_analyst_jobs ;
-- answer : 881

select distinct lower(title) as unique_title_lowercase 
from data_analyst_jobs 
-- answer : distinct 877



--Q.8 How many unique job titles are there for California companies?
select count(distinct title) as unique_title_california
from data_analyst_jobs
where location = 'CA';
--ans:230

select count(distinct lower(title)) as unique_title_california
from data_analyst_jobs
where location = 'CA';

--answer : unique title count for california state = 229


--Q.9 Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
select company, avg(star_rating) as avg_rating 
from data_analyst_jobs
where review_count > 5000 and company is not null
group by company ;


-- ans : 40

--Q.10 Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

select company, avg(star_rating)  as avg_rating 
from data_analyst_jobs
where review_count > 5000
group by company 
order by avg_rating desc;

--answer: General Mortors , Unilever,Microsoft ,Nike,American Express Kaiser Permanente with 4.1999

--Q.11 Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
select distinct title
from data_analyst_jobs
where title like '%Analyst%';


--answer: (total titles 1000 ) unique job titles are 754

--Q.12 How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

select distinct title
from data_analyst_jobs
where title not like '%Analyst%' and  title not like '%analyst%' and title not like '%ANALYST%'
and 
title not like '%Analytics%' and title not like '%analytics%' and title not like '%ANALYTICS%' ;
--title NOT IN ('%Analytics%', '%analytics%', '%ANALYTICS%');

-- Answer : 802 , handling case sensitive count is 4


--Bonus: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.

--Disregard any postings where the domain is NULL.
--Order your results so that the domain with the greatest number of hard to fill jobs is at the top.
--Which three industries are in the top 3 on this list? How many jobs have been listed for more than 3 weeks for each of the top 3?

select  domain,count(title) as jobs
from data_analyst_jobs
where skill like '%SQL%' and days_since_posting >21 and domain IS NOT NULL
group by domain
order by jobs desc
limit 3;
-- answer : internet and software(62) ,bank and financial services(61),consulting and business services (57)