SELECT
    'categoryID' AS column_name,
    COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE categoryID LIKE '%NULL%' OR categoryID IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
    'categoryName' AS column_name,
    COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE categoryName LIKE '%NULL%' OR categoryName IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
    'description' AS column_name,
    COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE description LIKE '%NULL%' OR description IS NULL
HAVING COUNT(*) > 0

UNION ALL

SELECT
    'picture' AS column_name,
    COUNT(*) AS invalid_count
FROM NWTDATA.NWT.RAW_CATEGORY
WHERE picture LIKE '%NULL%' OR picture IS NULL
HAVING COUNT(*) > 0



-- COPY INTO 'C:\\Users\\amelia\\zSchool\\Year 2\\Semester 2\\Agile DataOps\\Assignment 2\\output.csv'
-- FROM (
--   SELECT
--     'categoryID' AS column_name,
--     COUNT(*) AS null_count
--   FROM NWTDATA.NWT.RAW_CATEGORY
--   WHERE categoryID LIKE '%NULL%'
--   UNION ALL
--   SELECT
--     'categoryName' AS column_name,
--     COUNT(*) AS null_count
--   FROM NWTDATA.NWT.RAW_CATEGORY
--   WHERE categoryName LIKE '%NULL%'
--   UNION ALL
--   SELECT
--     'description' AS column_name,
--     COUNT(*) AS null_count
--   FROM NWTDATA.NWT.RAW_CATEGORY
--   WHERE description LIKE '%NULL%'
--   UNION ALL
--   SELECT
--     'picture' AS column_name,
--     COUNT(*) AS null_count
--   FROM NWTDATA.NWT.RAW_CATEGORY
--   WHERE picture LIKE '%NULL%'
--   UNION ALL
--   SELECT
--     'categoryID' AS column_name,
--     COUNT(*) AS null_count
--   FROM NWTDATA.NWT.RAW_CATEGORY
--   WHERE categoryID IS NULL
--   UNION ALL
--   SELECT
--     'categoryName' AS column_name,
--     COUNT(*) AS null_count
--   FROM NWTDATA.NWT.RAW_CATEGORY
--   WHERE categoryName IS NULL
--   UNION ALL
--   SELECT
--     'description' AS column_name,
--     COUNT(*) AS null_count
--   FROM NWTDATA.NWT.RAW_CATEGORY
--   WHERE description IS NULL
--   UNION ALL
--   SELECT
--     'picture' AS column_name,
--     COUNT(*) AS null_count
--   FROM NWTDATA.NWT.RAW_CATEGORY
--   WHERE picture IS NULL
-- )
-- FILE_FORMAT = (TYPE = 'CSV');
