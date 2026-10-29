use swiftrideDB

GO

SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO

SELECT
    OBJECT_NAME(fkc.parent_object_id) AS TableName,
    COL_NAME(
        fkc.parent_object_id,
        fkc.parent_column_id
    ) AS ForeignKeyColumn,
    OBJECT_NAME(fkc.referenced_object_id) AS ReferencedTable,
    COL_NAME(
        fkc.referenced_object_id,
        fkc.referenced_column_id
    ) AS ReferencedColumn
FROM sys.foreign_key_columns AS fkc
ORDER BY TableName, ForeignKeyColumn;
GO


SELECT
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    i.is_unique AS IsUnique
FROM sys.indexes AS i
WHERE i.object_id IN
(
    OBJECT_ID('dbo.PASSENGER'),
    OBJECT_ID('dbo.DRIVER'),
    OBJECT_ID('dbo.VEHICLE'),
    OBJECT_ID('dbo.VEHICLE_ASSIGNMENT'),
    OBJECT_ID('dbo.FARE_RULE'),
    OBJECT_ID('dbo.RIDE'),
    OBJECT_ID('dbo.PAYMENT'),
    OBJECT_ID('dbo.RATING'),
    OBJECT_ID('dbo.DRIVER_LOCATION')
)
AND i.name IS NOT NULL
ORDER BY TableName, IndexName;
GO