# 유치원 'kind001'에 대기 중인 학부모의 수는?
select k.name, h.kindergarten_kindergarten_id, max(h.now_rank) as '대기중인인원'
from kindergarten k, parents_has_kindergarten h
where k.kindergarten_id=h.kindergarten_kindergarten_id and h.kindergarten_kindergarten_id='kind001';
