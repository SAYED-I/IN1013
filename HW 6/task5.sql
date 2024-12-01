-- 1 
SELECT T1.first_name, T1.surname, T4.bill_date, COUNT(T4.bill_no)
FROM restStaff T1
INNER JOIN restBill T4
ON T1.staff_no = T4.waiter_no
GROUP BY T1.staff_no, T4.bill_date
HAVING COUNT(T4.bill_no) >= 2;

-- 2
SELECT room_name, COUNT(*) AS num_tables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3
SELECT T2.room_name, Sum(T4.bill_total)
FROM restRest_table T2
INNER JOIN restBill T4
ON T2.table_no = T4.table_no
GROUP BY T2.room_name;

-- 4 
SELECT T1.first_name, T1.surname, SUM(T4.bill_total)
FROM restStaff T1
INNER restStaff T11
ON T1.staff_no = T11.headwaiter
INNER JOIN restBill T4
ON T11.staff_no = T4.waiter_no
GROUP BY T1.first_name, T1.surname
ORDER BY bill_total DESC;

-- 5 
SELECT T4.cust_name, AVG(T4.bill_total)
FROM restBill T4
GROUP BY T4.cust_name
HAVING AVG(T4.bill_total) > 400;

-- 6
SELECT T1.first_name, T1.surname, COUNT(bill_no)
FROM restStaff T1
INNER JOIN restBill T4
ON T1.staff_no = T4.waiter_no
GROUP BY T1.staff_no, T4.bill_date
HAVING COUNT(bill_no) >= 3;