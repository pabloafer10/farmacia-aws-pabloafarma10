-- Schema MySQL para plataforma de farmácia
CREATE DATABASE IF NOT EXISTS farmacia CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE farmacia;

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS users (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  email VARCHAR(160) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de produtos
CREATE TABLE IF NOT EXISTS products (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(160) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de pedidos
CREATE TABLE IF NOT EXISTS orders (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT NOT NULL,
  status ENUM('PENDING','PAID','SHIPPED','CANCELLED') DEFAULT 'PENDING',
  total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_orders_users FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Itens do pedido
CREATE TABLE IF NOT EXISTS order_items (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  quantity INT NOT NULL,
  unit_price DECIMAL(10,2) NOT NULL,
  CONSTRAINT fk_items_orders FOREIGN KEY (order_id) REFERENCES orders(id),
  CONSTRAINT fk_items_products FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Pagamentos (simples)
CREATE TABLE IF NOT EXISTS payments (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  order_id BIGINT NOT NULL,
  method ENUM('PIX','CREDIT_CARD','DEBIT_CARD','BOLETO') NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  status ENUM('INITIATED','CONFIRMED','FAILED') DEFAULT 'INITIATED',
  paid_at DATETIME NULL,
  CONSTRAINT fk_payments_orders FOREIGN KEY (order_id) REFERENCES orders(id)
);

-- View simples para relatório
CREATE OR REPLACE VIEW v_orders_summary AS
SELECT o.id AS order_id, u.email, o.status, o.total, o.created_at
FROM orders o
JOIN users u ON u.id = o.user_id;
