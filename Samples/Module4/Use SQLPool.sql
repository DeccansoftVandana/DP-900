-- This is auto-generated code
--QUERY1
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://dssdatalake.dfs.core.windows.net/synapse-files/synapse/Products.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0'
    ) AS [result]


--Query2
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://dssdatalake.dfs.core.windows.net/synapse-files/synapse/Products.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result]
    
--Query3
SELECT
Category, COUNT(*) AS ProductCount
FROM
    OPENROWSET(
        BULK 'https://dssdatalake.dfs.core.windows.net/synapse-files/synapse/Products.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
        
    ) AS [result]
GROUP BY Category
