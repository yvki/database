-- Submission queries:
-- 1. List the product name and price of all products on offer.
	SELECT pName, pRegularPrice, ReducePrice FROM Products 
	JOIN Promotion ON Promotion.promoId = Products.pPromoId
	WHERE pType IS NOT NULL AND (getDATE() >= pStartDate) AND (getDate() <= pEndDate);

-- 2. List product information and price in ascending order of the price.
	SELECT ('PROD'+STR(prodId)) 'prodId', pName, pWeight, pVolume, pSize, pQty, pRegularPrice, ReducePrice
	FROM Products JOIN Promotion ON Promotion.promoId = Products.pPromoId ORDER BY pRegularPrice ASC;

-- 3. How many products belong to Household / Detergent and belong to either Breeze or Dynamo?
	SELECT COUNT(*) 'Products belong to Household / Detergent and belong to either Breeze or Dynamo'FROM Products 
	JOIN Promotion ON Promotion.promoId = Products.pPromoId
	JOIN Groups ON Groups.gId = Products. pGroupsId
	JOIN Brands ON Brands.bId = Groups.gBrandId
	JOIN SubCategory ON SubCategory.scId = Groups.gSCId
	JOIN Category ON Category.cId = SubCategory.sccId
	WHERE cId = 1 AND scId = 1 AND (bId = 1 OR bId = 2);

-- 4. What is the current price of a given product? 
	SELECT pName, pRegularPrice, ReducePrice, 
	CASE WHEN ReducePrice IS NOT NULL THEN ReducePrice ELSE pRegularPrice END AS CurrentPrice
	FROM Products 
	JOIN Promotion ON Promotion.promoId = Products.pPromoId 
	WHERE prodId = 1;

