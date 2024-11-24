#Enroll&Update Procedure : 등록이 발생하면 등록가능 여부를 확인하고 상태출력 및 등록 시, 대기순위 업데이트
drop procedure if exists Enrollkinder;
delimiter //
create procedure Enrollkinder(IN parentsid varchar(45),
							  IN kinderid varchar(45))

begin
	declare wait_rank int;
	SELECT pk.now_rank INTO wait_rank FROM parents_has_kindergarten pk
	WHERE pk.parents_parent_id = parentsid and pk.kindergarten_kindergarten_id = kinderid;
    
    drop temporary table if exists temp_forgive;
    create temporary table temp_forgive( parentsid varchar(45), forgive varchar(45));
    Insert into temp_forgive(parentsid, forgive)
    select pk.parents_parent_id, pk.kindergarten_kindergarten_id
	from parents_has_kindergarten pk
	where pk.parents_parent_id = parentsid and pk.kindergarten_kindergarten_id != kinderid;
    
	CASE #이미 다른 유치원에 등록을 했는지 check
		 WHEN (SELECT SUM(pk.enroll_check)
			   FROM parents_has_kindergarten pk
			   where pk.parents_parent_id = parentsid) >= 1
		 THEN select concat("이미 등록된 유치원이 존재합니다: ", (select pk.kindergarten_kindergarten_id from parents_has_kindergarten pk
														  where pk.parents_parent_id = parentsid and pk.enroll_check = 1) ) as result;
		 #등록절차
         WHEN wait_rank <= 0
         THEN
			begin
            update parents_has_kindergarten
			set enroll_check = 1
			where (enroll_check = 0 and parents_parent_id = parentsid and kindergarten_kindergarten_id = kinderid);
            
            #대기 순위 업데이트
            update parents_has_kindergarten
			set now_rank = greatest(now_rank-1 , 0)
			where kindergarten_kindergarten_id in (select t.forgive from temp_forgive t);
			
            #상태 출력
			select concat("등록처리 되었습니다: ", kinderid) as result;
            end;
                                
		 ELSE select concat("등록불가. 대기 순위를 확인하세요: ", wait_rank) as result ;
	END CASE ; 
end; //
delimiter ;

SET sql_safe_updates = 0; #일시적으로 safe update 해제

#실행 쿼리
#before
select * from parents_has_kindergarten pk where pk.parents_parent_id = 'kid045';
select * from parents_has_kindergarten pk where pk.kindergarten_kindergarten_id = 'kind001';

call Enrollkinder('kid045','kind001');
call Enrollkinder('kid045','kind005');
call Enrollkinder('kid045','kind009');

#after
select * from parents_has_kindergarten pk where pk.parents_parent_id = 'kid045';
select * from parents_has_kindergarten pk where pk.kindergarten_kindergarten_id = 'kind001';