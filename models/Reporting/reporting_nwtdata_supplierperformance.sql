SELECT
    SupplierID,
    SupplierCompanyName,
    TotalProductsSupplied,
    AverageProductPrice,
    OnTimeDeliveryRate

from {{ ref('stg_nwtdata_supplierperformance') }}