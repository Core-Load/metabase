SELECT
	a.area_display_name as 지역명,
	f.weather_time as 업데이트시간,
	CAST(NULLIF(f.temp, '') AS NUMERIC) as 기온,
	CAST(NULLIF(f.sensible_temp, '') AS NUMERIC) as 체감온도,
	CAST(NULLIF(f.max_temp, '') AS NUMERIC) as 최고온도,
	CAST(NULLIF(f.min_temp, '') AS NUMERIC) as 최저온도,
	CAST(NULLIF(f.humidity, '') AS NUMERIC) as 습도,
	w.wind_dirct_kr as 풍향,
	w.wind_degree as 풍향_각도,
	w.sort_order as 풍향_정렬순서,
	CAST(NULLIF(f.wind_spd, '') AS NUMERIC) as 풍속,
	f.precipitation_mm as 강수량,
	f.precpt_type as 강수형태,
	CAST(NULLIF(f.uv_index_lvl, '') AS NUMERIC) as 자외선지수단계,
	f.uv_index as 자외선지수,
	CAST(NULLIF(f.pm25, '') AS NUMERIC) as 초미세먼지,
	f.pm25_index as 초미세먼지지표,
	CAST(NULLIF(f.pm10, '') AS NUMERIC) as 미세먼지,
	f.pm10_index as 미세먼지지표,
	f.air_idx_mvl as 통합대기환경지수,
	f.air_idx as 통합대기환경등급,
	a.latitude as 위도,
	a.longitude as 경도
FROM analytics.fact_city_weather f
JOIN analytics.dim_realtime_area a ON f.area_name = a.area_name
LEFT JOIN analytics.dim_wind_dirct w ON f.wind_dirct = w.wind_dirct