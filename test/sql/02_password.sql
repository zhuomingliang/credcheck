LOAD 'credcheck';
--
--reset all settings
--
SET credcheck.username_min_length TO DEFAULT;
SET credcheck.username_min_special TO DEFAULT;
SET credcheck.username_min_upper TO DEFAULT;
SET credcheck.username_min_upper TO DEFAULT;
SET credcheck.username_min_digit TO DEFAULT;
SET credcheck.username_contain_password TO DEFAULT;
SET credcheck.username_ignore_case TO DEFAULT;
SET credcheck.username_contain TO DEFAULT;
SET credcheck.username_not_contain TO DEFAULT;
SET credcheck.username_min_repeat TO DEFAULT;
SET credcheck.password_min_length TO DEFAULT;
SET credcheck.password_min_special TO DEFAULT;
SET credcheck.password_min_upper TO DEFAULT;
SET credcheck.password_min_upper TO DEFAULT;
SET credcheck.password_min_digit TO DEFAULT;
SET credcheck.password_contain_username TO DEFAULT;
SET credcheck.password_ignore_case TO DEFAULT;
SET credcheck.password_contain TO DEFAULT;
SET credcheck.password_not_contain TO DEFAULT;
SET credcheck.password_min_repeat TO DEFAULT;
--password checks
--
--length must be >=2
--
SET credcheck.password_min_length TO 2;
DROP USER IF EXISTS aa;
CREATE USER aa WITH PASSWORD 'd';
CREATE USER aa WITH PASSWORD 'dd';
DROP USER IF EXISTS aa;

--
--min special >= 1
--
SET credcheck.password_min_special TO 1;
DROP USER IF EXISTS aa;
CREATE USER aa WITH PASSWORD 'aa';
CREATE USER aa WITH PASSWORD 'a$';
DROP USER IF EXISTS aa;
--
--min upper >=1
--
SET credcheck.password_min_upper TO 1;
DROP USER IF EXISTS "aa";
CREATE USER "aa" WITH PASSWORD 'aa$';
CREATE USER "aa" WITH PASSWORD 'aA$';
DROP USER IF EXISTS "aa";
--
--min lower >=2
--
SET credcheck.password_min_lower TO 1;
DROP USER IF EXISTS "aa";
CREATE USER "aa" WITH PASSWORD 'AA$';
CREATE USER "aa" WITH PASSWORD 'aA$';
DROP USER IF EXISTS "aa";
--
--must contain one of the characters 'a','b','c'
--
SET credcheck.password_contain TO 'a,b,c';
DROP USER IF EXISTS "aa";
CREATE USER "aa" WITH PASSWORD 'dddU$';
CREATE USER "aa" WITH PASSWORD 'ddaU$';
DROP USER IF EXISTS "aa";
--
--must not contain one of the characters 'x','z'
--
SET credcheck.password_not_contain TO 'x,z';
DROP USER IF EXISTS "aa";
CREATE USER "aa" WITH PASSWORD 'Ax$';
CREATE USER "aa" WITH PASSWORD 'Ab$';
DROP USER IF EXISTS "aa";
--
--passord contain username
--
SET credcheck.password_contain_username TO on;
DROP USER IF EXISTS "aa";
CREATE USER "aa" WITH PASSWORD 'aa$';
CREATE USER "aa" WITH PASSWORD 'Ab$';
DROP USER IF EXISTS "aa";
--
--ignore case while performing checks
--
SET credcheck.password_ignore_case TO on;
DROP USER IF EXISTS "aa";
CREATE USER "aa" WITH PASSWORD 'random_AA$';
DROP USER IF EXISTS "aa";
--
--min digit >=1
--
SET credcheck.password_min_digit TO 1;
DROP USER IF EXISTS aa;
CREATE USER aa WITH PASSWORD 'a@a';
CREATE USER aa WITH PASSWORD 'a@1';
DROP USER IF EXISTS aa;
--
--min password repeat 2
--
SET credcheck.password_min_repeat TO 2;
DROP USER IF EXISTS aa;
CREATE USER aa WITH PASSWORD '1a@bbb';
CREATE USER aa WITH PASSWORD '1a@a';
DROP USER IF EXISTS aa;
--
-- Check NULL password
--
CREATE USER aa WITH PASSWORD '1a@bcg';
ALTER USER aa PASSWORD NULL;
DROP USER IF EXISTS aa;
CREATE USER aa PASSWORD NULL;
DROP USER IF EXISTS aa;
--
-- Check whitlisted users
SET credcheck.password_min_repeat TO 2;
SET credcheck.whitelist = 'nocheck1,nocheck2';
DROP USER IF EXISTS nocheck1;
CREATE USER nocheck1 WITH PASSWORD 'aaaa';
DROP USER IF EXISTS nocheck1;
CREATE USER nocheck1;
DROP USER IF EXISTS nocheck2;
CREATE USER nocheck2 WITH PASSWORD 'aaaa';
ALTER USER nocheck2 WITH PASSWORD 'bbbb';
DROP USER IF EXISTS nocheck1;
DROP USER IF EXISTS nocheck2;


