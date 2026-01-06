SELECT
  D.trdar_cd_nm, avg(F.mon_selng_amt/3) as "월요일", avg(F.tues_selng_amt/3) as "화요일", avg(F.wed_selng_amt/3) as "수요일", avg(F.thur_selng_amt/3) as "목요일", avg(F.fri_selng_amt/3) as "금요일", avg(F.sat_selng_amt/3) as "토요일", avg(F.sun_selng_amt/3) as "일요일"
FROM
  analytics.fact_market_quarter F
JOIN analytics.dim_market_quarter D 
ON (D.trdar_cd = F.trdar_cd and D.thsmon_selng_co = F.thsmon_selng_co)
where D.trdar_cd_nm = '광장시장(광장전통시장)' --
	OR D.trdar_cd_nm = '명동(명동거리)' --
	OR D.trdar_cd_nm ='광화문역' --
	OR D.trdar_cd_nm = '성수동카페거리' --
	OR D.trdar_cd_nm = '서교동(홍대)' --
	OR D.trdar_cd_nm = '강남역' --
	OR D.trdar_cd_nm = 'DMC(디지털미디어시티)'
	OR D.trdar_cd_nm = '마곡역(마곡)'
group by D.trdar_cd_nm
;
