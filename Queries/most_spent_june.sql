SELECT b.NAME as brand_name, SUM(r.TOTAL_SPENT) as total_spent
FROM brands b
JOIN receipt_items ri ON b.BRAND_CODE = ri.BRAND_CODE -- Join tables brands and receipt items
JOIN receipts r ON ri.REWARDS_RECEIPT_ID = r.ID -- Join tables receipts and rewards receipts
WHERE MONTH(r.PURCHASE_DATE) = 6 -- Month of June
GROUP BY b.NAME
ORDER BY total_spent DESC
LIMIT 1 -- Find max by limit 1 and order by total_spent in DESC