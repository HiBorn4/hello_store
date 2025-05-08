import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hello_store/controllers/product_details_cotroller.dart';
import 'package:hello_store/screens/product_details_screen/widgets/product_image_display.dart';
import 'product_details_screen/widgets/custom_bottom_nav_bar.dart';
import 'product_details_screen/widgets/product_info.dart';
import 'product_details_screen/widgets/offers_section.dart';
import 'product_details_screen/widgets/buy_together_section.dart';
import 'product_details_screen/widgets/total_price_section.dart';
import 'product_details_screen/widgets/similar_products_section.dart';
import 'product_details_screen/widgets/product_details_section.dart';
import 'product_details_screen/widgets/delivery_services_section.dart';
import 'product_details_screen/widgets/quick_shipping_section.dart';
import 'product_details_screen/widgets/product_overview_section.dart';
import 'product_details_screen/widgets/you_may_also_like_section.dart';
import 'product_details_screen/widgets/explore_brands_section.dart';
import 'product_details_screen/widgets/customer_reviews_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});


  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // int _selectedIndex = 0;
  final item = Get.arguments;

  final controller=Get.put<ProductDetailsCotroller>(ProductDetailsCotroller());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: const Color(0xFFEDEDED),
          elevation: 0.5,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      width: 292,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search 'Pooja Needs'",
                          hintStyle:
                              TextStyle(color: Colors.grey[600], fontSize: 12),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.mic, color: Colors.grey),
                            onPressed: () {},
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Carousel
             ProductImageDisplay( item: item,),

            // Product Info
            ProductInfo(item : item),

            const SizedBox(height: 8),

            // Offers section
            const OffersSection(),

            const SizedBox(height: 8),

            // Buy together section
            const BuyTogetherSection(),

            const SizedBox(height: 8),

            // Total Price Section
            const TotalPriceSection(),

            const SizedBox(height: 8),

            // Similar Products Section
            const SimilarProductsSection(),

            const SizedBox(height: 8),
            
            // Product Details Section
            const ProductDetailsSection(),

            const SizedBox(height: 8),

            // Delivery & Services Section
            const DeliveryServicesSection(),

            const SizedBox(height: 8),

            // Quick Shipping Section
            const QuickShippingSection(),

            // Product Overview Section
            const SizedBox(height: 8),
            const ProductOverviewSection(),

            const SizedBox(height: 8),

            // You May Also Like Section
            const YouMayAlsoLikeSection(),

            const SizedBox(height: 8),

            // Explore Brands Oven Section
            const ExploreBrandsSection(),
            
            // Customer Reviews Section
            const CustomerReviewsSection(),
            
            // Another Similar Products section at the bottom
            const SimilarProductsSection(),
          ],
        ),
      ),
     // bottomNavigationBar: CustomBottomNavBar(
        
      //),
    );
  }
}
