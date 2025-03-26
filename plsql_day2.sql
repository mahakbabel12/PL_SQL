SET SERVEROUTPUT ON;

-- OPERATOR (MATHECATICAL OPERATION)
DECLARE
    var1 VARCHAR(20) := 'hey';
    a INT := 10;
    b INT := 20;
    c INT;
    d CONSTANT INT := 19;   -- constant, can't be modified

BEGIN
    c := a + b;
    
    -- Removed constant reassignment
    dbms_output.put_line(var1 || ' ' || c);
END;


-- IF ELSE CONDITION
-- IF ELSE CONDITION
DECLARE
    var1 VARCHAR(20) := 'hey';   -- Declare variables
    a INT := 10; 

BEGIN
    dbms_output.put_line(var1 || ' ' || a);  
    
    IF (a > 15) THEN
        dbms_output.put_line('a is greater than 15');
    
    ELSIF (a = 10) THEN   -- Correct syntax: ELSIF
        dbms_output.put_line('a is equal to 10');
    
    ELSE 
        dbms_output.put_line('hello');
    END IF;               

END;    


-- CASE STATEMENT
DECLARE
    grade CHAR(1) := 'B';
BEGIN
    CASE grade
        WHEN 'A' THEN
            DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B' THEN
            DBMS_OUTPUT.PUT_LINE('Good');
        WHEN 'C' THEN
            DBMS_OUTPUT.PUT_LINE('Average');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Fail');
    END CASE;
END;

-- EXAMPLE2
DECLARE
    salary NUMBER := 6000;
BEGIN
    CASE 
        WHEN salary < 3000 THEN
            DBMS_OUTPUT.PUT_LINE('Low salary');
        WHEN salary BETWEEN 3000 AND 7000 THEN
            DBMS_OUTPUT.PUT_LINE('Average salary');
        WHEN salary > 7000 THEN
            DBMS_OUTPUT.PUT_LINE('High salary');
        ELSE
            DBMS_OUTPUT.PUT_LINE('No data');
    END CASE;
END;


-- LOOPS
--In PL/SQL, loops are used to execute a block of code repeatedly until a certain condition is met.
--There are three types of loops in PL/SQL:

--Basic/Infinite LOOP
--WHILE Loop
--FOR Loop

-- 1.Basic/Infinite LOOP
-- This is an infinite loop that runs continuously until you use the EXIT or EXIT WHEN statement to stop it.

-- SYNTAX
--LOOP
--    -- Code to execute
--    EXIT;           -- Terminates the loop
--END LOOP;


DECLARE
    a INT := 10;                   -- Declare variable `a`
BEGIN
    LOOP 
        dbms_output.put_line(a);   -- Print the value of `a`
        
        a := a + 1;                -- Increment `a`

        IF (a > 13) THEN           -- Exit condition
            EXIT;
        END IF;
    END LOOP;                      -- Add semicolon here
END; 

-- OR

DECLARE
    a INT := 10;                   -- Declare variable `a`
BEGIN
    LOOP 
        dbms_output.put_line(a);   -- Print the value of `a`
        
        a := a + 1;                -- Increment `a`

        exit when a>13;
    END LOOP;                      -- Add semicolon here
END; 


-- 2. WHILE Loop
--The WHILE loop checks the condition before executing the block of code.
--The loop will continue running as long as the condition is TRUE.

-- SYNTAX
--WHILE condition LOOP
--    -- Code to execute
--END LOOP;

DECLARE
    num INT := 1;
BEGIN
    WHILE num <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || num);
        num := num + 1;
    END LOOP;
END;


--3. FOR Loop
--The FOR loop automatically iterates a specific number of times.

-- SYNTAX
--FOR counter_variable IN start_value..end_value LOOP
--    -- Code to execute
--END LOOP;


BEGIN
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;