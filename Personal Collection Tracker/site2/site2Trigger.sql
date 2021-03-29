
--------------------------INSERT TRIGGER------------------------------

CREATE OR REPLACE TRIGGER insertCollectionStamp
BEFORE INSERT 
ON STAMPS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Inserted in STAMP Collection Table');
END;
/
CREATE OR REPLACE TRIGGER insertCollectionBook
BEFORE INSERT 
ON BOOKS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Inserted in Book Collection Table');
END;
/


