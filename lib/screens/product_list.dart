import 'package:flutter/material.dart';
import '../widgets/category_product_widget.dart';
import '../widgets/custom_dropdown.dart';

class ProductListingScreen extends StatefulWidget {
  @override
  _ProductListingScreenState createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  int _currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  final List<String> filters = [
    'Filter',
    'Price',
    'Sort By',
    'Brand',
    'Discount',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Scaffold(
      appBar: _buildAppBar(screenSize),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Filter row as a sliver
          _buildFilterRow(screenSize),

          // First 4 products (2 rows)
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                childAspectRatio: 0.53,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => ProductCard(
                  screenWidth: screenWidth,
                  screenHeight: screenSize.height,
                ),
                childCount: 4,
              ),
            ),
          ),

          // Brand section
          _buildSponsoredSection(screenWidth),

          // First 4 products (2 rows)
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                childAspectRatio: 0.53,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => ProductCard(
                  screenWidth: screenWidth,
                  screenHeight: screenSize.height,
                ),
                childCount: 4,
              ),
            ),
          ),

          // Brand section
          _buildBrandSection(screenWidth),

          // First 4 products (2 rows)
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                childAspectRatio: 0.53,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => ProductCard(
                  screenWidth: screenWidth,
                  screenHeight: screenSize.height,
                ),
                childCount: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(Size screenSize) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: screenSize.height * 0.07,
      leadingWidth: screenSize.width * 0.12,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
          size: screenSize.width * 0.06,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      titleSpacing: 0,
      title: AppSearchBar(screenSize: screenSize),
    );
  }

  // Filter row converted to a SliverToBoxAdapter
  SliverToBoxAdapter _buildFilterRow(Size screenSize) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.03,
          vertical: screenSize.height * 0.015,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              CustomDropdown(
                label: "Filters",
                items: ["Filters", "All", "Electronics", "Kitchen"],
              ),
              SizedBox(width: 8),
              CustomDropdown(label: "Price", items: ["Price", "4★", "3★"]),
              SizedBox(width: 8),
              CustomDropdown(
                label: "Sort by",
                items: ["Sort by", "Popular", "Low", "High"],
              ),
              SizedBox(width: 8),
              CustomDropdown(
                label: "Custom",
                items: ["Custom", "Popular", "Low", "High"],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Brand section as a SliverToBoxAdapter
  SliverToBoxAdapter _buildSponsoredSection(double screenWidth) {

    final screenSize = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Sponsored',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.info, color: Colors.grey, size: 20),
            ],
          ),
          ProductListItemWidget(screenSize: screenSize),
          
        ],
      ),
    );
  }

  // Brand section as a SliverToBoxAdapter
  SliverToBoxAdapter _buildBrandSection(double screenWidth) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Brands related to your search',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Sponsored',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.info, color: Colors.grey, size: 20),
            ],
          ),
          Container(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder:
                  (context, index) => Container(
                    width: 160,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/brand_deal.png",
                        ), // ✅ Fixed here
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppSearchBar extends StatelessWidget {
  final Size screenSize;
  const AppSearchBar({required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.055,
      margin: EdgeInsets.only(right: screenSize.width * 0.03),
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenSize.width * 0.035),
        border: Border.all(color: Colors.grey[500]!, width: 1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: screenSize.width * 0.055,
          ),
          SizedBox(width: screenSize.width * 0.02),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Electronics',
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(fontSize: screenSize.width * 0.038),
              ),
            ),
          ),
          Container(
            height: screenSize.height * 0.025,
            width: 1,
            color: Colors.grey[400],
            margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
          ),
          Icon(Icons.mic, color: Colors.grey, size: screenSize.width * 0.055),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const ProductCard({required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/deals_electronic.png',
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.42,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Samsung Refrigerator 255L',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                '4.5 ',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Icon(
                                Icons.star_half,
                                color: Colors.amber,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '6537',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),

                          SizedBox(height: 4),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward_outlined,
                                    color: Colors.green,
                                    size: 16,
                                  ),
                                  Text(
                                    '54%',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8),
                              Text(
                                '₹32,999',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '₹45,999',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.02,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 36),
    backgroundColor: Colors.green,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // ⬅️ Customize the roundness
    ),
  ),
  child: Text(
    'Add to Cart',
    style: TextStyle(
      fontSize: screenWidth * 0.035,
      color: Colors.white,
    ),
  ),
),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
