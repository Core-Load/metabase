SELECT *
FROM (
	SELECT
		dgl.gu_nm as 구
		,fr.data_clct_tm as 측정일시
		,fr.rn_10m as "10분우량"
		,fr.rainfall_level_kr as 강우등급
		,dgl.lat as 위도
		,dgl.lng as 경도
	FROM analytics.fact_rainfall as fr
	JOIN analytics.dim_rainfall as dr ON fr.gu_cd = dr.gu_cd
	LEFT JOIN analytics.dim_gu_location as dgl on dr.gu_nm = dgl.gu_nm
	/*
	UNION
	SELECT
		'테스트1' as 구
		,CURRENT_TIMESTAMP as 측정일시
		,10 as "10분우량"
		,'강한비' as 강우등급
		,37.5 as 위도
		,127.3 as 경도
	UNION
	SELECT
		'테스트2' as 구
		,CURRENT_TIMESTAMP as 측정일시
		,5 as "10분우량"
		,'보통비' as 강우등급
		,37.5 as 위도
		,127.2 as 경도
	UNION
	SELECT
		'테스트3' as 구
		,CURRENT_TIMESTAMP as 측정일시
		,1 as "10분우량"
		,'약한비' as 강우등급
		,37.5 as 위도
		,127.1 as 경도
	*/
) t
ORDER BY "10분우량" DESC, "구" ASC