SELECT * FROM customer;

SELECT * FROM product;

SELECT * FROM cart_product;

INSERT INTO product(name)values(
	'hat'
),('sweatshirt');

SELECT *
FROM product 
LEFT JOIN cart_product 
ON product.product_id = cart_product.product_id;

SELECT product.product_id, name, cart_id
FROM product 
LEFT JOIN cart_product 
ON product.product_id = cart_product.product_id;

SELECT product.product_id, name, cart_id
FROM product 
RIGHT JOIN cart_product 
ON product.product_id = cart_product.product_id;

SELECT *
FROM product
JOIN cart_product 
ON product.product_id =  cart_product.product_id;

INSERT INTO customer(email,password)values('bob','123')

-- All customers who bought a pillow
SELECT customer.name, cart.cart_id, product.product_id
FROM customer
JOIN cart
ON customer.customer_id = cart.customer_id
JOIN cart_product
ON cart.cart_id = cart_product.cart_id
JOIN product 
ON cart_product.product_id = product.product_id
WHERE product.product_id = 1;