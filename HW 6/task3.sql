-- 1
SELECT DISTINCT restStaff.first_name, restStaff.surname
FROM restStaff
INNER JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
WHERE restBill.cust_name = 'Tanya Singh';

-- 2
SELECT room_date
FROM restRoom_management T1
INNER JOIN restStaff T2
ON T1.headwaiter = T2.staff_no
WHERE first_name = 'Charles' AND room_date BETWEEN 160201 AND 160229 AND room_name = 'Green'; 

-- 3
SELECT T1.first_name, T1.surname
FROM restStaff T1
INNER JOIN restStaff T2
ON T1.headwaiter = T2.headwaiter
WHERE T2.first_name = 'Zoe' AND T2.surname = 'Ball' AND T1.staff_no != T2.staff_no;

-- 4
SELECT T1.cust_name, T1.bill_total, T2.first_name, T2.surname
FROM restBill T1
INNER JOIN restStaff T2
ON T1.waiter_no = T2.staff_no;

-- 5
SELECT DISTINCT T1.first_name, T1.surname
FROM restBill T2
INNER JOIN restBill T3
ON T2.waiter_no = T3.waiter_no
INNER JOIN restStaff T1 
ON T2.waiter_no = T1.staff_no
WHERE T3.bill_no IN (00014, 00017);

-- 6
SELECT DISTINCT T1.first_name, T1.surname
FROM restStaff T1
INNER JOIN restBill T2
ON T1.staff_no = T2.waiter_no
INNER JOIN restRest_table T3
ON T2.table_no = T3.table_no
INNER JOIN restRoom_management T4
ON T3.room_name = T4.room_name
WHERE T4.room_name = 'Blue' AND T4.room_date = 160312

UNION 

SELECT T1.first_name, T1.surname
FROM restStaff T1
INNER JOIN restRoom_management T4
ON T1.staff_no = T4.headwaiter
WHERE T4.room_name = 'Blue' AND T4.room_date = 160312;


