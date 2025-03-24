--1:get the system date
select sysdate from dual;

--2:get system date and time
select systimestamp from dual;

--3:get current date
SELECT current_date from dual;


4:get the timezone
select dbtimezone from dual;

+00:00: UTC : Corrdinated Universal Time: (UTC) (+5.30 : Day light saving) 

--5:to add the 1 week in the system date
select sysdate,sysdate+7 from dual;


--6:to substract the 1 week in the system date
select sysdate, sysdate-7 from dual;

--7:get hire_date and week afer hire date
select hire_date,hire_date+7 week_after_hire_date from hr.employees

--8: Get system date and 2 hour after system date
SELECT sysdate,sysdate + interval '2' hour as hour_after from dual

--9: Get system date and 2 minutes after system date
select systimestamp,systimestamp + interval '2' minute as minutes_after from dual

--10: Get system date and 2 second after system date
10: select systimestamp,systimestamp + interval '2' second as second_after from dual

--11: extarct year , month, day from hire date
SELECT hire_date,EXTRACT(YEAR from hire_date) years,EXTRACT(MONTH from hire_date) months,EXTRACT(DAY from hire_date)days from hr.EMPLOYEES

--12: Add 4 months in system date
select add_months(sysdate,4) from dual

--13: Get hire_date and last date of hire month 
select hire_date,last_day(hire_date)as last_days from hr.employees

--14: Get the system date and date of next tuesday from system date
select sysdate today,next_day(sysdate,'TUESDAY') next_days from dual

--15: Get years,months,days Difference between hire date and current date
select abs(months_between(hire_date,sysdate)/12) YearsOfExp
,abs(months_between(hire_date,sysdate))MonthsOfExp
,abs (months_between(hire_date,sysdate)*30) DaysOfExp from hr.employees

--16: Get the day of hire date from employees table
select to_char(hire_date,'day') day_of_hire from hr.EMPLOYEES

--17: Get null in dual
select null from dual

--18: Replace Null value of sslary column with 3000
SELECT nvl(salary,3000) from dual

--19: if values is null replace it with 2000 else with 3000
--select nvl2(null,'has_value','no_value') from dual
select nvl2(null,3000,2000) from dual


--20: return first non null value
select coalesce(null,52,20,null) from dual

-- Difference BETWEEN the nvl and coalesce is that we can use multiple column in coalesce
--21: if Hire date has null value it is relaced with system date
select nvl(hire_date,sysdate) from hr.EMPLOYEES

--22: if salary column has null value then show commission if commission has null then 0
select coalesce(SALARY,COMMISSION_PCT,0) as amount from hr.employees