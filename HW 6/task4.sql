    -- 1
    SELECT T4.cust_name
    FROM restBill T4
    WHERE T4.bill_total > 450.00
    AND T4.waiter_no IN (
      SELECT T1.staff_no
      FROM restStaff T1
      INNER JOIN restRoom_management T3
      ON T1.staff_no = T3.headwaiter
      WHERE T1.first_name = 'Charles'
    );
    
    -- 2
    SELECT T1.first_name, T1.surname
    FROM restStaff T1
    WHERE staff_no IN (
        SELECT T3.headwaiter
        FROM restRoom_management T3
        INNER JOIN restRest_table T2
        ON T3.room_name = T2.room_name
        INNER JOIN restBill T4
        ON T2.table_no = T4.table_no
        WHERE T4.cust_name = 'Nerida Smith' AND T4.bill_date = 160111
        
    );
    
    -- 3
    SELECT T4.cust_name
    FROM restBill T4
    WHERE bill_total IN(
        SELECT MIN(bill_total)
        FROM restBill
    );
    
    -- 4
    SELECT T1.first_name, T1.surname
    FROM restStaff T1
    WHERE T1.staff_no NOT IN (
        SELECT T4.waiter_no
        FROM restBill T4
    );
    
    -- 5
    SELECT T4.cust_name, 
           T1.first_name, 
           T1.surname, 
           T3.room_name
    FROM restBill T4
    INNER JOIN restRest_table T2 
    ON T4.table_no = T2.table_no
    INNER JOIN restRoom_management T3 
    ON T2.room_name = T3.room_name AND T4.bill_date = T3.room_date
    INNER JOIN restStaff T1 
    ON T3.headwaiter = T1.staff_no
    WHERE T4.bill_total = (
        SELECT MAX(bill_total)
        FROM restBill
    );