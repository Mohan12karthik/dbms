1.
DECLARE 
	a decimal;
  r integer;
  pi real;
  vol decimal;
  
PROCEDURE area(x  IN number,y IN number,z OUT number)
 IS
 BEGIN       
		z:=4*x*x*y;
 END;
 
PROCEDURE volume(m  IN number,n IN number,k OUT number)
 IS
 BEGIN       
		k:=(4/3)*m*m*m*n;
 END;
 
 
BEGIN 
	r:= 5; 
  pi:=3.14;
  a:=0;
  vol:=0;
	area(r,pi,a);
  volume(r,pi,vol);
 	dbms_output.put_line(' Area of (r): ' || a); 
  dbms_output.put_line(' Volume of (r): ' || vol); 
END;


2.
DECLARE
   a number;
   b number;
   c number;

FUNCTION findProduct(x IN number, y IN number)
RETURN number
IS
    z number;

BEGIN
   z := x*y;
   return z;
END;

BEGIN
   a:= 23;
   b:= 45;
   c := findProduct(a, b);
   dbms_output.put_line('Product of (23,45): ' || c);
END;


3.
DECLARE
	a number;
  b number;
  c number;

PROCEDURE MinMax(x IN number,y IN number, z IN number)
IS
  min number;
  max number;
BEGIN
--largest
    if a>b AND a>c
     then
         dbms_output.put_line('a is greatest');
     else
         if b>a AND b>c
         then
             dbms_output.put_line('b is greatest');
         else
             dbms_output.put_line('c is greatest');
         end if;
    end if;
--smallest
    if a<b AND a<c
     then
         dbms_output.put_line('a is smallest');
     else
         if b<a AND b<c
         then
             dbms_output.put_line('b is smallest');
         else
             dbms_output.put_line('c is smallest');
         end if;
    end if;
END;

BEGIN
	a:= 230;
  b:= 26;
  c:= 45;
	MinMax(a,b,c);
END;


4.
DECLARE
total number;

FUNCTION totalCustomers
RETURN number IS
   total number := 0;
BEGIN
   SELECT count(*) into total
   FROM customers;
   RETURN total;
END;

BEGIN
   total := totalCustomers();
   dbms_output.put_line('Total number of customers: ' || total);
END;
-- can also be done using rowcount


5.
DECLARE
avgr number;

FUNCTION avgSalary
RETURN number IS
   avgr number := 0;
BEGIN
   SELECT AVG(salary) into avgr
   FROM customers;
   RETURN (avgr);
END;

BEGIN
   avgr := avgSalary();
   dbms_output.put_line('Average salary of customers: ' || avgr);
END;


6.
DECLARE
  c_id customers.id%type := 4;
  c_name customers.name%type;
  c_addr customers.address%type;
  c_age customers.age%type;
  c_salary customers.salary%type;
  CURSOR cur_cus
  IS
  SELECT * FROM customers;
BEGIN
  OPEN cur_cus;
  LOOP
    FETCH cur_cus INTO c_id, c_name, c_age, c_addr, c_salary;

    EXIT WHEN cur_cus%notfound;

    IF c_age >= 20 AND c_age <= 25 THEN
      UPDATE customers
      SET salary = salary + 100
      WHERE id = c_id;
    elsif c_age >= 26 AND c_age <= 30 THEN
      UPDATE customers
      SET salary = salary + 200
      WHERE id = c_id;
    END IF;

  END LOOP;
  CLOSE cur_cus;
END;



7.
DECLARE
cnt number := 0;
  c_id customers.id%type;
  c_name customers.name%type;
  c_addr customers.address%type;
  c_age customers.age%type;
  c_salary customers.salary%type;
  CURSOR cur_cus
  IS
  SELECT * FROM customers;
BEGIN
  OPEN cur_cus;
  LOOP
    FETCH cur_cus INTO c_id, c_name, c_age, c_addr, c_salary;

    EXIT WHEN cur_cus%notfound;

    IF c_age > 25 THEN
      cnt := cnt + 1;
    END IF;

  END LOOP;
  dbms_output.put_line('Number of customers above 25 years : '|| cnt);
  CLOSE cur_cus;
END;


-- insert into customers values(2, 'khilan', 25, 'delhi', 1500)\\
-- insert into customers values(3, 'kaushik', 23, 'kota', 2000)\\
-- insert into customers values(4, 'chaitali', 25, 'mumbai', 6500)\\
-- insert into customers values(5, 'hardik', 27, 'bhopal', 8500)\\
-- insert into customers values(6, 'komal', 22, 'mp', 4500)\\
-- insert into customers values(7, 'kamal', 23, 'mp', 7500)\\
-- insert into customers values(8, 'kamat', 21, 'mp', 9500)\\
--
-- select * from customers\\
