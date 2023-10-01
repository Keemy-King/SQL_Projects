-- Write SQL code to extract the following insights from the
-- dataset that will help with the business problem
-- a) How much is the total donation?

SELECT SUM(donation) AS "Total Donation"
FROM donation_data

-- b) What is the total donation by gender?
SELECT gender, SUM(donation) AS "Total Donation"
FROM donation_data
GROUP BY gender


-- c) Show the total donation and number of donations by gender

SELECT gender, 
	SUM(donation) AS "Total Donation", 
	COUNT(donation) AS "Number of Donations"
FROM donation_data
GROUP BY gender

-- d) Total donation made by frequency of donation
SELECT donation_frequency, 
	SUM(donation) AS "Total Donation", 
	COUNT(donation) AS "Number of Donations"
FROM donation_data
JOIN donor_data
ON donation_data.id = donor_data.id
GROUP BY donation_frequency
ORDER BY "Number of Donations" DESC

-- e) Total donation and number of donation by Job field
SELECT job_field,
	SUM(donation) AS "Total Donation", 
	COUNT(donation) AS "Number of Donations"
FROM donation_data
JOIN donor_data
ON donation_data.id = donor_data.id
GROUP BY job_field
ORDER BY "Total Donation" DESC, "Number of Donations" DESC

-- f) Total donation and number of donations above
-- $200
SELECT 
	SUM(donation) AS "Total Donation", 
	COUNT(donation) AS "Number of Donations"
FROM donation_data
WHERE donation > 200

-- g) Total donation and number of donations below
-- $200
SELECT 
	SUM(donation) AS "Total Donation", 
	COUNT(donation) AS "Number of Donations"
FROM donation_data
WHERE donation < 200

-- h) Which top 10 states contributes the highest
-- donations
SELECT state, sum(donation) as "Highest Donations"
FROM donation_data
GROUP BY state
ORDER BY "Highest Donations" DESC
LIMIT 10;

-- i) Which top 10 states contributes the least donations

SELECT state, sum(donation) as "Highest Donations"
FROM donation_data
GROUP BY state
ORDER BY "Highest Donations" 
LIMIT 10


-- j) What are the top 10 cars driven by the highest
-- donors
SELECT first_name, last_name, car, donation
FROM donation_data
JOIN donor_data
ON donation_data.id = donor_data.id
ORDER BY donation desc
LIMIT 10

--k) How frequent do our top 10 donors give?

SELECT first_name, last_name,donation, donation_frequency
FROM donation_data
JOIN donor_data
ON donation_data.id = donor_data.id
ORDER BY donation desc
LIMIT 10

-- l)How frequent do our top 10 donors give?

SELECT first_name, last_name,donation, donation_frequency
FROM donation_data
JOIN donor_data
ON donation_data.id = donor_data.id
ORDER BY donation 
LIMIT 10

-- m) What are the t-shirt sizes of top 20 donors?
SELECT first_name, last_name, donation, shirt_size
FROM donation_data
JOIN donor_data
ON donation_data.id = donor_data.id
ORDER BY donation desc
LIMIT 20

-- n) Total amount donated based on donor's favourite color, movie_genre?
SELECT favourite_colour as "Favourite Colour", 
	SUM(donation) AS "Total Donation"
FROM donation_data
JOIN donor_data
USING (ID)
GROUP BY movie_genre
ORDER BY "Total Donation" DESC


-- o) What is the total donation by shirt size?

SELECT shirt_size as "Shirt Size", 
	SUM(donation) AS "Total Donation"
FROM donation_data
GROUP BY shirt_size
ORDER BY "Total Donation" DESC

--p) Total amount donated based on donor's favourite color, movie_genre?
SELECT movie_genre As "Movie Genre",
		SUM(donation) AS "Total Donation"
FROM donation_data
JOIN donor_data
USING (ID)
GROUP BY movie_genre
ORDER BY "Total Donation" DESC
LIMIT 10

--q) Total Number of Donors in Database?
SELECT DISTINCT COUNT(ID)
FROM donor_data
Recommendations to increase the number of donors.

--p) Total amount donated based on education (university attended or not)?
SELECT university As "University",
		SUM(donation) AS "Total Donation"
FROM donation_data
JOIN donor_data
USING (ID)
GROUP BY university
HAVING university = null
ORDER BY "Total Donation" DESC
LIMIT 10

1. Send a thank you email to all donors.
2. Publicity in Illinois, District of Columbia, Tennessee, Georgia and Ohio. These are the bottom 5 states
in our highest donations bracket.
3. There is an opportunity to change the donation_frequency "Never" to monthly.
4. Existing data shows that donors who did not attend university are extremly generous towards the charity program. 
