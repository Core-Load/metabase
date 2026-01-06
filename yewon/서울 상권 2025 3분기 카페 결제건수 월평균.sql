SELECT
  D.trdar_cd_nm, avg(F.tmzon_00_06_selng_co/3) as "오전12시~6시", avg(F.tmzon_06_11_selng_co/3) as "오전6시~11시", avg(F.tmzon_11_14_selng_co/3) as "오전11시~오후2시", avg(F.tmzon_14_17_selng_co/3) as "오후2시~5시", avg(F.tmzon_17_21_selng_co/3) as "오후5시~오후9시", avg(F.tmzon_21_24_selng_co/3) as "오후9시~오전12시"
FROM
  analytics.fact_market_quarter F
JOIN analytics.dim_market_quarter D 
ON (D.trdar_cd = F.trdar_cd and D.thsmon_selng_co = F.thsmon_selng_co)
where 
	(D.trdar_cd_nm = '광장시장(광장전통시장)' --
	OR D.trdar_cd_nm = '명동(명동거리)' --
	OR D.trdar_cd_nm = '광화문역' --
	OR D.trdar_cd_nm = '성수동카페거리' --
	OR D.trdar_cd_nm = '서교동(홍대)' --
	OR D.trdar_cd_nm = '강남역' --
	OR D.trdar_cd_nm = 'DMC(디지털미디어시티)'
	OR D.trdar_cd_nm = '마곡역(마곡)') and
	D.svc_induty_cd_nm like '커피%'
group by D.trdar_cd_nm;