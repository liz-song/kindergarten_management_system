# 특정 유치원이 정원보다 등록인원이 적은가?
select kindergarten.kindergarten_id as '유치원 ID', kindergarten.name, 
if (sum(parents_has_kindergarten.enroll_check) < kindergarten.headcount, '등록 기간동안 미달', '등록 기간동안 정원을 충족함') as 등록여부
from parents_has_kindergarten, kindergarten
where  parents_has_kindergarten.kindergarten_kindergarten_id = kindergarten.kindergarten_id
group by parents_has_kindergarten.kindergarten_kindergarten_id;
