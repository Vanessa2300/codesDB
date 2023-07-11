CREATE TABLE Client_master (client_no varchar(10) primary key CHECK (client_no LIKE 'C%') , name char(20) NOT NULL ,address1 varchar(20) ,address2 varchar(20) ,city char(20) ,pincode number(10) ,state char(20) ,bal_due number(9,4));

INSERT INTO Client_master VALUES('C00001', 'Manish','a11','', 'Pune',  411001, 'Maharashtra', 25500);
INSERT INTO Client_master VALUES('C00002', 'Arjun', 'b12','', 'Chennai', 780041, 'Tamilnadu', 600);
INSERT INTO Client_master VALUES('C00003', 'Reena','c13','', 'Bombay', 400057, 'Maharashtra', 3000);
INSERT INTO Client_master VALUES('C00004', 'Kiran','d14','', 'Bombay', 400056, 'Maharashtra', 5000);
INSERT INTO Client_master VALUES('C00005', 'Bhushan', 'e15','', 'Delhi',100001, ' Delhi', 10000);
INSERT INTO Client_master VALUES('C00006', 'Ronak','f16','', 'Bombay',  400050, 'Maharashtra', 800);
INSERT INTO Client_master VALUES('C00007', 'Tina','g17','', 'Agra',  402938, 'Uttar Pradesh', 10700);
INSERT INTO Client_master VALUES('C00008', 'Riya','h18','', 'Pune',  411001, 'Maharashtra', 5500);
INSERT INTO Client_master VALUES('C00009', 'Rohit','i19','', 'Chennai',  780041, 'Tamilnadu', 20000);
INSERT INTO Client_master VALUES('C000010', 'Ajay','f16','', 'Pune',  411001, 'Maharashtra', 8000);

CREATE TABLE Product_master (product_no varchar2(6) primary key CHECK (product_no LIKE 'P%'),description varchar2(20),profit_percent number(5,2),unit_measure varchar2(8),qty_on_hand number(6),reoder_lvl number(6),sell_price number(10),cost_price number(10));

INSERT INTO Product_master VALUES ('P1', 'Mouse', 5, 'piece', 100, 30, 525, 500);
INSERT INTO Product_master VALUES ('P2', 'Keyboards', 4, 'piece', 50, 50, 2500, 2000);
INSERT INTO Product_master VALUES ('P3', 'RAM', 7, 'piece', 100, 80, 4500, 4000);
INSERT INTO Product_master VALUES ('P4', 'PC', 2.5, 'piece', 70, 20, 10000, 9000);
INSERT INTO Product_master VALUES ('P5', 'HDD', 5, 'piece', 65, 30, 600, 550);


CREATE TABLE Salesman_master (salesman_no varchar(10) primary key CHECK (salesman_no LIKE 'S%'), salesman_name char(20) NOT NULL, address1 varchar(20) ,address2 varchar(20) ,city char(20) ,pincode number(10) ,state char(20), sal_amt number(8,4), tgt_to_get number(5), ytd_sales number(10,4) , remarks varchar(30));

INSERT INTO Salesman_master VALUES ('S01', 'Ranveer', 'Mumbai', '', 'Mumbai', '400050', 'Maharashtra', 5000, 4000, 240000.00, 'Target achieved');
INSERT INTO Salesman_master VALUES ('S02', 'Tanvi', 'Camp', '', 'Pune', '400001', 'Maharashtra', 1000, 2000, 100000.00, 'Target not achieved');
INSERT INTO Salesman_master VALUES ('S03', 'Mahesh', '', '', 'Bhubaneshwar', '400001', 'Odisha', 750, 500, 300000.00, 'Target achieved');

CREATE TABLE Sales_order 
    (order_no VARCHAR(5) PRIMARY KEY CHECK (order_no LIKE 'O%') NOT NULL, 
    order_date DATE, 
    client_no VARCHAR(7) REFERENCES Client_master(client_no) NOT NULL, 
    dely_addr VARCHAR(10), 
    salesman_no VARCHAR(20) REFERENCES Salesman_master(salesman_no) NOT NULL, 
    dely_type CHAR(1) DEFAULT 'F' CHECK (dely_type IN ('P', 'F')),
    billed_yn CHAR(1),
    dely_date DATE, 
    order_status VARCHAR(10) CHECK (order_status IN ('In Process', 'Fulfilled', 'BackOrder', 'Cancelled')),
    CONSTRAINT chk_dely_date CHECK (dely_date > order_date));


INSERT INTO Sales_order VALUES ('O001', '4-MAY-23', 'C00005', 'Delhi', 'S01', 'P', 'Y', '5-MAY-23', 'Fulfilled');
INSERT INTO Sales_order VALUES ('O002', '2-MAY-23', 'C00004', 'Bombay', 'S03', 'F', 'Y', '5-MAY-23', 'Cancelled');
INSERT INTO Sales_order VALUES ('O003', '8-MAY-23', 'C00003', 'Bombay', 'S03', 'P', 'N', '10-MAY-23', 'BackOrder');
INSERT INTO Sales_order VALUES ('O004', '5-MAY-23', 'C00002', 'Chennai', 'S02', 'F', 'Y', '8-MAY-23', 'Fulfilled');
INSERT INTO Sales_order VALUES ('O005', '1-MAY-23', 'C00006', 'Bombay', 'S03', 'P', 'Y', '13-MAY-23', 'In Process');
INSERT INTO Sales_order VALUES ('O006', '1-MAY-23', 'C00001', 'Pune', 'S03', 'F', 'N', '13-MAY-23', 'In Process');
INSERT INTO Sales_order VALUES ('O007', '1-MAY-23', 'C00009', 'Chennai', 'S03', 'P', 'Y', '13-MAY-23', 'Fulfilled');
INSERT INTO Sales_order VALUES ('O008', '1-MAY-23', 'C00007', 'Agra', 'S03', 'P', 'N', '13-MAY-23', 'In Process');
INSERT INTO Sales_order VALUES ('O009', '1-MAY-23', 'C00008', 'Pune', 'S03', 'F', 'Y', '13-MAY-23', 'Cancelled');
INSERT INTO Sales_order VALUES ('O0010', '1-MAY-23', 'C000010', 'Pune', 'S03', 'P', 'Y', '13-MAY-23', 'BackOrder');

CREATE TABLE Sales_order_details (order_no VARCHAR(5) PRIMARY KEY REFERENCES Sales_order(order_no) NOT NULL, product_no VARCHAR(6) REFERENCES Product_master(product_no) NOT NULL, qty_ordered NUMBER(3), qty_display NUMBER(3), product_rate NUMBER(5)); 

INSERT INTO Sales_order_details VALUES ('O001', 'P2', '4', '2', '500');
INSERT INTO Sales_order_details VALUES ('O003', 'P4', '2', '1', '150');
INSERT INTO Sales_order_details VALUES ('O004', 'P1', '10', '0', '100');


