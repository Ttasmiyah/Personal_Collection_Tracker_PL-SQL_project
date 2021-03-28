--------------------------UPDATE TRIGGER------------------------------

CREATE OR REPLACE TRIGGER updateCollectionStamp
AFTER UPDATE 
OF S_ENTRY_DATE
ON STAMPS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Updated in STAMP Collection Table');
END;
/
CREATE OR REPLACE TRIGGER updateCollectionBook
AFTER UPDATE 
OF B_ENTRY_DATE
ON BOOKS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Updated in Book Collection Table');
END;
/

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


--------------------------DELETE TRIGGER------------------------------

CREATE OR REPLACE TRIGGER deleteCollectionStamp
AFTER DELETE
ON STAMPS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Deleted in STAMP Collection Table');
END;
/
CREATE OR REPLACE TRIGGER deleteCollectionBook
AFTER DELETE
ON BOOKS
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE(chr(10) || 'Data Deleted in Book Collection Table');
END;
/