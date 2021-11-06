
### TIC2601



### Issues with DB Schema
 1) Cart tables is in the wrong format. 
 2) Current table format suggests that one user has many carts, and each cart has one product.
    **Impact unable to CRUD carts**
#### Correct format
##### Carts
### Create/Update(Carts are automatically created when i items is added)  
  **Request**  `POST /add_to_cart`  
  **Request body**
  ```json
    {
     "user_id": "1",
     "cart_items":[
        {
         "product_id": 1,
         "quantity": 5
        }
     ]
    }
  ```
### DELETE (Carts are automatically created when i items is added)  
  **Request**  `POST /add_to_cart`  
  **Request body**
  ```json
    {
     "user_id": "1",
     "cart_items":[
        {
         "product_id": 1,
         "quantity": 5
        }
     ]
    }
  ```
### READ  
  `GET /carts/:id`  

##  Products

### Create  
  **Request**  `POST admin/products`  
  **Request body**
  ```json
    {
      "name": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      "category": "men's clothing",
      "summary": "Your perfect pack for everyday use.",
      "price": 109.95,
      "quantity": 3
    }
  ```

### READ
  `GET /products`    
  `GET /products/:id`  
### Update 

**Request**  `PUT admin/products/:id`  
  
**Request body**
  ```json
    {
      "quantity": 3
    }
  ```


##  Bookmarks
### Create  
  **Request**  `POST /bookmark`  
  **Request body**
  ```json
    {
      "user_id": 1,
      "product_id": 53
    }
  ```

### Delete 
`DEL  bookmarks/:id`  
## Reviews
### Create  
  **Request**  `POST /product_reviews`  
  **Request body**
  ```json
    {
      "user_id": 1,
      "product_id": 53
    }
  ```

### Delete 
`DEL product_reviews/:id`  
## Orders
### READ
  `GET /products/:id`  

