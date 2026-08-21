-- ==========================================
-- CHINOOK SALES & CUSTOMER ANALYTICS
-- SQL Data Extraction Queries
-- ==========================================

-- 1. Customer Performance & Lifetime Value Analysis
SELECT 
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.Country,
    c.City,
    COUNT(i.InvoiceId) AS TotalInvoices,
    ROUND(SUM(i.Total), 2) AS TotalSpent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY TotalSpent DESC;


-- 2. Revenue & Sales Volume by Genre
SELECT 
    g.Name AS Genre,
    COUNT(il.InvoiceLineId) AS ItemsSold,
    ROUND(SUM(il.UnitPrice * il.Quantity), 2) AS TotalRevenue
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY g.GenreId
ORDER BY TotalRevenue DESC;


-- 3. Invoice & Transaction Breakdown
SELECT 
    i.InvoiceId,
    i.CustomerId,
    i.InvoiceDate,
    i.BillingCountry,
    ROUND(i.Total, 2) AS TotalAmount,
    COUNT(il.InvoiceLineId) AS TotalItems
FROM Invoice i
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
GROUP BY i.InvoiceId
ORDER BY i.InvoiceDate DESC;
