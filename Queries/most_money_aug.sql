SELECT u.ID, SUM(r.TOTAL_SPENT) as total_spent
FROM users u
JOIN receipts r ON u.ID = r.USER_ID -- Group users and receipts table based on User ID
WHERE MONTH(r.PURCHASE_DATE) = 8 -- Month of August
GROUP BY u.ID
ORDER BY total_spent DESC -- Sort in descending order
LIMIT 1 -- Get the top value