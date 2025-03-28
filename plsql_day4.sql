set serveroutput on;

-- making a EXPLICIT cursor

DECLARE 
    CURSOR emp_cur IS 
        SELECT * FROM hr.employees;    -- Cursor declaration
    emp_record emp_cur%ROWTYPE;         -- Use cursor name for %ROWTYPE
BEGIN
    OPEN emp_cur;
    
    -- Initial fetch before the loop
    FETCH emp_cur INTO emp_record;
    
    WHILE emp_cur%FOUND 
    LOOP
        -- Display employee name
        DBMS_OUTPUT.PUT_LINE('Ename: ' || emp_record.first_name ||' '|| emp_record.last_name);
        FETCH emp_cur INTO emp_record;
    END LOOP;
    
    CLOSE emp_cur;
END;
/

-- FOR LOOP

set serveroutput on;

-- making a EXPLICIT cursor

DECLARE 
    CURSOR emp_cur IS 
        SELECT * FROM hr.employees;    -- Cursor declaration
    emp_record emp_cur%ROWTYPE;         -- Use cursor name for %ROWTYPE
BEGIN
    
    for emp_record in emp_cur
    LOOP
        DBMS_OUTPUT.PUT_LINE('Ename: ' || emp_record.first_name ||' '|| emp_record.last_name);
    END LOOP;
END;
/

select * from hr.employees;

-- QUES
BEGIN
    FOR emp_record IN (SELECT * FROM hr.employees)
    LOOP
        IF emp_record.employee_id = 16 OR emp_record.employee_id = 19 THEN
            DBMS_OUTPUT.PUT_LINE(emp_record.salary * 0.10);
        ELSE
            DBMS_OUTPUT.PUT_LINE(emp_record.first_name ||' '||emp_record.salary);
        END IF;
    END LOOP;
END;
/

-- ROW ID
DECLARE 
    CURSOR emp_cur IS 
        SELECT rowid , first_name FROM hr.employees;    -- Cursor declaration
    emp_record emp_cur%ROWTYPE;         -- Use cursor name for %ROWTYPE
BEGIN
    
    for emp_record in emp_cur
    LOOP
        DBMS_OUTPUT.PUT_LINE('Ename: ' || emp_record.first_name ||' '|| emp_record.rowid);
    END LOOP;
END;
/

DECLARE
    CURSOR emp_cur IS
        SELECT ROWID AS row_id, salary
        FROM hr.employees
        WHERE job_id = 'SA_REP'; -- Targeting employees with the job title 'Sales Representative'
    v_row_id UROWID;
    v_salary NUMBER;
BEGIN
    OPEN emp_cur;
    LOOP
        FETCH emp_cur INTO v_row_id, v_salary;
        EXIT WHEN emp_cur%NOTFOUND;
        UPDATE hr.employees
        SET salary = v_salary * 1.10 -- Increasing salary by 10%
        WHERE ROWID = v_row_id;
    END LOOP;
    CLOSE emp_cur;
    COMMIT; -- Committing the transaction to save changes
END;
/

-- REF CURSOR
DECLARE
    -- Step 1: Define a REF CURSOR type
    TYPE emp_ref_cursor IS REF CURSOR;

    -- Step 2: Declare a REF CURSOR variable
    emp_cur emp_ref_cursor;

    -- Step 3: Declare variables to store fetched data
    emp_name VARCHAR2(50);
    emp_rowid ROWID;
BEGIN
    -- Step 4: Open REF CURSOR with a query
    OPEN emp_cur FOR 
        SELECT first_name, ROWID AS row_id FROM hr.employees;

    -- Step 5: Fetch and Display Data
    LOOP
        FETCH emp_cur INTO emp_name, emp_rowid;
        EXIT WHEN emp_cur%NOTFOUND;  -- Stop when no more data

        -- Step 6: Print output
        DBMS_OUTPUT.PUT_LINE('Ename: ' || emp_name || ' : ROWID -> ' || emp_rowid);
    END LOOP;

    -- Step 7: Close REF CURSOR
    CLOSE emp_cur;
END;
/

