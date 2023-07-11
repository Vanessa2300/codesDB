CREATE TABLE CUSTOMERS(
   ID   INT              NOT NULL,
   NAME VARCHAR (20)     NOT NULL,
   AGE  INT              NOT NULL,
   ADDRESS  CHAR (25) ,
   SALARY   DECIMAL (18, 2),       
   PRIMARY KEY (ID)
);

INSERT INTO CUSTOMERS VALUES (1, 'RIYA', 24, 'PUNE', 3000.50);
INSERT INTO CUSTOMERS VALUES (2, 'AKASH', 45, 'MUMBAI', 7000);
INSERT INTO CUSTOMERS VALUES (3, 'TINA', 35, 'LUCKNOW', 6000);
INSERT INTO CUSTOMERS VALUES (4, 'KARAN', 26, 'KOLKATA', 2000);
INSERT INTO CUSTOMERS VALUES (5, 'TANYA', 19, 'SURAT', 4500);
INSERT INTO CUSTOMERS VALUES (6, 'ROHIT', 67, 'PUNE', 3200.50);
INSERT INTO CUSTOMERS VALUES (7, 'RONAK', 22, 'LONAVALA', 8100.50);
INSERT INTO CUSTOMERS VALUES (8, 'BHUSHAN', 29, 'PUNE', 10000);