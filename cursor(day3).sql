SET SERVEROUTPUT ON;

declare
    v_count int:=0;
    
begin 
    if SQL%FOUND THEN
        dbms_output.put_line('cursor open');
    select count(*) into v_count from test where id>10;
   end if;
   
end;
/
declare
    v_count int:=0;
    
begin 
    if SQL%FOUND THEN
        dbms_output.put_line('cursor open 1'|| ' ' || sql%rowcount);
    end if;
    update test set id =50;
    if SQL%FOUND THEN
        dbms_output.put_line('cursor open 2' || ' ' || sql%rowcount);
   end if;
   
end;
/


insert into test values(12);
insert into test values(13);
insert into test values(14);

select * from test;

