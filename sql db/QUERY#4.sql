# 유치원 'love'에서 결원이 발생했는가?
DROP PROCEDURE IF EXISTS vacancy;
DELIMITER $$
CREATE PROCEDURE vacancy(IN kinder_name VARCHAR(30), OUT vacancy_status INT)
BEGIN
	DECLARE head INT;
	DECLARE enrolled INT;
	SELECT headcount INTO head FROM kindergarten WHERE name = kinder_name;
	SELECT enroll_parents INTO enrolled FROM kindergarten WHERE name = kinder_name;
	IF (head-enrolled) > 0 THEN SET vacancy_status = head-enrolled;
	ELSE SET vacancy_status = 0;
	END IF;
END $$
DELIMITER ;
CALL vacancy("love", @vacancy);
SELECT CONCAT("kindergarten named 'love' has ", @vacancy, " vacancies") as VACANCY_STATUS;