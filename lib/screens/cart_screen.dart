import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<bool> _selectedItems = [true, true];
  List<int> _quantities = [1, 1];
  final double _totalAmount = 14990;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {/* Filter functionality */},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80), // Space for bottom section
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProductList(),
                _buildPriceDetails(),
                _buildSimilarProducts(),
              ],
            ),
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return Column(
      children: [
        CartProductItem(
          image: 'assets/product1.jpg',
          title: 'Travel Steamer Iron for Clothes...',
          price: 2189,
          quantity: _quantities[0],
          isSelected: _selectedItems[0],
          onQuantityChanged: (value) => setState(() => _quantities[0] = value),
          onSelected: (value) => setState(() => _selectedItems[0] = value),
        ),
        Divider(height: 1),
        CartProductItem(
          image: 'assets/product2.jpg',
          title: 'Another Product...',
          price: 3999,
          quantity: _quantities[1],
          isSelected: _selectedItems[1],
          onQuantityChanged: (value) => setState(() => _quantities[1] = value),
          onSelected: (value) => setState(() => _selectedItems[1] = value),
        ),
      ],
    );
  }

  Widget _buildPriceDetails() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          _buildPriceRow('Price', '1,300'),
          _buildPriceRow('Discount', '-7,800'),
          _buildPriceRow('Delivery Charges', '49'),
          Divider(height: 24),
          _buildPriceRow('Total Amount', '14,900', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildSimilarProducts() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Similar Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => SimilarProductCard(
                image: 'assets/similar$index.jpg',
                title: 'Similar Product ${index + 1}',
                price: 1999 + (index * 500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade300)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('₹ $_totalAmount', 
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () {/* Navigate to checkout */},
              child: Text('Proceed to Buy', 
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600)),
          Text('₹$value', 
              style: TextStyle(
                fontSize: isTotal ? 18 : 16,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              )),
        ],
      ),
    );
  }
}

class CartProductItem extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final int quantity;
  final bool isSelected;
  final ValueChanged<int> onQuantityChanged;
  final ValueChanged<bool> onSelected;

  const CartProductItem({
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
    required this.isSelected,
    required this.onQuantityChanged,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(value: isSelected, onChanged: (v) => onSelected(v!)),
          SizedBox(width: 16),
          Image.asset(image, width: 80, height: 80, fit: BoxFit.cover),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('₹$price', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                _buildQuantitySelector(),
                SizedBox(height: 8),
                Text('Expected delivery by 13 May',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove, size: 20),
            onPressed: () => onQuantityChanged(quantity - 1),
          ),
          Text('$quantity', style: TextStyle(fontSize: 16)),
          IconButton(
            icon: Icon(Icons.add, size: 20),
            onPressed: () => onQuantityChanged(quantity + 1),
          ),
        ],
      ),
    );
  }
}

class SimilarProductCard extends StatelessWidget {
  final String image;
  final String title;
  final double price;

  const SimilarProductCard({
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, width: 160, height: 120, fit: BoxFit.cover),
          SizedBox(height: 8),
          Text(title, 
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2, overflow: TextOverflow.ellipsis),
          SizedBox(height: 4),
          Text('₹$price', style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}