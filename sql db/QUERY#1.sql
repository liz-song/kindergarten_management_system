# 학부모 'kid001'가 선호하는 조건에 적합하는 유치원 목록은 무엇인가?
select p.parent_id, p.wanttype, k.kindergarten_id
from parents p, kindergarten k
where  p.parent_id = 'kid001' and p.wanttype = k.type;
