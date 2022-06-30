-- Sql script to create an update trigger

DELIMITER $$
CREATE TRIGGER update_email
BEFORE UPDATE on users
FOR EACH ROW
IF (OLD.email != NEW.email)
    THEN IF (NEW.valid_email = 1)
        THEN SET NEW.valid_email = 0;
    ELSE
        SET NEW.valid_email = 1;
    END IF;
END IF;
$$
DELIMITER ;
