select area_name, major_category, busyness, payment_count, payment_max, payment_min, merchant_count, loaded_at
from analytics.fact_market_store
where area_name = '홍대입구역(2호선)'
order by loaded_at asc;
