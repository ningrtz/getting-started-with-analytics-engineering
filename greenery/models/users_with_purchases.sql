WITH users_with_purchases as (
  SELECT
    user_id,
    CASE
    WHEN COUNT(order_id) = 1 then 'one_purchase'
    WHEN COUNT(order_id) = 2 then 'two_purchase'
    WHEN COUNT(order_id) >= 3 then 'three_plus_purchase'
    END AS purchase
    FROM public.orders
    GROUP BY user_id)

SELECT
  purchase,
  COUNT(purchase) as user_count
  FROM users_with_purchases
  GROUP BY purchase