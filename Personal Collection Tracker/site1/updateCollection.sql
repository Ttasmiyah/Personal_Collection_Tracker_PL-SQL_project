SET SERVEROUTPUT ON;
SET VERIFY OFF;

BEGIN
	DBMS_OUTPUT.PUT_LINE(chr(10)||chr(10)||'Please Enter your Choice to update date from collection:');
	DBMS_OUTPUT.PUT_LINE('1. Update stamp from before 2010+ collection');
	DBMS_OUTPUT.PUT_LINE('2. Update stamp from after 2010 collection');
	DBMS_OUTPUT.PUT_LINE('3. Update book from before 2010+ collection');
	DBMS_OUTPUT.PUT_LINE('4. Update book from after 2010 collection');
END;
/
DECLARE
	CHOICE NUMBER := &YOUR_CHOICE;
	B_ID BOOKS.BOOKS_ID%TYPE;
	B_NAME BOOKS.BOOKS_NAME%TYPE;
	B_DATE BOOKS.B_ENTRY_DATE%TYPE;
	
	S_ID STAMPS.STAMP_ID%TYPE;
	S_CODE STAMPS.STAMP_CODE%TYPE;
	S_DATE STAMPS.S_ENTRY_DATE%TYPE;
	
	CHOICE_OUT_OF_BOUND EXCEPTION;
	
BEGIN
	IF CHOICE= 1 THEN
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('STAMP COLLECTION BEFORE 2010:');
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('ID' || chr(9) || 'STAMP ENTRY DATE' || chr(9) || 'STAMP CODE');
		DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
		FOR R IN (SELECT * FROM STAMPS@SITE1) LOOP
			S_ID := R.STAMP_ID;
			S_CODE := R.STAMP_CODE;
			S_DATE := R.S_ENTRY_DATE;
			DBMS_OUTPUT.PUT_LINE(S_ID || chr(9) || S_DATE || chr(9) || chr(9) || S_CODE);
		END LOOP;	    
	END IF;
	IF CHOICE= 2 THEN
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('STAMP COLLECTION AFTER 2010:');
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('ID' || chr(9) || 'STAMP ENTRY DATE' || chr(9) || 'STAMP CODE');
		DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
		FOR R IN (SELECT * FROM STAMPS) LOOP
			S_ID := R.STAMP_ID;
			S_CODE := R.STAMP_CODE;
			S_DATE := R.S_ENTRY_DATE;
			DBMS_OUTPUT.PUT_LINE(S_ID || chr(9) || S_DATE || chr(9) || chr(9) || S_CODE);
		END LOOP;	    
	END IF;
	IF CHOICE= 3 THEN
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('BOOK COLLECTION BEFORE 2010:');
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('BOOK ID' || chr(9) || 'BOOK ENTRY DATE' || chr(9) || 'BOOK NAME');
		DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
		FOR R IN (SELECT * FROM BOOKS@SITE1) LOOP
			B_ID := R.BOOKS_ID;
			B_NAME := R.BOOKS_NAME;
			B_DATE := R.B_ENTRY_DATE;
			DBMS_OUTPUT.PUT_LINE(B_ID || chr(9) || B_DATE || chr(9) || B_NAME);
		END LOOP;	    
	ELSIF CHOICE= 4 THEN
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('BOOK COLLECTION AFTER 2010:');
		DBMS_OUTPUT.PUT_LINE('===================================================');
		DBMS_OUTPUT.PUT_LINE('BOOK ID' || chr(9) || 'BOOK ENTRY DATE' || chr(9) || 'BOOK NAME');
		DBMS_OUTPUT.PUT_LINE('---------------------------------------------------');
		FOR R IN (SELECT * FROM BOOKS) LOOP
			B_ID := R.BOOKS_ID;
			B_NAME := R.BOOKS_NAME;
			B_DATE := R.B_ENTRY_DATE;
			DBMS_OUTPUT.PUT_LINE(B_ID || chr(9) || B_DATE || chr(9) || B_NAME);
		END LOOP;
	    
	END IF;

	IF CHOICE > 4 OR CHOICE < 1 THEN
		RAISE CHOICE_OUT_OF_BOUND;
	END IF;
	
	EXCEPTION
		WHEN CHOICE_OUT_OF_BOUND THEN 
			DBMS_OUTPUT.PUT_LINE(chr(10) || 'WRONG CHOICE OPTION SELECTED!');
	
	
END;
/

BEGIN
	DBMS_OUTPUT.PUT_LINE(chr(10) || 'CHOOSE THE BOOK OR STAMP ID TO update dates' || chr(10));
	DBMS_OUTPUT.PUT_LINE('--------------PLEASE FILL UP ALL FIELDS---------' || chr(10));
	
END;
/

DECLARE
	CHOICES NUMBER := &YOUR_PREVIOUS_CHOICE;
	BID NUMBER := &BOOK_OR_STAMP_ID;
	BDATE DATE := TO_DATE('&Book_or_Date_EntryDate','YYYY/MM/DD');
	CHOICE_OUT_OF_BOUND EXCEPTION;
	NUM NUMBER;
	
	I STAMPS.STAMP_ID%TYPE;
	A STAMPS.STAMP_CODE%TYPE;
	B STAMPS.S_ENTRY_DATE%TYPE;
 
BEGIN
	IF CHOICES = 1 THEN
		NUM := DEL_UP_COL.ALL_COL_UD(CHOICES, BID, BDATE);
		SELECT STAMP_ID, STAMP_CODE, S_ENTRY_DATE INTO I, A, B FROM STAMPS@SITE1 where STAMP_ID = BID;
		DBMS_OUTPUT.PUT_LINE('------UPDATED------');
		DBMS_OUTPUT.PUT_LINE('STAMP ID: ' || I);
		DBMS_OUTPUT.PUT_LINE('STAMP CODE: ' || A);
		DBMS_OUTPUT.PUT_LINE('STAMP ENTRY DATE: ' || B);
	ELSIF CHOICES = 2 THEN
		NUM := DEL_UP_COL.ALL_COL_UD(CHOICES, BID, BDATE);	
		SELECT STAMP_ID, STAMP_CODE, S_ENTRY_DATE INTO I, A, B FROM STAMPS where STAMP_ID = BID;
		DBMS_OUTPUT.PUT_LINE('------UPDATED------');
		DBMS_OUTPUT.PUT_LINE('STAMP ID: ' || I);
		DBMS_OUTPUT.PUT_LINE('STAMP CODE: ' || A);
		DBMS_OUTPUT.PUT_LINE('STAMP ENTRY DATE: ' || B);
	ELSIF CHOICES = 3 THEN
		NUM := DEL_UP_COL.ALL_COL_UD(CHOICES, BID, BDATE);
		SELECT BOOKS_ID, BOOKS_NAME, B_ENTRY_DATE INTO I, A, B FROM BOOKS@SITE1 where BOOKS_ID = BID;
		DBMS_OUTPUT.PUT_LINE('------UPDATED------');
		DBMS_OUTPUT.PUT_LINE('BOOK ID: ' || I);
		DBMS_OUTPUT.PUT_LINE('BOOK NAME: ' || A);
		DBMS_OUTPUT.PUT_LINE('BOOK ENTRY DATE: ' || B);
	ELSIF CHOICES = 4 THEN
		NUM := DEL_UP_COL.ALL_COL_UD(CHOICES, BID, BDATE);
		SELECT BOOKS_ID, BOOKS_NAME, B_ENTRY_DATE INTO I, A, B FROM BOOKS where BOOKS_ID = BID;
		DBMS_OUTPUT.PUT_LINE('------UPDATED------');
		DBMS_OUTPUT.PUT_LINE('BOOK ID: ' || I);
		DBMS_OUTPUT.PUT_LINE('BOOK NAME: ' || A);
		DBMS_OUTPUT.PUT_LINE('BOOK ENTRY DATE: ' || B);
	END IF;
	
	IF CHOICES > 4 OR CHOICES < 1 THEN
		RAISE CHOICE_OUT_OF_BOUND;
	END IF;
	
	EXCEPTION
		WHEN CHOICE_OUT_OF_BOUND THEN 
			DBMS_OUTPUT.PUT_LINE(chr(10) || 'WRONG CHOICE OPTION SELECTED!');
END;
/
@"D:\4.1\DDS-LAB\Z_LABPROJECT\Personal Collection Tracker\site1\deleteCollection.sql"