with order_counts_in_each_hour as (
  SELECT
    DATE_TRUNC('hour',created_at) AS hour,
    COUNT(order_id) AS order_count
    FROM public.orders
    GROUP BY 1
    )
    
SELECT
  AVG(order_count)
FROM order_counts_in_each_hour