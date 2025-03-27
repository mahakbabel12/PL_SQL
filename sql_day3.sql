set serveroutput on;


DECLARE 
    eid INT := 102;
    v_name hr.employees.first_name%TYPE;
BEGIN
    SELECT first_name INTO v_name 
    FROM hr.employees 
    WHERE employee_id = eid;

    DBMS_OUTPUT.PUT_LINE(eid || ' ' || v_name);
END;


DECLARE 
    eid INT := 102;
    v_name hr.employees.first_name%TYPE;
    emp_rec hr.employees%rowtype;
BEGIN
    SELECT * INTO emp_rec 
    FROM hr.employees 
    WHERE employee_id = eid;

    DBMS_OUTPUT.PUT_LINE(eid || ' ' || emp_rec.last_name);
END;
/
-- create table
create table test(id int);
insert into test values(10);
insert into test values(20);
insert into test values(30);

select * from test;


