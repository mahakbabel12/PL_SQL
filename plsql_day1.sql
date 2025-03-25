set serveroutput on;

-- print statement
begin 
    dbms_output.put_line('hello world');
end;


-- creating a variable and then using it
declare 
    msg varchar(30) := 'hello mahak How are you';
begin
    dbms_output.put_line(msg);
end;


-- String concatenation
declare 
    msg varchar(30) := 'hello mahak';
begin
    dbms_output.put_line(msg || ' ' || 'hii' );
end;
