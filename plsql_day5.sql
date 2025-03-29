set serveroutput on;

/*
create or replace procedure [name]
    [in | out |in out]

begin
    <procedure body>

end procedure_name
*/
create procedure message
as
begin 
    dbms_output.put_line("hello user");
end;

execute message;
/
SELECT owner, object_name, status
FROM all_objects
WHERE object_name = 'MESSAGE';

ALTER PROCEDURE message COMPILE;
SHOW ERRORS PROCEDURE message_proc;

DROP PROCEDURE message;

CREATE OR REPLACE PROCEDURE message_proc  -- Use a unique name
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello user');
END;
/
SET SERVEROUTPUT ON;
EXEC message_proc;


DECLARE
    x INT;
    y INT;

PROCEDURE addNo(a IN INT, b IN INT) IS
    c INT;  
BEGIN
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('value of procedure' || ' ' || c);
END;  

BEGIN  -- Main execution block
    x := 10;
    y := 20;
    
    -- Call the procedure
    addNo(5, 10);  
    
    -- Display the value of x
    DBMS_OUTPUT.PUT_LINE('value is' || ' ' || x);
END;
/

DECLARE
    x INT;
    y INT;

PROCEDURE addNo(a IN INT, b IN INT) IS
    c INT;
BEGIN
    c := a + b;
    DBMS_OUTPUT.PUT_LINE('value of procedure' || ' ' || c);
END; 

BEGIN  -- Main execution block
    x := 10;
    y := 20;
    
    -- Call the procedure
    addNo(x, y);  
    
    -- Display the value of x
    DBMS_OUTPUT.PUT_LINE('value is' || ' ' || x);
END;
/

DECLARE
    x INT;
    y INT;
     c INT;output int; 

PROCEDURE addNo(a IN INT, b IN INT,z out int) IS

BEGIN
    z := a + b;
    DBMS_OUTPUT.PUT_LINE('value of procedure' || ' ' || z);
END;  -- Properly end the procedure

BEGIN  -- Main execution block
    x := 10;
    y := 20;
    DBMS_OUTPUT.PUT_LINE(' before value is' || ' ' || output);
    addNo(x,y,output);  
    DBMS_OUTPUT.PUT_LINE('value is' || ' ' || output);
END;
/

DECLARE
    x INT := 10;   -- Declare and initialize variables
    y INT := 20;

PROCEDURE addNo(a IN INT, b IN OUT INT) IS
BEGIN
    b := a + b;  -- Modify the IN OUT parameter
    DBMS_OUTPUT.PUT_LINE('Value inside procedure: ' || b);
END;  -- End the procedure

BEGIN  
    DBMS_OUTPUT.PUT_LINE('Before procedure call: ' || y);

    -- Call the procedure with IN OUT parameter
    addNo(x, y);  
    
    -- `y` is modified by the procedure
    DBMS_OUTPUT.PUT_LINE('After procedure call: ' || y);
END;
/

-- FUNCTION
-- Create a function to square a number
CREATE OR REPLACE FUNCTION square_num(n IN NUMBER)  
RETURN NUMBER  
IS  
BEGIN  
    RETURN n * n;  
END;  
/
-- Use the function in a subquery
DECLARE  
    result NUMBER;  
BEGIN  
    SELECT (SELECT square_num(5) FROM dual)  -- Subquery using the function  
    INTO result  
    FROM dual;  

    DBMS_OUTPUT.PUT_LINE('Square of 5: ' || result);  
END;  
/

create or replace function message2
return int as
begin 
    dbms_output.put_line('hello user');
    return 10;
end;
/
-- CALL A FUNCTION
declare
    c int;
begin
    c:=message2();
    dbms_output.put_line(c);
end;


-- create a function to find the total no. of records
CREATE OR REPLACE FUNCTION count_emp_records
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    -- Count the number of records in the table
    SELECT COUNT(*) INTO v_count FROM hr.employees;
    
    RETURN v_count;
END;
/
-- Call the function in a PL/SQL block
DECLARE
    total_records NUMBER;
BEGIN
    -- Call the function and store the result in a variable
    total_records := count_emp_records;

    -- Display the result
    DBMS_OUTPUT.PUT_LINE('Total records in EMP table: ' || total_records);
END;
/





