DELIMITER //

CREATE PROCEDURE get_even(IN `start` INT, IN `end` INT)
BEGIN
    DECLARE i INT DEFAULT `start`;
    DECLARE res_str TEXT DEFAULT '';

    WHILE i <= `end` DO
        IF i % 2 = 0 THEN
            IF LENGTH(res_str) = 0 THEN
                SET res_str = i;
            ELSE
                SET res_str = CONCAT(res_str, ', ', i);
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;

    SELECT res_str AS even_numbers;
END//

DELIMITER ;

-- Пример вызова процедуры
CALL get_even(1, 10);
CALL second_counter(123456); 