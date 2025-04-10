import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: CategoryScreen(),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _currentIndex = 0;
  final PageController _bannerController = PageController();
  int _currentBannerPage = 0;
  final List<bool> _favorites = List.generate(8, (index) => false);

  final List<Map<String, dynamic>> categories = [
    {'name': 'T.V. &...', 'icon': Icons.tv},
    {'name': 'Washing...', 'icon': Icons.local_laundry_service},
    {'name': 'Refrigera...', 'icon': Icons.kitchen},
    {'name': 'Kitchen...', 'icon': Icons.blender},
    {'name': 'Small...', 'icon': Icons.blender},
    {'name': 'Air...', 'icon': Icons.ac_unit},
    {'name': 'Coolers...', 'icon': Icons.water_damage},
    {'name': 'Fan...', 'icon': Icons.electric_bolt},
    {'name': 'Other...', 'icon': Icons.more_horiz},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text("Shopsy", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBannerCarousel(),
            _buildCategoryGrid(),
            _buildSectionTitle("Deals on electronics"),
            _buildDealsCarousel(),
            _buildSectionTitle("Our Top Brands"),
            _buildBrandsList(),
            _buildSectionTitle("Featured Products"),
            _buildProductGrid(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  Widget _buildBannerCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _bannerController,
            itemCount: 3,
            onPageChanged: (index) => setState(() => _currentBannerPage = index),
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // image: DecorationImage(
                //   image: NetworkImage('https://picsum.photos/800/200?random=$index'),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Restaurant Equipment's\nUPTO 70%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) => Container(
            width: 8,
            height: 8,
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentBannerPage == index ? Colors.blue : Colors.grey,
            ),
          )),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildCategoryGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) => Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(categories[index]['icon'], size: 32),
            SizedBox(height: 8),
            Text(categories[index]['name'], 
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
          TextButton(
            onPressed: () {},
            child: Text("View All",
              style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  Widget _buildDealsCarousel() {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          width: 160,
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                //   child: Image.network(
                //     'https://picsum.photos/200/150?random=$index',
                //     height: 120,
                //     width: double.infinity,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Product ${index + 1}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text("₹2999",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            )),
                          SizedBox(width: 8),
                          Text("₹2189",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            )),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: List.generate(5, (i) => Icon(
                          Icons.star,
                          color: i < 4 ? Colors.amber : Colors.grey,
                          size: 16,
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandsList() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: 5,
        itemBuilder: (context, index) => Container(
          width: 80,
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          // child: ClipOval(
            // child: Image.network(
            //   'https://picsum.photos/80?random=$index',
            //   fit: BoxFit.cover,
            // ),
            child: Container(),
          ),
        ),
      );
    
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 8,
      itemBuilder: (context, index) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                //   child: Image.network(
                //     'https://picsum.photos/200/250?random=$index',
                //     height: 150,
                //     width: double.infinity,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Product ${index + 1}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Row(
                        children: List.generate(5, (i) => Icon(
                          Icons.star,
                          color: i < 4 ? Colors.amber : Colors.grey,
                          size: 16,
                        )),
                      ),
                      SizedBox(height: 4),
                      Text("₹2189",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  _favorites[index] ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: () => setState(() => _favorites[index] = !_favorites[index]),
              ),
            ),
            if (index % 3 == 0)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text("SALE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    )),
                ),
              ),
          ],
        ),
      ),
    );
  }
}