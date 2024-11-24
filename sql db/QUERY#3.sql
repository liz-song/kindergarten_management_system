#query3: 대기상태인 유치원에서의 내 대기 순위는 얼마인가?
#학부모의 대기 순위 및 상태 조회 프로시저
drop procedure if exists Myrank;
delimiter //
create procedure Myrank(
IN parentsid varchar(45))

#등록을 마쳤다면 등록을 했다고 안내해주기
If (select sum(pk.enroll_check) from parents_has_kindergarten pk
	where pk.parents_parent_id = parentsid) >= 1
then begin
	select "이미 등록된 유치원이 존재합니다" as result;
end;

#그렇지 않을 경우 해당 지원자의 순위 출력해서 보여주기
ELSE begin
	select pk.kindergarten_kindergarten_id as '유치원',
		pk.apply_rank as '최초순위' , pk.now_rank as '현재순위'
	from parents_has_kindergarten as pk
	where pk.parents_parent_id = parentsid;
end;
end if; //
delimiter ;

call Myrank('kid046');
call Myrank('kid032');


