
-- Anthony Barrows SQL Exploration
-- 2022-03-14

-- Load data
CREATE TABLE IF NOT EXISTS voter_exercise (
    first_name VARCHAR,
    gender VARCHAR,
    state VARCHAR,
    dob DATE,
    first_time_seen DATE,
    voter_score VARCHAR,
    synthetic VARCHAR
);


COPY voter_exercise
FROM '/Users/tony/Desktop/SQL_exploration_sample_data_Spring_2021.csv'
DELIMITER ',' CSV NULL '(null)' HEADER;

-- View
-- SELECT * FROM voter_exercise;

-- Which states are covered?

SELECT state, COUNT(first_name) AS individuals
    INTO TEMPORARY TABLE tmp1
    FROM voter_exercise 
    WHERE state IS NOT NULL
    GROUP BY state;

-- Average age by state

SELECT state, ROUND(AVG(EXTRACT(YEAR FROM AGE(dob))), 2) AS avg_age
    INTO TEMPORARY TABLE tmp2
	FROM voter_exercise
    WHERE state IS NOT NULL
    GROUP BY state;
    
-- Recency by state

SELECT state, max(first_time_seen) AS recency
	INTO TEMPORARY TABLE tmp3
    FROM voter_exercise
    WHERE state IS NOT NULL
    GROUP BY state;
    
-- Vote turnout summary

WITH turnout AS (SELECT state,
		CASE WHEN synthetic IN ('Y', 'A', 'E') THEN 'Voted'
			ELSE 'Didnt Vote'
        END AS voter_outcome,
        COUNT(*) as n
	FROM voter_exercise
    WHERE state IS NOT NULL AND synthetic IS NOT NULL
    GROUP BY state, voter_outcome),
turnout_pct AS (SELECT state, voter_outcome, n,
	ROUND(n /(sum(n) OVER (PARTITION BY state)) * 100, 2) as percent_voted
    FROM turnout
    ORDER BY state)
SELECT state, percent_voted
INTO TEMPORARY TABLE tmp4
FROM turnout_pct
WHERE voter_outcome = 'Voted';


-- Join

SELECT *
	INTO TEMPORARY TABLE out
	FROM tmp1
	JOIN tmp2 USING(state)
	JOIN tmp3 USING(state)
	JOIN tmp4 USING(state);

COPY out
TO '/Users/tony/Desktop/voter_exercise_client_results.csv'
DELIMITER ',' CSV NULL 'missing' HEADER;


-- Missing

SELECT state, count(*)
	FROM voter_exercise
    WHERE synthetic IS NULL
	GROUP BY state;
