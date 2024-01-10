SELECT *
FROM NWTDATA.NWT.CATEGORY
WHERE LOWER(categoryID) LIKE '%null%'
   OR LOWER(categoryName) LIKE '%null%'
   OR LOWER(description) LIKE '%null%'
   OR LOWER(picture) LIKE '%null%'
