USE bank;
SELECT *
	FROM client;
    
-- Query 1
-- Get the id values of the first 5 clients from district_id with a value equals to 1.
 
SELECT client_id
	FROM client
     WHERE district_id = "1"
     LIMIT 5;
    
    
-- Query 2
-- In the client table, get an id value of the last client where the district_id equals to 72.

SELECT client_id
	FROM client
     WHERE district_id = "72"
     ORDER BY client_id desc
     LIMIT 1;

-- Query 3
-- Get the 3 lowest amounts in the loan table.
SELECT *
	FROM loan;


SELECT amount
	FROM loan
    ORDER BY amount ASC 
	LIMIT 3;



-- Query 4
-- What are the possible values for status, ordered alphabetically in ascending order in the loan table?
SELECT *
	FROM loan;

SELECT status
	FROM loan 
    GROUP BY status
    ORDER BY status asc;


-- Query 5
-- What is the loan_id of the highest payment received in the loan table?
SELECT *
	FROM loan;

SELECT loan_id, amount 
	FROM loan 
    GROUP BY loan_id
    ORDER BY amount desc
    LIMIT 1;

-- Query 6
-- What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
SELECT *
	FROM loan;
    
SELECT account_id, amount 
	FROM loan 
    GROUP BY amount 
    ORDER BY account_id asc
    LIMIT 5; 

-- Query 7
-- What are the account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?

SELECT *
	FROM loan;
    
SELECT account_id, amount, duration 
	FROM loan 
    WHERE duration = 60
    ORDER BY amount asc
    LIMIT 5; 

-- Query 8
-- What are the unique values of k_symbol in the order table?
-- Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause. You have to use backticks to escape the order table name

SELECT *
	FROM `order`;
    
SELECT k_symbol
	FROM `order`
	GROUP BY k_symbol; 


-- Query 9
-- In the order table, what are the order_ids of the client with the account_id 34?

SELECT *
	FROM `order`;

SELECT order_id
	FROM `order`
    Where account_id = 34;


-- Query 10
-- In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
SELECT *
	FROM `order`;

SELECT account_id
	FROM `order`
    WHERE order_id
    BETWEEN 29540 and 29560
	GROUP BY account_id ;


-- Query 11
-- In the order table, what are the individual amounts that were sent to (account_to) id 30067122?

SELECT *
	FROM `order`;

SELECT amount
	FROM `order`
    Where account_to = 30067122;

-- Query 12
-- In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.

SELECT *
	FROM trans;
    
SELECT trans_id, date, type, amount
	FROM trans
    WHERE account_id = 793
    ORDER BY date desc
    LIMIT 10;
    

-- Query 13
-- In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order.
    
SELECT *
	FROM client;

SELECT district_id, COUNT(client_id)
	FROM client
    WHERE district_id < 10
    GROUP by district_id
    ORDER by district_id asc; 
    
    

-- Query 14
-- In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.

SELECT *
	FROM card;
    
SELECT type, count(type) as COUNT
	FROM card
    GROUP BY type
    ORDER BY COUNT desc;


-- Query 15
-- Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
SELECT *
	FROM loan;

SELECT account_id, sum(amount) as Total
	FROM loan
    GROUP by amount 
    ORDER by Total desc
    LIMIT 10;

-- Query 16
-- In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.

SELECT *
	FROM loan;

SELECT date, count(date)
	FROM loan
    WHERE date < 930907
    GROUP BY date
    ORDER BY date desc;

-- Query 17
-- In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.

SELECT *
	FROM loan;

SELECT date, duration, count(*)
	FROM loan
    WHERE date 
    BETWEEN 971200 and 980100
    GROUP by date, duration
    ORDER BY date and duration asc;

SELECT date, count(date)
	FROM loan
    WHERE date < 930907
    GROUP BY date
    ORDER BY date desc;

-- Query 18
-- In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.

SELECT *
	FROM trans;

SELECT account_id, operation, round(sum(amount)) as total_amount
	FROM trans
    WHERE account_id = 396
    AND TYPE in ("VYDAJ", "PRIJEM")
    GROUP BY type