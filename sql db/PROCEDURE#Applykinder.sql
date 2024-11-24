#지원 프로시저, Applykinder('parentsid','kinderid') 입력시 해당 지원 정보가 parents_has_kindergarten table에 저장됨
drop procedure if exists Applykinder;
delimiter //
create procedure Applykinder(
IN parentsid varchar(45),
IN kinderid varchar(45))

#지원이 작성된 학부모의 지원횟수가 3회를 넘는다면 지원 불가.
IF (select count(pk.kindergarten_kindergarten_id) from parents_has_kindergarten pk where pk.parents_parent_id = parentsid) = 3
then begin
	select 'already applied 3 kindergarten' as result ;
end;

ELSE begin
	insert into parents_has_kindergarten values (parentsid, kinderid, NULL, NULL, NULL);
end;
end if; //
delimiter ;

call Applykinder('kid99', '혜화유치원');
call Applykinder('kid99', '병설유치원');
call Applykinder('kid99', '호그와트유치원');
call Applykinder('kid99', '고려유치원');
select * from parents_has_kindergarten where parents_parent_id = 'kid99';
