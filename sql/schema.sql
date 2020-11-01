DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

CREATE TABLE card_holder (
	id SERIAL,
	name VARCHAR(150) NOT NULL,
	PRIMARY KEY (id));

CREATE TABLE credit_card (
	card VARCHAR(50) NOT NULL,
	id_card_holder INT NOT NULL,
	FOREIGN KEY (id_card_holder) REFERENCES card_holder(id),
	PRIMARY KEY (card));

CREATE TABLE merchant_category (
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	PRIMARY KEY(id));
	
CREATE TABLE merchant (
	id SERIAL,
	name VARCHAR(255) NOT NULL,
	id_merchant_category INT NOT NULL,
	FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id),
	PRIMARY KEY (id));

CREATE TABLE transaction (
	id INT NOT NULL,
	date TIMESTAMP NOT NULL,
	amount FLOAT NOT NULL,
	card VARCHAR(50) NOT NULL,
	FOREIGN KEY (card) REFERENCES credit_card(card),
	id_merchant INT NOT NULL,
	FOREIGN KEY (id_merchant) REFERENCES merchant(id),
	PRIMARY KEY (id));
	