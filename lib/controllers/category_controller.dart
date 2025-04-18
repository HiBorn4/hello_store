import 'package:get/get.dart';

class CategoryController extends GetxController {

  // Categories data
  final List<Map<String, dynamic>> categories = [
    {'name': 'T.V. &...', 'image': 'assets/commercial_sinks.png'},
    {'name': 'Washing...', 'image': 'assets/commercial_work_tables.png'},
    {'name': 'Refrigera...', 'image': 'assets/commercial_work_tables.png'},
    {'name': 'Kitchen...', 'image': 'assets/commercial_work_tables.png'},
    {'name': 'Small...', 'image': 'assets/commercial_work_tables.png'},
    {'name': 'Air...', 'image': 'assets/commercial_work_tables.png'},
    {'name': 'Coolers...', 'image': 'assets/commercial_work_tables.png'},
    {'name': 'Fan...', 'image': 'assets/commercial_work_tables.png'},
    {'name': 'Air...', 'image': 'assets/commercial_work_tables.png'},
    {'name': 'Coolers...', 'image': 'assets/commercial_work_tables.png'},
    {'name': 'Fan...', 'image': 'assets/commercial_work_tables.png'},
  ];

  // Deals data
  final List<Map<String, dynamic>> deals = [
    {
      'name': 'Smartphone XYZ',
      'image': 'assets/deals_electronic.png',
      'originalPrice': 2999,
      'discountPrice': 2189,
      'rating': 4,
      'bought': '50+ bought in last month',
    },
    {
      'name': 'Bluetooth Speaker',
      'image': 'assets/deals_electronic.png',
      'originalPrice': 1999,
      'discountPrice': 1299,
      'rating': 5,
      'bought': '75+ bought in last month',
    },
    {
      'name': 'LED Monitor 24"',
      'image': 'assets/deals_electronic.png',
      'originalPrice': 8999,
      'discountPrice': 6999,
      'rating': 4,
      'bought': '30+ bought in last month',
    },
    {
      'name': 'Wireless Headphones',
      'image': 'assets/deals_electronic.png',
      'originalPrice': 3499,
      'discountPrice': 2499,
      'rating': 3,
      'bought': '100+ bought in last month',
    },
    {
      'name': 'Gaming Mouse',
      'image': 'assets/deals_electronic.png',
      'originalPrice': 999,
      'discountPrice': 799,
      'rating': 4,
      'bought': '80+ bought in last month',
    },
  ];

  // Favorites state
  // late final RxList<bool> favorites;

  // Cart items
  final RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // favorites = List.generate(deals.length, (_) => false).obs;
  }

  // Toggle favorite method
  // void toggleFavorite(int index) {
  //   if (index >= 0 && index < favorites.length) {
  //     favorites[index] = !favorites[index];
  //   }
  // }

  // Featured products getter (rating >= 4)
  List<Map<String, dynamic>> get featuredProducts =>
      deals.where((deal) => deal['rating'] >= 4).toList();

  // Add to cart method
  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
  }
}
