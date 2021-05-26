CREATE LOGIN palma  
    WITH PASSWORD = 'senha';  
GO  

CREATE USER palma FOR LOGIN palma;  
GO  

GRANT SELECT ON dbo.uf TO palma;