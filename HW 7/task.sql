  -- 1 
  CREATE VIEW samsBills AS 
      SELECT T1.first_name, T1.surname, T4.bill_date, T4.cust_name, T4.bill_total
      FROM restStaff T1
      JOIN restBill T4
      ON T1.staff_no = T4.waiter_no
      WHERE T1.first_name = 'Sam' AND T1.surname = 'Pitt';
  
  SELECT * FROM samsBills;
  
  -- 2 
  SELECT * FROM samsBills WHERE bill_total > 400;
  
  -- 3 
  CREATE VIEW roomTotals AS 
      SELECT T2.room_name, SUM(T4.bill_total) AS total_sum
      FROM restRest_table T2
      JOIN restBill T4
      ON T2.table_no = T4.table_no
      GROUP BY T2.room_name;
      
  SELECT * FROM roomTotals;
  
  -- 4 
  CREATE VIEW teamTotals AS 
      SELECT CONCAT(T1.first_name, ' ', T1.surname) AS headwaiter_name, SUM(T4.bill_total) AS total_sum
      FROM restStaff T1
      JOIN restStaff T10
      ON T1.staff_no = T10.headwaiter
      JOIN restBill T4
      ON T10.staff_no = T4.waiter_no
      GROUP BY T1.first_name, T1.surname;
      
  SELECT * FROM teamTotals;
  
  
  
  
  
  
  
  
  
  
  
  