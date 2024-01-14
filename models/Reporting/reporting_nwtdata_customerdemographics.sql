SELECT
    CustomerID,
    CustomerContactName,
    CustomerCompanyName,
    CustomerContactTitle,
    CustomerCity,
    CustomerRegion,
    CustomerTerritory

from {{ ref('stg_nwtdata_CustomerDemographics') }}