DELIMITER //

CREATE PROCEDURE second_counter(num INT)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;
    
    -- Вычисляем количество дней, часов, минут и секунд
    SET days = num DIV 86400;
    SET hours = (num MOD 86400) DIV 3600;
    SET minutes = (num MOD 3600) DIV 60;
    SET seconds = num MOD 60;

    -- Вывод результата в зависимости от величины num
    CASE
        WHEN num < 60 THEN
            SELECT CONCAT(num, ' ', 'seconds') AS Result;
        WHEN num >= 60 AND num < 3600 THEN
            SELECT CONCAT_WS(' ', minutes, 'minutes', seconds, 'seconds') AS Result;
        WHEN num >= 3600 AND num < 86400 THEN
            SELECT CONCAT_WS(' ', hours, 'hours', minutes, 'minutes', seconds, 'seconds') AS Result;
        ELSE
            SELECT CONCAT_WS(' ', days, 'days', hours, 'hours', minutes, 'minutes', seconds, 'seconds') AS Result;
    END CASE;
END//

DELIMITER ;

-- Пример вызова процедуры
CALL second_counter(123456);