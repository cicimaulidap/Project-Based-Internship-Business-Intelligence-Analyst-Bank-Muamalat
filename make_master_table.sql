CREATE TABLE IF NOT EXISTS master_table AS (
  SELECT 
    o.Date AS order_date, 
    pc.CategoryName AS category_name,  
    p.ProdName AS product_name,
    p.Price AS product_price, 
    o.Quantity AS order_qty,
    SUM(o.Quantity * p.Price) AS total_sales,
    c.CustomerEmail AS cust_email, 
    c.CustomerCity AS cust_city
  FROM
    orders o
  INNER JOIN 
    customers c ON o.CustomerID = c.CustomerID
  INNER JOIN 
    products p ON o.ProdNumber = p.ProdNumber
  INNER JOIN 
    productcategory pc ON p.Category = pc.CategoryID
  GROUP BY
    cust_email, cust_city, order_date, order_qty, product_name, product_price, category_name
  ORDER BY
    order_date ASC
);
