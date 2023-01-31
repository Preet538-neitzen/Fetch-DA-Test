SELECT u.ID, MAX(ri.TOTAL_FINAL_PRICE) as most_expensive_item
FROM users u
JOIN receipts r ON u.ID = r.USER_ID -- Join tables uses and receipts on User ID
JOIN receipt_items ri ON r.ID = ri.REWARDS_RECEIPT_ID -- Join tables receipt_items and receipts on Receipt ID
GROUP BY u.ID
ORDER BY most_expensive_item DESC -- order by DESC to find higher expenses first
LIMIT 1 -- LIMIT 1 to find the top user