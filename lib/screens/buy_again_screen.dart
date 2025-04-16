import 'package:flutter/material.dart';

class BuyAgainScreen extends StatefulWidget {
  @override
  _BuyAgainScreenState createState() => _BuyAgainScreenState();
}

class _BuyAgainScreenState extends State<BuyAgainScreen> {
  final List<Product> _products = [
    Product(
      name: "Cordless Handheld Vacuum Cleaner, 15...",
      size: "25 centimeters",
      currentPrice: 189,
      discountPercent: 54,
      originalPrice: 199,
      image: 'assets/product.png',
    ),Product(
      name: "Cordless Handheld Vacuum Cleaner, 15...",
      size: "25 centimeters",
      currentPrice: 189,
      discountPercent: 54,
      originalPrice: 199,
      image: 'assets/product.png',
    ),Product(
      name: "Cordless Handheld Vacuum Cleaner, 15...",
      size: "25 centimeters",
      currentPrice: 189,
      discountPercent: 54,
      originalPrice: 199,
      image: 'assets/product.png',
    ),Product(
      name: "Cordless Handheld Vacuum Cleaner, 15...",
      size: "25 centimeters",
      currentPrice: 189,
      discountPercent: 54,
      originalPrice: 199,
      image: 'assets/product.png',
    ),
    // Add more items as needed
  ];

  List<bool> _selectedItems = [];
  List<int> _quantities = [];
  int _currentNavIndex = 1;
  bool _selectAll = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedItems = List<bool>.filled(_products.length, false);
    _quantities = List<int>.filled(_products.length, 1);
  }

  void _toggleSelectAll(bool? value) {
    setState(() {
      _selectAll = value ?? false;
      _selectedItems = List<bool>.filled(_products.length, _selectAll);
    });
  }

  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      _quantities[index] = newQuantity.clamp(1, 999);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: width * 0.06),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: width * 0.05,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.001),
          child: Divider(height: 1, color: Colors.grey[300]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
            child: Text(
              'Buy again',
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          _buildSearchRow(width, height),
          _buildSelectAllRow(width, height),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              itemCount: _products.length,
              itemBuilder: (context, index) => _buildProductItem(index, width, height),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchRow(double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.015),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: height * 0.05,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(width * 0.02),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search products',
                  prefixIcon: Icon(Icons.search, color: Colors.grey, size: width * 0.06),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03),
                ),
              ),
            ),
          ),
          SizedBox(width: width * 0.03),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: height * 0.05,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.02),
                  border: Border.all(color: Colors.grey),
                ),
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.filter_list, color: Colors.black87, size: width * 0.05),
                    SizedBox(width: width * 0.015),
                    Text(
                      'Filter',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectAllRow(double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Row(
        children: [
          Checkbox(
            value: _selectAll,
            onChanged: _toggleSelectAll,
            activeColor: Colors.green,
            side: BorderSide(color: Colors.green, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.01),
            ),
          ),
          Text('Select all items', style: TextStyle(fontSize: width * 0.04)),
        ],
      ),
    );
  }

  Widget _buildProductItem(int index, double width, double height) {
    final product = _products[index];
    final isSelected = _selectedItems[index];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.01),
      padding: EdgeInsets.all(width * 0.015),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(width * 0.02),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: width * 0.2,
                height: width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.02),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(width * 0.015),
                  child: Image.asset(product.image, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: width * 0.01,
                left: width * 0.01,
                child: GestureDetector(
                  onTap: () => setState(() => _selectedItems[index] = !isSelected),
                  child: Container(
                    width: width * 0.05,
                    height: width * 0.05,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.white,
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(width * 0.01),
                    ),
                    child: isSelected
                        ? Icon(Icons.check, color: Colors.white, size: width * 0.03)
                        : null,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: width * 0.025),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: height * 0.005),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.003),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(width * 0.015),
                  ),
                  child: Text(
                    product.size,
                    style: TextStyle(fontSize: width * 0.03, color: Colors.white),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Icon(Icons.arrow_downward, color: Colors.green, size: width * 0.04),
                    Text(
                      '(${product.discountPercent}%)',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Text(
                      '₹${product.currentPrice}',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: width * 0.015),
                    Text(
                      '₹${product.originalPrice}',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.012),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.004),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(width * 0.015),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => _updateQuantity(index, _quantities[index] - 1),
                        child: Icon(Icons.remove, color: Colors.green, size: width * 0.045),
                      ),
                      SizedBox(width: width * 0.03),
                      Text(
                        '${_quantities[index]}',
                        style: TextStyle(color: Colors.green, fontSize: width * 0.035),
                      ),
                      SizedBox(width: width * 0.03),
                      GestureDetector(
                        onTap: () => _updateQuantity(index, _quantities[index] + 1),
                        child: Icon(Icons.add, color: Colors.green, size: width * 0.045),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String size;
  final int currentPrice;
  final int discountPercent;
  final int originalPrice;
  final String image;

  Product({
    required this.name,
    required this.size,
    required this.currentPrice,
    required this.discountPercent,
    required this.originalPrice,
    required this.image,
  });
}
