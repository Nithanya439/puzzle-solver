-- Create table for users
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

-- Create table for tests
CREATE TABLE tests (
    test_id INT PRIMARY KEY,
    subject VARCHAR(50),
    date DATE
);

-- Create table for test attempts
CREATE TABLE test_attempts (
    attempt_id INT PRIMARY KEY,
    user_id INT,
    test_id INT,
    score INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (test_id) REFERENCES tests(test_id)
);

-- Example query: Average score per user
SELECT u.name, AVG(t.score) AS average_score
FROM users u
JOIN test_attempts t ON u.user_id = t.user_id
GROUP BY u.name;

-- Example query: Score variance by subject
SELECT tests.subject, STDDEV(test_attempts.score) AS score_variance
FROM test_attempts
JOIN tests ON test_attempts.test_id = tests.test_id
GROUP BY tests.subject;
