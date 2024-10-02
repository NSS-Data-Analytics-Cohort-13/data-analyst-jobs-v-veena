-- Q.1 How many rows are in the data_analyst_jobs table?

select count(*)
from data_analyst_jobs ;

-- answer: 1793



--Q.2 Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

select * 
from data_analyst_jobs     
limit 10;
-- answer: UC DAVIS HEALTH SYSTEM




-- Q.3 How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
select count(location) 
from data_analyst_jobs
where location = 'TN';
--where (location = 'TN' or location ='KY');
-- answer :  Postings Count in TN = 21     Posting  count in TN or KY = 27




-- Q.4 How many postings in Tennessee have a star rating above 4?

select count(title)
from data_analyst_jobs
where location = 'TN' and star_rating >4;

-- answer : count in Tennessee above 4 rating = 3




--Q.5 How many postings in the dataset have a review count between 500 and 1000?

select count(title)
from data_analyst_jobs
where review_count between 500 and 1000 ;

--answer : review count between 500 and 1000 : 151


--Q.6 Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

select location,avg(companies)
from data-analyst_jobs
where 