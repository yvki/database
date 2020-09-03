/* Create Database */
CREATE DATABASE Fairprice;

/* Create Tables */
CREATE TABLE Category(
    cId INT IDENTITY PRIMARY KEY,
    cName VARCHAR(100) NOT NULL
);

CREATE TABLE SubCategory(
	scId INT IDENTITY PRIMARY KEY,
	scName VARCHAR(100) NOT NULL,
	sccId INT,
	FOREIGN KEY (sccId) REFERENCES Category(cId)
);

CREATE TABLE Brands(
	bId INT IDENTITY PRIMARY KEY,
	bName VARCHAR(100) NOT NULL
);

CREATE TABLE Groups(
	gId INT IDENTITY PRIMARY KEY,
	gName VARCHAR(100) NOT NULL,
	gBrandId INT,
	FOREIGN KEY (gBrandId) REFERENCES Brands(bId),
	gSCId INT, 
	FOREIGN KEY (gSCId) REFERENCES SubCategory(scId) 
);

CREATE TABLE Promotion (
	promoId INT IDENTITY PRIMARY KEY,
	pType VARCHAR(100) NULL,
	pInfo VARCHAR(100) NULL,
	pEvent VARCHAR(100) NULL,
	pStartDate DATE NULL,
	pEndDate DATE NULL,
	ReducePrice DECIMAL(5, 2) NULL
);

CREATE TABLE Products(
    prodId INT IDENTITY PRIMARY KEY,
    pName VARCHAR(100) NOT NULL,
	pRegularPrice DECIMAL(5, 2) NOT NULL,
	pWeight VARCHAR(100) NULL,
	pVolume VARCHAR(100) NULL,
	pSize VARCHAR(100) NULL,
	pQty INT,
	pGroupsId INT,
	FOREIGN KEY (pGroupsId) REFERENCES Groups(gId),
	pPromoId INT,
	FOREIGN KEY (pPromoId) REFERENCES Promotion(promoId)
);

/* Drop Database */
DROP DATABASE Fairprice;

/* Drop Tables */
DROP TABLE Products;
DROP TABLE Promotion;
DROP TABLE Brands;
DROP TABLE Groups;
DROP TABLE SubCategory;
DROP TABLE Category;