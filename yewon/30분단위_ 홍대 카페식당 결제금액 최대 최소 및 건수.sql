select * from (
	select major_category, sum(payment_count) as "결제횟수", avg(payment_max) as "최대결제금액", avg(payment_min) as "최소결제금액", loaded_at
	from analytics.fact_market_store
	where area_name = '홍대입구역(2호선)' and major_category = '음식·음료'
	group by major_category, loaded_at
	order by loaded_at DESC
	limit 50
) as sub
order by loaded_at asc;