SELECT * FROM (
    -- Consulta do ano 2016
    SELECT 
        SUM(OrderQuantity) AS qtd, 
        Vendas.ProductKey 
    FROM 
        AdventureWorks_Sales_2016 AS Vendas
    INNER JOIN 
        AdventureWorks_Products AS PRODUTOS ON (PRODUTOS.ProductKey = Vendas.ProductKey)
    WHERE 
        PRODUTOS.ProductSubcategoryKey IN (1, 2, 3)
    GROUP BY  
        Vendas.ProductKey 

    UNION ALL

    -- Consulta do an 2017
    SELECT 
        SUM(OrderQuantity) AS qtd, 
        Vendas.ProductKey 
    FROM 
        AdventureWorks_Sales_2017 AS Vendas
    INNER JOIN 
        AdventureWorks_Products AS PRODUTOS ON (PRODUTOS.ProductKey = Vendas.ProductKey)
    WHERE 
        PRODUTOS.ProductSubcategoryKey IN (1, 2, 3)
    GROUP BY  
        Vendas.ProductKey 
) AS CombinedResults
ORDER BY qtd DESC 
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;
