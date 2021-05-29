CREATE OR REPLACE TRIGGER BeforeUpdateStudent 
BEFORE
UPDATE ON student
FOR EACH ROW

DECLARE
    underflow_length EXCEPTION;
    invalid_value EXCEPTION;
    nLength NUMBER;
    nBlank NUMBER;

BEGIN
   
    SELECT length(:new.s_pwd), instr(:new.s_pwd,' ')
    INTO nLength, nBlank
    FROM dual;

    IF (nLength < 4) THEN
        RAISE underflow_length;
    ELSIF (nBlank > 0) THEN
        RAISE invalid_value;
    END IF;
    
    EXCEPTION 
    WHEN underflow_length THEN
        RAISE_APPLICATION_ERROR(-20002, '암호는 4자리 이상이어야 합니다');
    WHEN invalid_value THEN
        RAISE_APPLICATION_ERROR(-20003, '암호에 공란은 입력되지 않습니다.');
END;
/