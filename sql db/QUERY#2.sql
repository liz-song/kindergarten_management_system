# 유치원 'water'의 정원 대비 관심수의 비율은 얼마인가?
#전체 유치원 경쟁률 확인하기
select k.name as '유치원',  k.likes/k.headcount as '경쟁률(배수)' ,
k.likes/(select count(*) from parents)*100 as '선호율(%)'
from kindergarten as k
order by likes DESC;

#특정 유치원 'water'에 대한 경쟁률 확인하기
select k.name as '유치원',  k.likes/k.headcount as '경쟁률(배수)' ,
k.likes/(select count(*) from parents)*100 as '선호율(%)'
from kindergarten k
where k.name = 'water';

