import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_store/controllers/auth_controller.dart';
import 'package:hello_store/controllers/homepage_controller.dart';
import 'package:hello_store/screens/category_screen.dart';
import 'package:hello_store/screens/login_screen2.dart';

var cartitems = 0.obs;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final authcontroller = Get.find<AuthController>();
  final homecontroller = Get.put(HomePageController());

  var data = [
    {"img": "assets/images/summer.png", "text": "Trending"},
    {"img": "assets/images/home/item.png", "text": "Restaurant\n Equpiment"},
    {
      "img": "assets/images/home/utensil.png",
      "text": "Commercial\n Refrigeration",
    },
    {"img": "assets/images/home/item.png", "text": "Electronics"},
    {"img": "assets/images/home/item.png", "text": "Meat"},
    {"img": "assets/images/home/item.png", "text": "Bridal"},
    {"img": "assets/images/home/item.png", "text": "Furniture"},
  ];

  @override
  Widget build(BuildContext context) {
    homecontroller.getCurrentLocation();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: CustomScrollView(
          slivers: [
            // Sticky Header
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyHeaderDelegate(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFCFF4FC), Color(0xFFFAE3D1)],
                    ),
                  ),
                  child: _buildAppBar(context, height, width),
                ),

                height:
                    height * 0.16, // Combined height of both previous headers
              ),
            ),

            SliverToBoxAdapter(child: _buildmainthings(context, height, width)),
            SliverToBoxAdapter(
              child: previouslyBoughtSection(context, height, width),
            ),
            SliverToBoxAdapter(
              child: bestsellerSection(context, height, width),
            ),
            SliverToBoxAdapter(child: buildStealDealsSection()),
            SliverToBoxAdapter(child: buildUtensilsAndCookwareSection()),
            SliverToBoxAdapter(child: buildGroceryAndKitchenSection()),
            SliverToBoxAdapter(child: shopByStore(context, height, width)),
            SliverToBoxAdapter(child: buildStealDealsHappyCulturesSection()),
            SliverToBoxAdapter(child: buildStealDealsFootwearSection()),
            SliverToBoxAdapter(child: buildStealDealsProtronicsSection()),
            SliverToBoxAdapter(child: todaysEditSection(context)),
            SliverToBoxAdapter(child: mostLovedBrandsSection(context)),
            SliverToBoxAdapter(child: buildmostLovedBrandsSection2()),
            SliverToBoxAdapter(child: gadgetCentralSection()),
            SliverToBoxAdapter(child: SizedBox(height: height * 0.04)),
            SliverToBoxAdapter(child: buildmostLovedBrandsSection2()),
            SliverToBoxAdapter(child: SizedBox(height: height * 0.04)),
            SliverToBoxAdapter(child: buildpinkBannerSection()),
            SliverToBoxAdapter(child: SizedBox(height: height * 0.04)),
            SliverToBoxAdapter(child: buildsavingsBannerSection()),
            SliverToBoxAdapter(child: SizedBox(height: height * 0.04)),
            SliverToBoxAdapter(child: recommendedSection(context)),
            SliverToBoxAdapter(child: recommendedSection2(context)),

            SliverToBoxAdapter(child: SizedBox(height: height * 0.15)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, var height, var width) {
    GlobalKey _buttonKey = GlobalKey();
    return Column(
      children: [
        // Header Section
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Container(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "HELLO ",
                          style: GoogleFonts.outfit(
                            color: Color(0xFF0118BAB),
                            fontSize: height * 0.024,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "STORES",
                          style: GoogleFonts.outfit(
                            color: Color(0xFFF15A29),
                            fontSize: height * 0.024,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.009),
                    Row(
                      children: [
                        Obx(
                          () => Text(
                            '${homecontroller.street} ${homecontroller.sublocality} ${homecontroller.locality}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                              color: Color.fromRGBO(61, 61, 61, 1),
                              fontSize: height * 0.015,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.01),
                        SvgPicture.asset("assets/images/chevron_down.svg"),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  key: _buttonKey,
                  onTap: () {
                    _showPopupAboveButton(context, _buttonKey);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                          size: height * 0.04,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Search Bar Section
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: TextField(
            style: GoogleFonts.outfit(fontSize: height * 0.017),
            decoration: InputDecoration(
              hintText: 'Search "pooja needs"',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset('assets/images/home/search.svg'),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 8, 4),
                child: SvgPicture.asset(
                  'assets/images/home/Frame 1321314348.svg',
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black, width: 1),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildmainthings(BuildContext context, var height, var width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category header with "See all" text
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Category",
                  style: GoogleFonts.inter(
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333),
                  ),
                ),
              ),
              Text(
                "See all",
                style: GoogleFonts.inter(
                  fontSize: height * 0.014,
                  color: Color(0xff666666),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        Container(
          height: height * 0.145,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
            child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => CategoryScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.08,
                            child: Image.asset("${data[index]['img']}"),
                          ),
                          SizedBox(height: height * 0.007),
                          Text(
                            "${data[index]['text']}",
                            style: GoogleFonts.outfit(fontSize: height * 0.015),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // PREVIOUSLY BOUGHT SECTION
  Widget previouslyBoughtSection(BuildContext context, var height, var width) {
    var productData = [
      {
        "img": "assets/images/home/frame4.png",
        "brand": "HAPPY CULTURES",
        "name": "great sleep awaits",
        "currentPrice": "₹189",
        "originalPrice": "₹199",
        "discount": "53% off",
        "purchaseCount": "20+ bought in past month",
        "rating": "4.3",
      },
      {
        "img": "assets/images/home/stove.png",
        "brand": "HAPPY CULTURES",
        "name": "great sleep awaits",
        "currentPrice": "₹189",
        "originalPrice": "₹199",
        "discount": "53% off",
        "purchaseCount": "20+ bought in past month",
        "rating": "4.3",
      },
      {
        "img": "assets/images/home/frame4.png",
        "brand": "HAPPY CULTURES",
        "name": "great sleep awaits",
        "currentPrice": "₹189",
        "originalPrice": "₹199",
        "discount": "53% off",
        "purchaseCount": "20+ bought in past month",
        "rating": "4.3",
      },
      {
        "img": "assets/images/home/stove.png",
        "brand": "HAPPY CULTURES",
        "name": "great sleep awaits",
        "currentPrice": "₹189",
        "originalPrice": "₹199",
        "discount": "53% off",
        "purchaseCount": "20+ bought in past month",
        "rating": "4.3",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "PREVIOUSLY BOUGHT",
                style: GoogleFonts.inter(
                  fontSize: height * 0.018,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333),
                ),
              ),
              Text(
                "VIEW ALL",
                style: GoogleFonts.inter(
                  fontSize: height * 0.014,
                  color: Color(0xff666666),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.32,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 12),
            itemCount: productData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Container(
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product image with rating and add button overlay
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 135,
                              width: 135,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: Image.asset(
                                  "${productData[index]['img']}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          // Rating badge
                          Positioned(
                            bottom: 8,
                            left: 8,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    "${productData[index]['rating']}",
                                    style: GoogleFonts.outfit(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Add to cart button
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Color(0xFFF4BA8E),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "ADD",
                                style: GoogleFonts.outfit(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Product details
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Brand name
                            Text(
                              "${productData[index]['brand']}",
                              style: GoogleFonts.outfit(
                                fontSize: 10,
                                color: Color(0xff808080),
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2),
                            // Product name
                            Text(
                              "${productData[index]['name']}",
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff333333),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            // Price information
                            Row(
                              children: [
                                Text(
                                  "${productData[index]['currentPrice']}",
                                  style: GoogleFonts.outfit(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "${productData[index]['originalPrice']}",
                                  style: GoogleFonts.outfit(
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "${productData[index]['discount']}",
                                  style: GoogleFonts.outfit(
                                    fontSize: 12,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            // Purchase history
                            Text(
                              "${productData[index]['purchaseCount']}",
                              style: GoogleFonts.outfit(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget bestsellerSection(BuildContext context, var height, var width) {
    // Category data with appropriate labels from the design
    var categoryData = [
      {"img": "assets/images/home/fruits.png", "text": "Grocery and veggies"},
      {
        "img": "assets/images/home/equipements.png",
        "text": "Restaurant equipments",
      },
      {"img": "assets/images/home/fruits.png", "text": "Vegetables and fruits"},
      {"img": "assets/images/home/fruits.png", "text": "Onions and cereals"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 28, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BEST SELLING",
                style: GoogleFonts.inter(
                  fontSize: height * 0.018,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.arrow_forward, size: 20, color: Color(0xff666666)),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.4,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          "${categoryData[index]['img']}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.6),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Category text at bottom
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Text(
                          "${categoryData[index]['text']}",
                          style: GoogleFonts.outfit(
                            fontSize: height * 0.015,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildStealDealsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Text(
            'STEAL DEALS: LIMITED UNITS ONLY',
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 160,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                // First limited time offer card
                buildStealDealCard(),
                SizedBox(width: 16), // Add spacing between cards
                // Second card
                buildStealDealCard(),
                SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildStealDealCard() {
    return Container(
      width: 280,
      height: 154,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFABA8E), Color(0xFFCFF2FC)],
        ),
      ),
      child: Stack(
        children: [
          // Text content on the left side
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Limited time\noffer',
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.outfit(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'offer upto ',
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '70%',
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Fruit image on the right side
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/home/offer.png',
              width: 220,
              height: 170,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.shopping_basket,
                    size: 60,
                    color: Colors.black38,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 2. Utensils and Cookware Section Widget

  Widget buildUtensilsAndCookwareSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: const Text(
            'UTENSILS & COOKWARE',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCategoryCircle(
                    imagePath: 'assets/images/home/fruits.png',
                    backgroundImagePath: 'assets/images/home/pink.png',
                    label: 'Vegetables and\nfruits',
                  ),
                  buildCategoryCircle(
                    imagePath: 'assets/images/home/cereals.png',
                    backgroundImagePath: 'assets/images/home/pink.png',
                    label: 'Dairy products',
                  ),
                  buildCategoryCircle(
                    imagePath: 'assets/images/home/fruits.png',
                    backgroundImagePath: 'assets/images/home/pink.png',
                    label: 'Grains and\ncereals',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCategoryCircle(
                    imagePath: 'assets/images/home/fruits.png',
                    backgroundImagePath: 'assets/images/home/pink.png',
                    label: 'Vegetables and\nfruits',
                  ),
                  buildCategoryCircle(
                    imagePath: 'assets/images/home/cereals.png',
                    backgroundImagePath: 'assets/images/home/pink.png',
                    label: 'Dairy products',
                  ),
                  buildCategoryCircle(
                    imagePath: 'assets/images/home/fruits.png',
                    backgroundImagePath: 'assets/images/home/pink.png',
                    label: 'Grains and\ncereals',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCategoryCircle({
    required String imagePath,
    required String backgroundImagePath,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(backgroundImagePath),
              fit: BoxFit.cover,
            ),
          ),
          // Overlay the main image on top
          child: Center(
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.image_not_supported,
                    color: Colors.white,
                    size: 24,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  // 3. Grocery and Kitchen Section Widget
  Widget buildGroceryAndKitchenSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'GROCERY & KITCHEN',
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildKitchenCategoryCircle(
                    imagePath: 'assets/images/home/fruits.png',
                    backgroundImagePath: 'assets/images/home/grey.png',
                    label: 'Vegetables and\nfruits',
                  ),
                  buildKitchenCategoryCircle(
                    imagePath: 'assets/images/home/cereals.png',
                    backgroundImagePath: 'assets/images/home/grey.png',
                    label: 'Dairy\nproducts',
                  ),
                  buildKitchenCategoryCircle(
                    imagePath: 'assets/images/home/fruits.png',
                    backgroundImagePath: 'assets/images/home/grey.png',
                    label: 'Grains and\ncereals',
                  ),
                  buildKitchenCategoryCircle(
                    imagePath: 'assets/images/home/cereals.png',
                    backgroundImagePath: 'assets/images/home/grey.png',
                    label: 'Meat and\npoultry',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildKitchenCategoryCircle(
                    imagePath: 'assets/images/home/fruits.png',
                    backgroundImagePath: 'assets/images/home/grey.png',
                    label: 'Vegetables and\nfruits',
                  ),
                  buildKitchenCategoryCircle(
                    imagePath: 'assets/images/home/cereals.png',
                    backgroundImagePath: 'assets/images/home/grey.png',
                    label: 'Dairy\nproducts',
                  ),
                  buildKitchenCategoryCircle(
                    imagePath: 'assets/images/home/fruits.png',
                    backgroundImagePath: 'assets/images/home/grey.png',
                    label: 'Grains and\ncereals',
                  ),
                  buildKitchenCategoryCircle(
                    imagePath: 'assets/images/home/cereals.png',
                    backgroundImagePath: 'assets/images/home/grey.png',
                    label: 'Meat and\npoultry',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildKitchenCategoryCircle({
    required String imagePath,
    required String backgroundImagePath,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(backgroundImagePath),
              fit: BoxFit.cover,
            ),
          ),
          // Overlay the main image on top
          child: Center(
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.image_not_supported,
                    color: Colors.white,
                    size: 24,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget shopByStore(BuildContext context, var height, var width) {
    // Category data with appropriate labels from the design
    var categoryData = [
      {"img": "assets/images/home/fruits.png", "text": "Grocery and veggies"},
      {
        "img": "assets/images/home/equipements.png",
        "text": "Restaurant equipments",
      },
      {"img": "assets/images/home/fruits.png", "text": "Vegetables and fruits"},
      {"img": "assets/images/home/fruits.png", "text": "Onions and cereals"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 28, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SHOP BY STORE",
                style: GoogleFonts.inter(
                  fontSize: height * 0.018,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff333333),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.arrow_forward, size: 20, color: Color(0xff666666)),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.4,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          "${categoryData[index]['img']}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.6),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Category text at bottom
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Text(
                          "${categoryData[index]['text']}",
                          style: GoogleFonts.outfit(
                            fontSize: height * 0.015,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // First Steal Deals Section - Happy Cultures Cards
  Widget buildStealDealsHappyCulturesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'STEAL DEALS: LIMITED UNITS ONLY',
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 360,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  buildHappyCulturesCard(
                    imagePath:
                        'assets/images/home/frame4.png', // Main product image
                    backgroundImagePath:
                        'assets/images/home/pink2.png', // Background image
                    title: 'HAPPY CULTURES',
                    description: 'great sleep awaits',
                    price: '₹189',
                    originalPrice: '₹199',
                    discount: '5% off',
                  ),
                  SizedBox(width: 12), // Gap between cards
                  buildHappyCulturesCard(
                    imagePath:
                        'assets/images/home/frame4.png', // Main product image
                    backgroundImagePath:
                        'assets/images/home/pink2.png', // Background image
                    title: 'HAPPY CULTURES',
                    description: 'great sleep awaits',
                    price: '₹189',
                    originalPrice: '₹199',
                    discount: '5% off',
                  ),
                  SizedBox(width: 12),
                  buildHappyCulturesCard(
                    imagePath:
                        'assets/images/home/frame4.png', // Main product image
                    backgroundImagePath:
                        'assets/images/home/pink2.png', // Background image
                    title: 'HAPPY CULTURES',
                    description: 'great sleep awaits',
                    price: '₹189',
                    originalPrice: '₹199',
                    discount: '5% off',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Happy Cultures Card Widget
  Widget buildHappyCulturesCard({
    required String imagePath,
    required String title,
    required String description,
    required String price,
    required String originalPrice,
    required String discount,
    String backgroundImagePath = 'assets/images/home/pink_background.png',
  }) {
    return Container(
      width: 220, // Fixed width as per specs
      height: 360, // Fixed height as per specs
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Area with Background and Main Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              width: 220, // Image width as per specs
              height: 270, // Image height as per specs
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width:
                      160, // Adjust size as needed for the main product image
                  height: 160,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image_not_supported,
                      color: Colors.white,
                      size: 40,
                    );
                  },
                ),
              ),
            ),
          ),
          // Product Details
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      originalPrice,
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      discount,
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Second Steal Deals Section - Footwear Banner
  Widget buildStealDealsFootwearSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'STEAL DEALS: LIMITED UNITS ONLY',
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 332, // Fixed height as per specs
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  buildPromotionalBanner(
                    imagePath: 'assets/images/home/footwear.png',
                  ),
                  SizedBox(width: 12), // Gap between banners
                  buildPromotionalBanner(
                    imagePath: 'assets/images/home/footwear.png',
                  ),
                  SizedBox(width: 12),
                  buildPromotionalBanner(
                    imagePath: 'assets/images/home/footwear.png',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Third Steal Deals Section - Protronics Banner
  Widget buildStealDealsProtronicsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'STEAL DEALS: LIMITED UNITS ONLY',
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 332, // Fixed height as per specs
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  buildPromotionalBanner(
                    imagePath: 'assets/images/home/protronics.png',
                  ),
                  SizedBox(width: 12), // Gap between banners
                  buildPromotionalBanner(
                    imagePath: 'assets/images/home/protronics.png',
                  ),
                  SizedBox(width: 12),
                  buildPromotionalBanner(
                    imagePath: 'assets/images/home/protronics.png',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Promotional Banner Widget for the second and third sections
  Widget buildPromotionalBanner({required String imagePath}) {
    return Container(
      width: 280, // Fixed width as per specs
      height: 332, // Fixed height as per specs
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 280,
              height: 332,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Icon(
                  Icons.image_not_supported,
                  color: Colors.grey,
                  size: 40,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget todaysEditSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            "TODAY’S EDIT: EXCLUSIVE DEALS UNLOCKED",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(children: List.generate(2, (index) => _productCard())),
        ),
      ],
    );
  }

  Widget _productCard() {
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            "IN SPOTLIGHT",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            "assets/images/home/frame4.png", // Replace with your asset
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("HAPPY CULTURES", style: TextStyle(fontSize: 10)),
                Text(
                  "mini rechargeable flashlight",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text("₹189", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 4),
                    Text(
                      "₹199",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mostLovedBrandsSection(BuildContext context) {
    final brandLogos = [
      "assets/images/home/asaya.png",
      "assets/images/home/redtape.png",
      "assets/images/home/asaya.png",
      "assets/images/home/asaya.png",
      "assets/images/home/redtape.png",
      "assets/images/home/asaya.png",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Text(
            "MOST LOVED BRANDS",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: brandLogos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              childAspectRatio: 2,
            ),
            itemBuilder: (context, index) {
              return Image.asset(brandLogos[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget buildmostLovedBrandsSection2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'MOST LOVED BRANDS',
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 360,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  buildMostLovedCard(
                    imagePath:
                        'assets/images/home/frame4.png', // Main product image
                    backgroundImagePath:
                        'assets/images/home/blue.png', // Background image
                    title: 'HAPPY CULTURES',
                    description: 'great sleep awaits',
                    price: '₹189',
                    originalPrice: '₹199',
                    discount: '5% off',
                  ),
                  SizedBox(width: 12), // Gap between cards
                  buildMostLovedCard(
                    imagePath:
                        'assets/images/home/frame4.png', // Main product image
                    backgroundImagePath:
                        'assets/images/home/blue2.png', // Background image
                    title: 'HAPPY CULTURES',
                    description: 'great sleep awaits',
                    price: '₹189',
                    originalPrice: '₹199',
                    discount: '5% off',
                  ),
                  SizedBox(width: 12),
                  buildMostLovedCard(
                    imagePath:
                        'assets/images/home/frame4.png', // Main product image
                    backgroundImagePath:
                        'assets/images/home/blue.png', // Background image
                    title: 'HAPPY CULTURES',
                    description: 'great sleep awaits',
                    price: '₹189',
                    originalPrice: '₹199',
                    discount: '5% off',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildMostLovedCard({
    required String imagePath,
    required String title,
    required String description,
    required String price,
    required String originalPrice,
    required String discount,
    String backgroundImagePath = 'assets/images/home/pink_background.png',
  }) {
    return Container(
      width: 220,
      height: 360,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Area with Background and Main Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              width: 220,
              height: 270,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: 160,
                  height: 160,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image_not_supported,
                      color: Colors.white,
                      size: 40,
                    );
                  },
                ),
              ),
            ),
          ),
          // Product Details
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      originalPrice,
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      discount,
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget gadgetCentralSection() {
    return Container(
      width: 360,
      height: 450,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xFFAF5D38), Color(0xFFD7A362)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'gadget',
                  style: GoogleFonts.cinzel(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'central',
                  style: GoogleFonts.cinzel(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          // Wire image
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/home/wire.png',
              width: 120,
              height: 120,
            ),
          ),

          Positioned(
            top: 75,
            left: 20,
            right: 0,
            bottom: 0,
            child: buildgadgetCentralWidget(),
          ),
        ],
      ),
    );
  }

  Widget buildgadgetCentralWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Container(
          height: 360,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  buildgadgetCentralCard(
                    imagePath:
                        'assets/images/home/frame4.png', // Main product image
                    backgroundImagePath:
                        'assets/images/home/blue.png', // Background image
                    title: 'HAPPY CULTURES',
                    description: 'great sleep awaits',
                    price: '₹189',
                    originalPrice: '₹199',
                    discount: '5% off',
                  ),
                  SizedBox(width: 12), // Gap between cards
                  buildgadgetCentralCard(
                    imagePath:
                        'assets/images/home/frame4.png', // Main product image
                    backgroundImagePath:
                        'assets/images/home/blue2.png', // Background image
                    title: 'HAPPY CULTURES',
                    description: 'great sleep awaits',
                    price: '₹189',
                    originalPrice: '₹199',
                    discount: '5% off',
                  ),
                  SizedBox(width: 12),
                  buildgadgetCentralCard(
                    imagePath:
                        'assets/images/home/frame4.png', // Main product image
                    backgroundImagePath:
                        'assets/images/home/blue.png', // Background image
                    title: 'HAPPY CULTURES',
                    description: 'great sleep awaits',
                    price: '₹189',
                    originalPrice: '₹199',
                    discount: '5% off',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildgadgetCentralCard({
    required String imagePath,
    required String title,
    required String description,
    required String price,
    required String originalPrice,
    required String discount,
    String backgroundImagePath = 'assets/images/home/pink_background.png',
  }) {
    return Container(
      width: 220,
      height: 290,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Area with Background and Main Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              width: 220,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: 160,
                  height: 160,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image_not_supported,
                      color: Colors.white,
                      size: 40,
                    );
                  },
                ),
              ),
            ),
          ),
          // Product Details
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      originalPrice,
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      discount,
                      style: GoogleFonts.outfit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildpinkBannerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 12),
        Container(
          height: 154, // Fixed height as per specs
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  buildPinkBanner(
                    imagePath: 'assets/images/home/pink_poster.png',
                  ),
                  SizedBox(width: 12), // Gap between banners
                  buildPinkBanner(
                    imagePath: 'assets/images/home/pink_poster.png',
                  ),
                  SizedBox(width: 12),
                  buildPinkBanner(
                    imagePath: 'assets/images/home/pink_poster.png',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPinkBanner({required String imagePath}) {
    return Container(
      width: 280,
      height: 154,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          // errorBuilder: (context, error, stackTrace) {
          //   return Container(
          //     width: 280,
          //     height: 154,
          //     decoration: BoxDecoration(
          //       color: Colors.grey.shade200,
          //       borderRadius: BorderRadius.zero,
          //     ),

          //   );
          // },
        ),
      ),
    );
  }

  Widget buildsavingsBannerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 154,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  buildsavingsBanner(
                    imagePath: 'assets/images/home/saved189.png',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildsavingsBanner({required String imagePath}) {
    return Container(
      width: 328,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  Widget recommendedSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row: "RECOMMENDED" + Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'RECOMMENDED',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  color: Colors.black87,
                ),
              ),
              Icon(
                Icons.more_vert,
                size: 18,
                color: Colors.grey[700],
              ), // Replace with image if needed
            ],
          ),

          // Grid of cards
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 158 / 240,
            children: List.generate(6, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 158,
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/home/grey.png',
                        ), // Background
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/home/frame4.png', // Foreground
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'HAPPY CULTURES',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                      letterSpacing: 0.3,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'great sleep awaits',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        '₹189',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '₹399',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '53% off',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

 Widget recommendedSection2(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'RECOMMENDED',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            Icon(Icons.more_vert, size: 18, color: Colors.grey[700]),
          ],
        ),
        SizedBox(height: 12),

        // Grid
        GridView.builder(
          itemCount: 9,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 16,
            childAspectRatio: 0.62, // Increased height per item
          ),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 105,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/home/grey.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/home/frame4.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'HAPPY CULTURES',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  'great sleep awaits',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '₹189',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '₹399',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '53% off',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    ),
  );
}


  void _showPopupAboveButton(BuildContext context, GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    final double screenWidth = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double popupWidth = screenWidth * 0.2;

    double popupLeft = offset.dx + size.width - popupWidth;

    if (popupLeft + popupWidth > screenWidth) {
      popupLeft = screenWidth - popupWidth - 10;
    }

    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder:
          (context) => GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              overlayEntry?.remove();
            },
            child: Stack(
              children: [
                Positioned(
                  top: offset.dy + size.height + 5,
                  left: popupLeft,
                  child: GestureDetector(
                    onTap: () {
                      overlayEntry?.remove();
                      authcontroller.logout(context);
                      Get.offAll(() => LoginScreen());
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Logout",
                            style: GoogleFonts.outfit(
                              color: Colors.white,
                              fontSize: height * 0.02,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );

    Overlay.of(context).insert(overlayEntry);
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _StickyHeaderDelegate({required this.child, required this.height});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox(height: height, child: child);
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
