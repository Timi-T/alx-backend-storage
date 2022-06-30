-- Sql script to create a function that divides two numbers

DELIMITER $$
CREATE function SafeDiv(a INT, b INT)
RETURNS float
DETERMINISTIC
BEGIN
    IF (b = 0)
        THEN RETURN b;
    END IF;
    RETURN a / b;
END
$$
DELIMITER ;
