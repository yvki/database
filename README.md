## Problem Statement
A business owner wants to start an **online grocery store, like the NTUC FairPrice**. You are required to **design the database to store the product information**. To facilitate the user browsing experience, the products are assigned using a **three-tier hierarchy system**. The three levels are Categories, Subcategories and Groups with Categories being the broadest classification group. 

You are to consider the following two type of discounts as product discount/promotion information... 

- **Direct Discount** - Offers a reduction based on the original price, such as $10 off or 10% off, and is applied to a single product

- **Quantity-Based Discount** - Encourage shoppers to increase their order value to a specific threshold of items (eg. buy 2 save $5)

## Database Features

### For each product,

- product name 
- regular price 
- discount and promotion information
- weight/volume/size information _(optional)_

### As an online user, I must be able to... 

- browse the products based on **product category and brand**

### As the store owner, I must be able to...

- **update** the **regular price, discount and promotion information** of each product at **any time**
- **update** a product such that product is **no longer available for sale (note: the record should not be deleted)**

## Project Setup
1. Download the zipped files and open them in `Microsoft SQL Server`.

2. Click on **Connect** and **right click on Databases** to create a **new schema** called `FairPrice`.

3. **Double click on** `FairPrice` to make it the working database and run the SQL statements by clicking on **Execute**.

### Other Notes

1. For **ERD diagram and further explanation**, please view `Slides.pptx`.

2. This project has **no association to FairPrice NTUC in real life**.
