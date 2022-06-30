-- Sql script to create a triggerfor a table

-- Create a trigger to update qunatity of an item
CREATE trigger update_item
AFTER INSERT on orders
FOR EACH ROW
UPDATE items 
set quantity = quantity - NEW.number
WHERE name = NEW.item_name
