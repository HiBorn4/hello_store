import 'package:flutter/material.dart';
import '../controllers/category_controller.dart';
import '../widgets/custom_dropdown.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // Controller instance
  final CategoryController _controller = CategoryController();

  // UI State
  int _currentIndex = 0;
  final PageController _bannerController = PageController();
  int _currentBannerPage = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
  backgroundColor: Colors.white, // ✅ Set background to white
  appBar: AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: screenHeight * 0.07,
    leadingWidth: screenWidth * 0.12,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_outlined,
        color: Colors.black,
        size: screenWidth * 0.06,
      ),
      onPressed: () => Navigator.of(context).pop(),
    ),
    titleSpacing: 0,
    title: _buildSearchBar(screenWidth, screenHeight),
  ),
  body: SingleChildScrollView(
    child: Column(
      children: [
        Divider(color: Colors.grey, height: screenHeight * 0.005, thickness: screenHeight * 0.002),
        _buildBannerCarousel(screenHeight, screenWidth),
        _buildCategoryGrid(screenHeight, screenWidth),
        SizedBox(height: screenHeight * 0.02),
        Divider(color: Colors.grey, height: screenHeight * 0.005, thickness: screenHeight * 0.002),
        SizedBox(height: screenHeight * 0.02),
        _buildSectionTitle("Deals on electronics", screenWidth),
        _buildDealsCarousel(screenHeight, screenWidth),
        Divider(color: Colors.grey, height: screenHeight * 0.005, thickness: screenHeight * 0.002),
        _buildSectionTitle("Our Top Brands", screenWidth),
        _buildBrandsList(screenHeight, screenWidth),
        Divider(color: Colors.grey, height: screenHeight * 0.04, thickness: screenHeight * 0.002),
        _buildSectionTitle("Featured Products", screenWidth),
        Divider(color: Colors.grey, height: screenHeight * 0.04, thickness: screenHeight * 0.002),
        _buildProductGrid(screenHeight, screenWidth),
      ],
    ),
  ),
  bottomNavigationBar: _buildBottomNavBar(screenWidth),
);

  }

  Widget _buildSearchBar(double width, double height) {
    return Container(
      height: height * 0.055,
      margin: EdgeInsets.only(right: width * 0.03),
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(width * 0.035),
        border: Border.all(color: Colors.grey[500]!, width: 1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: width * 0.055,
          ),
          SizedBox(width: width * 0.02),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search "pooja needs"',
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(fontSize: width * 0.038),
              ),
            ),
          ),
          Container(
            height: height * 0.025,
            width: 1,
            color: Colors.grey[400],
            margin: EdgeInsets.symmetric(horizontal: width * 0.02),
          ),
          Icon(
            Icons.mic,
            color: Colors.grey,
            size: width * 0.055,
          ),
        ],
      ),
    );
  }

  Widget _buildBannerCarousel(double height, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.04),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width * 0.04),
        child: Image.asset(
          'assets/category_poster.png',
          fit: BoxFit.cover,
          height: height * 0.22,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(double height, double width) {
    final int crossAxisCount = 2;
    final int itemCount = _controller.categories.length;
    final int columns = (itemCount / crossAxisCount).ceil();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.04),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(columns, (columnIndex) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(crossAxisCount, (rowIndex) {
                int actualIndex = columnIndex * crossAxisCount + rowIndex;
                if (actualIndex >= itemCount) {
                  return SizedBox(width: width * 0.22, height: height * 0.12);
                }
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height*0.008),
                  child: SizedBox(
                    width: width * 0.22,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          child: Image.asset(
                            _controller.categories[actualIndex]['image'],
                            width: width * 0.16,
                            height: width * 0.16,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: height * 0.005),
                        Text(
                          _controller.categories[actualIndex]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: width * 0.032, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: width * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildDealsCarousel(double height, double width) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: height * 0.015),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Horizontal scrollable cards
        SizedBox(
          height: height * 0.41,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            itemCount: _controller.deals.length,
            itemBuilder: (context, index) {
              final deal = _controller.deals[index];

              return Container(
                width: width * 0.45,
                margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.035),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(width * 0.035)),
                      child: Image.asset(
                        deal['image'],
                        height: height * 0.22,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Content Section
                    Padding(
                      padding: EdgeInsets.all(width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Name
                          Text(
                            deal['name'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.036,
                            ),
                          ),
                          SizedBox(height: height * 0.005),

                          // Rating & Count
                          Row(
                            children: [
                              Text(
                                "${deal['rating']}.0",
                                style: TextStyle(fontSize: width * 0.032),
                              ),
                              SizedBox(width: width * 0.01),
                              ...List.generate(
                                5,
                                (i) => Icon(
                                  Icons.star,
                                  color: i < deal['rating']
                                      ? Colors.amber
                                      : Colors.grey.shade300,
                                  size: width * 0.04,
                                ),
                              ),
                              SizedBox(width: width * 0.01),
                              Text(
                                "4764",
                                style: TextStyle(fontSize: width * 0.032),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.005),

                          // Bought Count
                          Text(
                            deal['bought'],
                            style: TextStyle(
                              fontSize: width * 0.032,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: height * 0.005),

                          // Pricing
                          Row(
                            children: [
                              Text(
                                "₹${deal['originalPrice']}",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black,
                                  fontSize: width * 0.05,
                                ),
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                "₹${deal['discountPrice']}",
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width * 0.05,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.005),

                          // Limited Time Deal Tag
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.02,
                              vertical: height * 0.002,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(width * 0.01),
                            ),
                            child: Text(
                              "Limited Time Deal",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        SizedBox(height: height * 0.03),

        // View All Products Link
        Padding(
          padding: EdgeInsets.only(left: width * 0.04),
          child: GestureDetector(
            onTap: () {
              // TODO: Handle navigation
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View All Products",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.052,
                  ),
                ),
                SizedBox(width: width * 0.03),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.green,
                  size: width * 0.055,
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: height * 0.02),
      ],
    ),
  );
}


  Widget _buildBrandsList(double height, double width) {
    final int crossAxisCount = 2;
    final int itemCount = 8;
    final int columns = (itemCount / crossAxisCount).ceil();

    return SizedBox(
      height: height * 0.13,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: Row(
          children: List.generate(columns, (columnIndex) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(crossAxisCount, (rowIndex) {
                int actualIndex = columnIndex * crossAxisCount + rowIndex;
                if (actualIndex >= itemCount) {
                  return SizedBox(width: width * 0.18, height: height * 0.12);
                }
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  child: SizedBox(
                    width: width * 0.23,
                    height: height * 0.045,
                    child: Image.asset(
                      'assets/brands/brand${actualIndex + 1}.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildProductGrid(double height, double width) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
  padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.015),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisSize: MainAxisSize.min,  // Prevents children from trying to expand
      children: [
        CustomDropdown(
          label: "Department",
          items: ["Departments", "All", "Electronics", "Kitchen"],
        ),
        const SizedBox(width: 8),
        CustomDropdown(
          label: "Reviews",
          items: ["Reviews", "4★", "3★"],
        ),
        const SizedBox(width: 8),
        CustomDropdown(
          label: "Sort by",
          items: ["Sort by", "Popular", "Low", "High"],
        ),
      ],
    ),
  ),
),





      // Product List (1 per row)
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.007,
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.04),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    // Image Section
                    ClipRRect(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(width * 0.04),
                      ),
                      child: Image.asset(
                        'assets/product.png',
                        height: height * 0.23,
                        width: width * 0.35,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Product Details
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(width * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Travel Steamer iron for Clothes, 1200W Portable...",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.038,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: height * 0.005),
                            Text(
                              "23 centimeters",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: height * 0.005),
                            Row(
                              children: [
                                ...List.generate(
                                  5,
                                  (i) => Icon(
                                    Icons.star,
                                    color: i < 4 ? Colors.orange : Colors.grey,
                                    size: width * 0.04,
                                  ),
                                ),
                                SizedBox(width: width * 0.02),
                                Text(
                                  "4,784",
                                  style: TextStyle(
                                    fontSize: width * 0.03,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: height * 0.005),
                            Text(
                              "50+ bought in past month",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: height * 0.005),
                            Row(
                              children: [
                                Text(
                                  "₹189",
                                  style: TextStyle(
                                    fontSize: width * 0.038,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: width * 0.015),
                                Text(
                                  "₹199",
                                  style: TextStyle(
                                    fontSize: width * 0.03,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.005),
                            Text(
                              "Free delivery Thu, 10 Apr",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              "Save extra with No cost EMI",
                              style: TextStyle(
                                fontSize: width * 0.03,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

               

                
              ],
            ),
          ),
        ),
      ),
    ],
  );
}



  Widget _buildBottomNavBar(double width) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: width * 0.032,
      unselectedFontSize: width * 0.032,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, size: width * 0.065), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search, size: width * 0.065), label: 'Order Again'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border, size: width * 0.065), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, size: width * 0.065), label: 'Cart'),
      ],
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }
}
