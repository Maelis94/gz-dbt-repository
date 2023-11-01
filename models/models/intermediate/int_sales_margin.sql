SELECT 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity, 
    purchase_price, 
    ROUND(CAST(s.quantity AS INT) * CAST(p.purchase_price AS float64),2) AS purchase_cost,
    s.revenue - ROUND(CAST(s.quantity as int)* cast (p.purchase_price as float64),2) AS margin
FROM {{ref("stg_raw__sales")}} s
LEFT JOIN {{ref("stg_raw__product")}} p 
		USING (products_id)