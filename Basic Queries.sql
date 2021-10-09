-- Number of Owners Property 
Select property_owner.OnwerId, property_owner.Firstname, property_owner.Lastname, COUNT(property.PropertyId) AS 'Number of Property'
FROM property_owner
LEFT JOIN property
ON property_owner.OnwerId = property.OnwerId
GROUP BY property_owner.Lastname;

--Rental Income by Owner
SELECT lease_agreement.PropertyId, SUM(lease_agreement.Price) As 'Rental Income',
property_owner.OnwerId, property_owner.Firstname, property_owner.Lastname
FROM ((lease_agreement
JOIN property ON lease_agreement.PropertyId = property.PropertyId)
JOIN property_owner ON property.OnwerId = property_owner.OnwerId) 
GROUP BY lease_agreement.PropertyId, property_owner.OnwerId;

--Flat with tenants
SELECT property.PropertyId, lease_agreement.TenantId, tenant.Firstname, tenant.Lastname, tenant.email, tenant.PhoneNumber
FROM ((property
LEFT JOIN lease_agreement ON property.PropertyId = lease_agreement.PropertyId)
LEFT JOIN tenant ON lease_agreement.TenantId = tenant.TenantId);

--Tenants without lease agreement
SELECT tenant.TenantId, tenant.Firstname, tenant.Lastname, lease_agreement.PropertyId
FROM tenant
LEFT JOIN lease_agreement ON tenant.TenantId = lease_agreement.TenantId
WHERE lease_agreement.PropertyId IS NULL;

--Rental Income for Propoerty Company 
SELECT OwnerId, Sum(Amount) As 'Suma', (Sum(Amount))*(0.1) as 'Income'
FROM transactions
Group by OwnerId;