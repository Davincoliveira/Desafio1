WITH VendasPorMes AS (
    SELECT 
        DATEPART(MONTH, Vendas.OrderDate) AS Mes,
        SUM(Produtos.ProductPrice * Vendas.OrderQuantity) AS ReceitaTotal,
        AVG(Produtos.ProductPrice) AS ReceitaMediaPorVenda
    FROM 
        AdventureWorks_Sales_2017 AS Vendas
    INNER JOIN 
        AdventureWorks_Products AS Produtos ON Vendas.ProductKey = Produtos.ProductKey
    WHERE 
        YEAR(Vendas.OrderDate) = 2017  
    GROUP BY 
        DATEPART(MONTH, Vendas.OrderDate)
    HAVING 
        AVG(Produtos.ProductPrice) > 500  
)
-- Encontrar o mes com maior valor totl de vendas
SELECT TOP 1 
    Mes, 
    ReceitaTotal
FROM 
    VendasPorMes
ORDER BY 
    ReceitaTotal DESC;
