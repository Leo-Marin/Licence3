SELECT COUNT(TABLE_NAME) 
FROM COLS
WHERE TABLE_NAME='ABONNE';

SELECT CONSTRAINT_NAME, STATUS
FROM USER_CONSTRAINTS;

SELECT CONSTRAINT_NAME
FROM USER_CONSTRAINTS
WHERE CONSTRAINT_TYPE='P';