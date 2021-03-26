
DROP TABLE BOOKS CASCADE CONSTRAINTS;
DROP TABLE STAMPS CASCADE CONSTRAINTS;

SET LINESIZE 600;
SET PAGESIZE 300;

CREATE TABLE BOOKS
(
	BOOKS_ID INT,
	BOOKS_NAME VARCHAR2(50),
	BOOK_GENRE VARCHAR2(20),
	AUTHOR VARCHAR2(30),
	B_ENTRY_DATE DATE,
	PRIMARY KEY(BOOKS_ID)
);

CREATE TABLE STAMPS
(
	STAMP_ID NUMBER,
	STAMP_CODE VARCHAR(30),
	COUNTRY VARCHAR2(30),
	STAMP_YEAR INT,
	PRICE FLOAT,
	S_ENTRY_DATE DATE,
	PRIMARY KEY(STAMP_ID)
);
--STAMPS
INSERT INTO STAMPS VALUES(17, '75 YEARS UPU', 'GILBERT AND ELICE ISLANDS', 1949, 6.50, TO_DATE('2008/02/22', 'YYYY/MM/DD'));
INSERT INTO STAMPS VALUES(18, 'OVERPRINT', 'HONDURAS', 1993, 0.70, TO_DATE('2005/05/12', 'YYYY/MM/DD'));
INSERT INTO STAMPS VALUES(19, 'AIRMAIL OVERPRINTS', 'HUNGARY', 1918, 27.00, TO_DATE('2003/06/29', 'YYYY/MM/DD'));
INSERT INTO STAMPS VALUES(20, 'POSTAGE DUE', 'HUNGARY', 1933, 3.50, TO_DATE('2001/08/05', 'YYYY/MM/DD'));
INSERT INTO STAMPS VALUES(21, 'INTERNATIONAL CO-OPERATION', 'SWAZILAND', 1965, 0.90, TO_DATE('2009/07/14', 'YYYY/MM/DD'));
INSERT INTO STAMPS VALUES(22, 'DAGOBERT DUCK', 'GUYANA', 1998, 24.30, TO_DATE('2005/05/12', 'YYYY/MM/DD'));
INSERT INTO STAMPS VALUES(23, 'RESISTANCE', 'RUSSIA, SOVIET UNION', 1969, 0.60, TO_DATE('2006/08/04', 'YYYY/MM/DD'));

--BOOKS
INSERT INTO BOOKS VALUES(16,'TIN GOYENDA VOLUME 1', 'KISHORE THRILLER', 'ROKIB HASAN', TO_DATE('2006-03-03', 'YYYY/MM/DD'));
INSERT INTO BOOKS VALUES(17,'OTHOI SHAGOR PART 1,2', 'ADVENTURE', 'ROKIB HASAN', TO_DATE('2006-05-10', 'YYYY/MM/DD'));
INSERT INTO BOOKS VALUES(18,'JINAR SEI DIP', 'KISHORE THRILLER', 'ROKIB HASAN', TO_DATE('2007-09-11', 'YYYY/MM/DD'));
INSERT INTO BOOKS VALUES(19,'GOPAL VARER 111 HASHIR GOLPO', 'UNKNOWN', 'COMEDY', TO_DATE('2005-02-15', 'YYYY/MM/DD'));
INSERT INTO BOOKS VALUES(20,'NONTE FONTE', 'NARAYAN DEBNATH', 'COMICS', TO_DATE('2004-02-11', 'YYYY/MM/DD'));
INSERT INTO BOOKS VALUES(21,'KAKABABU SHOMOGRO', 'SHUNIL GONGOPADDHAY', 'ADVENTURE', TO_DATE('2008-03-01', 'YYYY/MM/DD'));
INSERT INTO BOOKS VALUES(12,'TENIDA SHOMOGRO', 'NARAYAN GANGOPADDHAY', 'SUSPENSE AND COMEDY', TO_DATE('2007-02-10', 'YYYY/MM/DD'));