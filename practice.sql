CREATE TABLE if not exists clients (
  client_id INT primary key auto_increment,
  name varchar(100) not null,
  email varchar(100) not null unique, 
  phone_number varchar(15),
  created_at timestamp not null default CURRENT_TIMESTAMP,
  updated_at timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
  );

CREATE TABLE if not exists products (
  name varchar(100) not null,
  slug varchar(200) not null unique, 
  description text,
  created_at timestamp not null default CURRENT_TIMESTAMP,
  updated_at timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
  );  

CREATE TABLE if not exists bills (
  bill_id INT unsigned primary key auto_increment,
  client_id INT not null, 
  total float,
  status enum ('open', 'paid','lost') not null default 'open',
  created_at timestamp not null default CURRENT_TIMESTAMP,
  updated_at timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  foreign key (client_id) references clients(client_id)
    on delete cascade
    on update cascade
  );  

CREATE TABLE if not exists bill_products (
  bill_product_id INT unsigned primary key auto_increment,
  bill_id INT unsigned not null,
  product_id INT unsigned not null, 
  quantity INT not null default 1, 
  created_at timestamp not null default CURRENT_TIMESTAMP,
  updated_at timestamp not null default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  foreign key (bill_id) references bills (bill_id)
    on delete cascade
    on update cascade
  );



ALTER TABLE products
  add price float not null after slug;


INSERT INTO products(name, slug) 
  values
  ('pluma negra', 'pluma-negra'), 
  ('pluma roja', 'pluma-roja'),
  ('pluma blanca', 'pluma-blanca');


ALTER TABLE products
  add price float not null after slug;

UPDATE products set price = rand()*100;


CREATE TABLE IF NOT EXISTS products (
  productID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  SKU VARCHAR(20) NOT NULL UNIQUE,
  Name VARCHAR(50) NOT NULL,
  slug VARCHAR(50) NOT NULL UNIQUE,
  description TEXT,
  price DOUBLE(10,2),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);




