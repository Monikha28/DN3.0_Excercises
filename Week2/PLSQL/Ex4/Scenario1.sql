CREATE OR REPLACE FUNCTION CalculateAge (
    p_date_of_birth IN DATE
) RETURN NUMBER IS
    v_age NUMBER;
BEGIN
    -- Calculate the age based on the difference between the current date and date of birth
    v_age := FLOOR((SYSDATE - p_date_of_birth) / 365.25);

    RETURN v_age;
END CalculateAge;
/
