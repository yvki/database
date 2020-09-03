-- Category 
INSERT INTO Category(cName)
VALUES('Household'),
      ('Food Cupboard');

-- Sub Category 
INSERT INTO SubCategory(scName, sccId) 
VALUES('Detergents', 1),
	  ('Fresheners', 1),
	  ('Snacks', 2);

-- Brands
INSERT INTO Brands(bName) 
VALUES('Dynamo'),
	  ('Breeze'),
	  ('Glade'),
	  ('Pringles');

-- Groups
INSERT INTO Groups(gName, gBrandId, gSCId) 
VALUES('Powder Detergent', 1, 1),
	  ('Liquid Detergent', 2, 1),
	  ('Scented Gel', 3, 2),
	  ('Potato Chips', 4, 3);

-- Promotion 
INSERT INTO Promotion(pType, pInfo, pEvent, pStartDate, pEndDate, ReducePrice) --date in year month day format
VALUES('Direct Discount', 'Save $0.10', 'Hari Raya', '2020-06-01', '2020-06-30', NULL),
      ('Direct Discount', 'Save $2.85', 'Hari Raya', '2020-06-01', '2020-06-30', NULL),
	  ('Direct Discount', 'Save $2.85', 'Hari Raya', '2020-06-01', '2020-06-30', NULL),
	  ('Direct Discount', 'Save $2.85', 'Hari Raya', '2020-06-01', '2020-06-30', NULL),
	  ('Direct Discount', 'Save $0.10', 'Hari Raya', '2020-06-01', '2020-06-30', NULL),
	  ('Direct Discount', 'Save $0.10','Hari Raya', '2020-06-01', '2020-06-30', NULL),
	  ('Direct Discount', 'Save $0.10','Hari Raya', '2020-06-01', '2020-06-30', NULL),
	  ('Direct Discount', 'Save $11.60','Hari Raya', '2020-06-01', '2020-06-30', NULL),
	  ('Direct Discount', 'Save $0.10','Hari Raya', '2020-06-01', '2020-06-30', NULL),
	  ('Direct Discount', 'Save $1.50', 'Hari Raya', '2020-06-01', '2020-06-30', NULL),
	  ('Direct Discount', '15% Off', 'Hari Raya', '2020-06-01', '2020-06-30', NULL),
	  ('Quantity Based Discount', 'Buy 2 and Save $0.40', 'Hari Raya', '2020-06-01', '2020-06-30', NULL), 
	  (NULL, NULL, NULL, NULL, NULL, NULL); 

-- Products 
INSERT INTO Products(pName, pRegularprice, pWeight, pVolume, pSize, pQty, pGroupsId, pPromoId)
VALUES ('Dynamo Power Gel Laundry Detergent - Anti Bacterial', 10.05, '2.7kg', NULL, NULL, 1, 1, 1),
	   ('Dynamo Power Gel Laundry Detergent Refill - Anti Bacterial', 11.50, '2.4kg', NULL, NULL, 1, 1, 2),
	   ('Dynamo Power Gel Laundry Detergent Refill - Downy', 11.50, '2.4kg', NULL, NULL, 1, 1, 3),
	   ('Dynamo Power Gel Laundry Detergent Refill - Regular', 11.50, '2.7kg', NULL, NULL, 1, 1, 4),
	   ('Dynamo Power Gel Laundry Detergent - Downy', 10.05, NULL, '2.7L', NULL, 1, 1, 5),
	   ('Dynamo Power Gel Laundry Detergent - Regular', 10.05,'3kg', NULL, NULL, 1, 1, 6),
	   ('Dynamo Power Gel Laundry Detergent - Color Care', 10.05, NULL, '2.7L', NULL, 1, 1, 7),
	   ('Dynamo Power Gel Laundry Detergent - Anti-Bacterial', 50.40, '10.8kg', NULL, '4 CTN', 1, 1, 8),
	   ('Dynamo Power Gel Laundry Detergent - Indoor Dry', 10.05, '2.7kg', NULL, NULL, 1, 1, 9),
	   ('Breeze Liquid Detergent - Anti Bacterial and Color Protect', 12.40, '3.8kg', NULL, NULL, 1, 2, 10),
	   ('Breeze Liquid Detergent Refill - Anti Bacterial and Color Protect', 4.80, '1.5kg', NULL, NULL, 1, 2, 11),
	   ('Glade Scented Gel - Jasmine', 3.20, '180g', NULL, NULL, 2, 3, 12),
	   ('Pringles Potato Crisps - Cheesy Cheese', 2.70, '147g', NULL, NULL, 1, 4, 13);

-- Update Promotion
-- Direct Discount 
-- No Percentage
UPDATE Promotion
SET Promotion.ReducePrice = Products.pRegularPrice - 0.1
FROM Promotion JOIN Products ON Promotion.promoId = Products.pPromoId 
WHERE Products.prodId = 1 OR Products.prodId = 5 OR Products.prodId = 6 OR Products.prodId = 7 OR  Products.prodId = 9;

UPDATE Promotion
SET Promotion.ReducePrice = Products.pRegularPrice - 2.85
FROM Promotion JOIN Products ON Promotion.promoId = Products.pPromoId 
WHERE Products.prodId = 2 OR Products.prodId = 3 OR Products.prodId = 4;

UPDATE Promotion
SET Promotion.ReducePrice = Products.pRegularPrice - 11.6
FROM Promotion JOIN Products ON Promotion.promoId = Products.pPromoId 
WHERE Products.prodId = 8;

UPDATE Promotion
SET Promotion.ReducePrice = Products.pRegularPrice - 1.5
FROM Promotion JOIN Products ON Promotion.promoId = Products.pPromoId 
WHERE Products.prodId = 10;

-- With Percentage
UPDATE Promotion
SET Promotion.ReducePrice = Products.pRegularPrice * 0.75 
FROM Promotion JOIN Products ON Promotion.promoId = Products.pPromoId 
WHERE Products.prodId = 11;

-- Quantity Based Discount
UPDATE Products 
SET pRegularPrice = pRegularPrice * 2
WHERE prodId = 12 AND Products.pQty >= 2;

UPDATE Promotion
SET Promotion.ReducePrice = Products.pRegularPrice - 0.4
FROM Promotion JOIN Products ON Promotion.promoId = Products.pPromoId 
WHERE Products.prodId = 12 AND Products.pQty >= 2; 

-- Update the regular price of each product at any time
-- UPDATE Products SET Products.pRegularPrice = Promotion.ReducePrice
-- FROM Promotion JOIN Products ON Promotion.promoId = Products.pPromoId 
-- WHERE Products.prodId = 12;

-- Update product to not available 
-- UPDATE Products SET pQty = 0 WHERE Products.prodId = 12;