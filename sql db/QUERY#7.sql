# 유치원 모집 일정에 대해 안내하고 싶다.
select 
	case 
    when start_date <=str_to_date(NOW(), '%-%-%')<=result_date then '유치원 지원기간입니다. 선발 결과는 2023-05-08에 나옵니다.' 
    when result_date<=str_to_date(NOW(), '%-%-%')<=add_date then '선발 결과가 발표되었습니다. 등록/포기 기간입니다.'
    when str_to_date(NOW(), '%-%-%')=add_result_date then '등록/포기 기간이 지났습니다. 추가모집기간입니다.'
    else '유치원 지원기간이 아닙니다.'
    end as result
FROM mydb.system;
