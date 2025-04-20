import 'package:flutter/material.dart';
import '../controllers/category_controller.dart';
import '../widgets/category_product_widget.dart';
import '../widgets/custom_dropdown.dart';
import 'product_list.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController _controller = CategoryController();
  int _currentIndex = 0;
  final PageController _bannerController = PageController();
  int _currentBannerPage = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(screenSize),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DividerLine(),
            _buildBannerCarousel(screenSize),
            _buildCategoryGrid(screenSize),
            const SectionSpacer(),
            SectionHeader(title: "Deals on electronics", screenSize: screenSize),
            _buildDealsCarousel(screenSize),
            const SectionSpacer(),
            SectionHeader(title: "Our Top Brands", screenSize: screenSize),
            _buildBrandsList(screenSize),
            const SectionSpacer(height: 0.01),
            SectionHeader(title: "Featured Products", screenSize: screenSize),
            const SectionSpacer(height: 0.01),
            _buildProductGrid(screenSize),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(screenSize.width),
    );
  }

  PreferredSizeWidget _buildAppBar(Size screenSize) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    toolbarHeight: screenSize.height * 0.07,
    leadingWidth: screenSize.width * 0.12,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_outlined, color: Colors.black, size: screenSize.width * 0.06),
      onPressed: () => Navigator.of(context).pop(),
    ),
    titleSpacing: 0,
    title: AppSearchBar(screenSize: screenSize),
  );
}


  Widget _buildBannerCarousel(Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02, horizontal: screenSize.width * 0.04),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(screenSize.width * 0.04),
        child: Image.asset(
          'assets/category_poster.png',
          fit: BoxFit.cover,
          height: screenSize.height * 0.22,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildCategoryGrid(Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01, horizontal: screenSize.width * 0.04),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GridRowBuilder(
          itemCount: _controller.categories.length,
          crossAxisCount: 2,
          itemBuilder: (index) => CategoryGridItem(
            screenSize: screenSize,
            image: _controller.categories[index]['image'],
            title: _controller.categories[index]['name'],
          ),
        ),
      ),
    );
  }

  Widget _buildDealsCarousel(Size screenSize) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.015),
      child: Column(
        children: [
          SizedBox(
            height: screenSize.height * 0.41,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
              itemCount: _controller.deals.length,
              itemBuilder: (context, index) => DealCardWidget(
                screenSize: screenSize,
                deal: _controller.deals[index],
              ),
            ),
          ),
          const ViewAllProductsButton(),
        ],
      ),
    );
  }

  Widget _buildBrandsList(Size screenSize) {
    return SizedBox(
      height: screenSize.height * 0.13,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GridRowBuilder(
          itemCount: 8,
          crossAxisCount: 2,
          itemBuilder: (index) => BrandLogoItem(
            screenSize: screenSize,
            imagePath: 'assets/brands/brand${index + 1}.png',
          ),
        ),
      ),
    );
  }

  Widget _buildProductGrid(Size screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFilterRow(screenSize),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) => ProductListItemWidget(screenSize: screenSize),
        ),
      ],
    );
  }

  Widget _buildFilterRow(Size screenSize) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03, vertical: screenSize.height * 0.015),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            CustomDropdown(label: "Department", items: ["Departments", "All", "Electronics", "Kitchen"]),
            SizedBox(width: 8),
            CustomDropdown(label: "Reviews", items: ["Reviews", "4★", "3★"]),
            SizedBox(width: 8),
            CustomDropdown(label: "Sort by", items: ["Sort by", "Popular", "Low", "High"]),
          ],
        ),
      ),
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
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Order Again'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Categories'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
      ],
      onTap: (index) => setState(() => _currentIndex = index),
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
          Icon(Icons.search, color: Colors.grey, size: screenSize.width * 0.055),
          SizedBox(width: screenSize.width * 0.02),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search "pooja needs"',
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

class GridRowBuilder extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final Widget Function(int) itemBuilder;

  const GridRowBuilder({
    required this.itemCount,
    required this.crossAxisCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final columns = (itemCount / crossAxisCount).ceil();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(columns, (columnIndex) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(crossAxisCount, (rowIndex) {
            final actualIndex = columnIndex * crossAxisCount + rowIndex;
            return actualIndex >= itemCount ? const SizedBox.shrink() : itemBuilder(actualIndex);
          }),
        );
      }),
    );
  }
}

class CategoryGridItem extends StatelessWidget {
  final Size screenSize;
  final String image;
  final String title;

  const CategoryGridItem({
    required this.screenSize,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.008),
      child: SizedBox(
        width: screenSize.width * 0.22,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(screenSize.width * 0.03),
              child: Image.asset(
                image,
                width: screenSize.width * 0.16,
                height: screenSize.width * 0.16,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenSize.height * 0.005),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenSize.width * 0.032,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DealCardWidget extends StatelessWidget {
  final Size screenSize;
  final Map<String, dynamic> deal;

  const DealCardWidget({
    required this.screenSize,
    required this.deal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width * 0.45,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenSize.width * 0.035),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(screenSize.width * 0.035),
            ),
            child: Image.asset(
              deal['image'],
              height: screenSize.height * 0.22,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenSize.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deal['name'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenSize.width * 0.036,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.005),
                _buildRatingRow(),
                SizedBox(height: screenSize.height * 0.005),
                Text(
                  deal['bought'],
                  style: TextStyle(
                    fontSize: screenSize.width * 0.032,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenSize.height * 0.005),
                _buildPriceRow(),
                SizedBox(height: screenSize.height * 0.005),
                _buildDealTag(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingRow() {
    return Row(
      children: [
        Text(
          "${deal['rating']}.0",
          style: TextStyle(fontSize: screenSize.width * 0.032),
        ),
        SizedBox(width: screenSize.width * 0.01),
        ...List.generate(5, (i) => Icon(
          Icons.star,
          color: i < deal['rating'] ? Colors.amber : Colors.grey.shade300,
          size: screenSize.width * 0.04,
        )),
        SizedBox(width: screenSize.width * 0.01),
        Text(
          "4764",
          style: TextStyle(fontSize: screenSize.width * 0.032),
        ),
      ],
    );
  }

  Widget _buildPriceRow() {
    return Row(
      children: [
        Text(
          "₹${deal['originalPrice']}",
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.black,
            fontSize: screenSize.width * 0.05,
          ),
        ),
        SizedBox(width: screenSize.width * 0.02),
        Text(
          "₹${deal['discountPrice']}",
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
            fontSize: screenSize.width * 0.05,
          ),
        ),
      ],
    );
  }

  Widget _buildDealTag() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.02,
        vertical: screenSize.height * 0.002,
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(screenSize.width * 0.01),
      ),
      child: Text(
        "Limited Time Deal",
        style: TextStyle(
          color: Colors.white,
          fontSize: screenSize.width * 0.03,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BrandLogoItem extends StatelessWidget {
  final Size screenSize;
  final String imagePath;

  const BrandLogoItem({
    required this.screenSize,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
      child: SizedBox(
        width: screenSize.width * 0.23,
        height: screenSize.height * 0.045,
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final Size screenSize;

  const SectionHeader({
    required this.title,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.04,
        vertical: screenSize.width * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenSize.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionSpacer extends StatelessWidget {
  final double height;

  const SectionSpacer({this.height = 0.01});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: screenHeight * height),
        const DividerLine(),
        SizedBox(height: screenHeight * height),
      ],
    );
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Divider(
      color: Colors.grey,
      height: screenHeight * 0.005,
      thickness: screenHeight * 0.002,
    );
  }
}

class ViewAllProductsButton extends StatelessWidget {
  const ViewAllProductsButton();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: screenSize.width * 0.04),
      child: GestureDetector(
        onTap: () {/* TODO: Handle navigation */},
        child: Row(
          children: [
            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductListingScreen()), // Replace with your actual screen
    );
  },
  child: Text(
    "View All Products",
    style: TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.w500,
      fontSize: screenSize.width * 0.052,
    ),
  ),
),

            SizedBox(width: screenSize.width * 0.03),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.green,
              size: screenSize.width * 0.055,
            ),
          ],
        ),
      ),
    );
  }
}