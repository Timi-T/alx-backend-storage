-- Sql script to create an update trigger

CREATE TRIGGER update_email
AFTER UPDATE on users
FOR EACH ROW
UPDATE users
SET valid_email = 1
WHERE id = NEW.id;
