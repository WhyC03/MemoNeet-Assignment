const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const products = require('./data/products');
let cart = [];

const app = express();
const PORT = 3000;

app.use(cors());
app.use(bodyParser.json());

/**
 * GET /products
 * Returns a list of all products
 */
app.get('/products', (req, res) => {
  res.status(200).json(products);
});

/**
 * POST /cart
 * Adds a product to the cart
 */
app.post('/cart', (req, res) => {
  const { productId, quantity } = req.body;
  if (!productId || !quantity) {
    return res.status(400).json({ error: 'Missing productId or quantity' });
  }

  const existing = cart.find(item => item.productId === productId);
  if (existing) {
    existing.quantity += quantity;
  } else {
    cart.push({ productId, quantity });
  }

  res.status(200).json({ message: 'Item added to cart', cart });
});

/**
 * GET /cart
 * Returns all items in the cart
 */
app.get('/cart', (req, res) => {
  res.status(200).json(cart);
});

app.listen(PORT, () => {
  console.log(`🚀 Server running at http://localhost:${PORT}`);
});
