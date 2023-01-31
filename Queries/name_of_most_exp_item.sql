SELECT b.NAME as brand_name, MAX(ri.TOTAL_FINAL_PRICE) as most_expensive_item
FROM brands b
JOIN receipt_items ri ON b.BRAND_CODE = ri.BRAND_CODE -- Join brands and receipt_items on Brand Code
GROUP BY b.NAME
ORDER BY most_expensive_item DESC -- Reverse sort to find max first
LIMIT 1 -- Get the top most value