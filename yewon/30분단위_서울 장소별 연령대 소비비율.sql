SELECT area_name, age_10_rate as "10대", age_20_rate as "20대", age_30_rate as "30대", age_40_rate as "40대",age_50_rate as "50대",age_60_rate as "60대", loaded_at
FROM analytics.fact_market_ppl
where area_name != '어린이대공원'
order by loaded_at desc
limit 9;