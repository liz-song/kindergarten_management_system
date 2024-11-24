# 유치원의 등록학부모수 업데이트 프로시저
DROP PROCEDURE IF EXISTS update_enrolled;
DELIMITER $$
CREATE PROCEDURE update_enrolled(IN enrolled_kinder_id VARCHAR(30))#, OUT enrolled_parents_sum INT)
BEGIN
	UPDATE kindergarten
		SET enroll_parents = (SELECT SUM(enroll_check) FROM parents_has_kindergarten
                              WHERE kindergarten_kindergarten_id = enrolled_kinder_id)
		WHERE kindergarten.kindergarten_id = enrolled_kinder_id;
END $$
DELIMITER ;
SET sql_safe_updates = 0; #일시적으로 safe update 해제
CALL update_enrolled("kind001")



