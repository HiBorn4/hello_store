
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_store/screens/Cart/cart.dart';
import 'package:hello_store/screens/HomePage/homepage.dart';
import 'package:hello_store/screens/Payment/payment_screen.dart';
import 'package:hello_store/screens/category_screen.dart';
import 'package:hello_store/screens/product_details_screen/product_details_screen.dart';


class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    final controller = Get.put(AppScreenController());
    return Scaffold(
      extendBody: true,


        bottomNavigationBar: Obx(
              () => controller.selectedMenu.value == 5
              ? const SizedBox.shrink()
              : Container(
            decoration: BoxDecoration(
              color:
              //THelperFunctions.isDarkMode(context)
                 // ? TColors.black
              //    :
              Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, -2), // Shadow at the top
                ),
              ],
            ),
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                      (states) {
                    final isSelected = states.contains(MaterialState.selected);
                    return TextStyle(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      //color: isSelected ? Colors.green : Colors.grey,
                      fontFamily: 'regular',
                      fontSize: height*0.016
                    );
                  },
                ),
              ),
              child: NavigationBar(
                height: height * 0.08,
                selectedIndex: controller.selectedMenu.value,
                backgroundColor: Colors.transparent,
                elevation: 0,
                indicatorColor: Colors.transparent,
                onDestinationSelected: (index) =>
                controller.selectedMenu.value = index,
                destinations: [
                  buildCustomDestination(
                    'assets/icons/bottombar/home_icon.png',
                    'assets/icons/bottombar/selected_home_icon.png',
                    'Home',
                    0,
                    controller,
                  ),
                  buildCustomDestination(
                    'assets/icons/bottombar/order_again_icon.png',
                    'assets/icons/bottombar/selected_reorder_icon.png',
                    'Order Again',
                    1,
                    controller,
                  ),
                  buildCustomDestination(
                    'assets/icons/bottombar/category_icon.png',
                    'assets/icons/bottombar/selected_category.png',
                    'Categories',
                    2,
                    controller,
                  ),
                  buildCustomDestination(
                    'assets/icons/bottombar/cart_icon.png',
                    'assets/icons/bottombar/selected_cart.png',
                    'Cart',
                    3,
                    controller,
                  ),
                ],
              ),
            ),
          ),
        ),


        body: Obx(() => controller.screens[controller.selectedMenu.value]),
    );
  }


  NavigationDestination buildCustomDestination(
      String icon,
      String selectedIcon,
      String label,
      int index,
      AppScreenController controller,
      ) {
    final isSelected = controller.selectedMenu.value == index;

    return NavigationDestination(
      label: label,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            height: 2,
            width: 46,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 4),
          Image.asset(
            isSelected ? selectedIcon : icon,
            height: 24,
          ),
        ],
      ),
    );
  }



}

class AppScreenController extends GetxController {
  static AppScreenController get instance => Get.find();

  final Rx<int> selectedMenu = 0.obs;

  final screens = [

    HomePage(),
    ProductDetailsScreen(),
    CategoryScreen(),
    PaymentScreen()
  ];

}
