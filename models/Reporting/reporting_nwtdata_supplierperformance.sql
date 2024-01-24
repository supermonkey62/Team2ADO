SELECT
    SupplierID,
    SupplierCity,
    SupplierCountry,
    UniqueProductsSupplied,
    TotalProductsSupplied,
    TotalProductCost,
    SupplierCompanyName

from {{ ref('stg_nwtdata_supplierperformance') }}