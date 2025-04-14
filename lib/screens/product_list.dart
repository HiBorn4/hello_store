import 'package:flutter/material.dart';

class ProductListingScreen extends StatefulWidget {
  @override
  _ProductListingScreenState createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  final List<String> filters = ['Filter', 'Price', 'Sort By', 'Brand', 'Discount'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            Text('Electronics',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
            Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ],
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          _buildFilterRow(screenWidth),
          _buildProductGrid(screenWidth, isTablet),
          _buildBrandSection(screenWidth),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(screenWidth),
    );
  }

  SliverToBoxAdapter _buildFilterRow(double screenWidth) {
    return SliverToBoxAdapter(
      child: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filters.length,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(filters[index],
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.black87)),
            ),
          ),
        ),
      ),
    );
  }

  SliverGrid _buildProductGrid(double screenWidth, bool isTablet) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ProductCard(screenWidth: screenWidth),
        childCount: 12,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 3 : 2,
        childAspectRatio: 0.75,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
    );
  }

  SliverToBoxAdapter _buildBrandSection(double screenWidth) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text('Brands related to your search',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) => Container(
                width: 100,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/100?random=$index'),
                    fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(double screenWidth) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedFontSize: screenWidth * 0.03,
      unselectedFontSize: screenWidth * 0.03,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }
}

class ProductCard extends StatelessWidget {
  final double screenWidth;

  const ProductCard({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                    child: Image.network(
                      'https://picsum.photos/200?random=${DateTime.now().millisecond}',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4)),
                      child: Text('25% OFF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.03)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Samsung Refrigerator 255L',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w500)),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        ...List.generate(4, (i) => Icon(Icons.star, color: Colors.amber, size: 16)),
                        Icon(Icons.star_half, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text('4.5 (1.2k)',
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text('₹32,999',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.red)),
                        SizedBox(width: 8),
                        Text('₹45,999',
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough)),
                      ],
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 36),
                        backgroundColor: Colors.green),
                      child: Text('Add to Cart',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            left: 8,
            child: IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}