SELECT
    SupplierID,
    SupplierCompanyName,
    SupplierCity,
    SupplierCountry,
    UniqueProductsSupplied,
    TotalProductsSupplied,
    InventoryValue,
    TotalSalesBySupplier,
    TotalProfitBySupplier
    

from {{ ref('stg_nwtdata_supplierperformance') }}