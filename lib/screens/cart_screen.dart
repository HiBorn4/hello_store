import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/cart_item.dart';
import '../utils/app_colors.dart';
import 'address_screen.dart';

// ==================== REUSABLE WIDGETS ====================
class ProductCard extends StatelessWidget {
  final CartItem item;
  final bool isWishlist;
  final VoidCallback? onRemove;
  final VoidCallback? onMoveToCart;

  const ProductCard({
    required this.item,
    this.isWishlist = false,
    this.onRemove,
    this.onMoveToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(item.image, height: 100, width: 100),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: AppTextStyles.body(context),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      _SizeChip(size: item.size),
                      const SizedBox(height: 8),
                      _RatingStars(
                        rating: item.rating,
                        ratingsCount: item.ratingsCount,
                      ),
                      const SizedBox(height: 8),
                      _PriceDisplay(
                        price: item.price,
                        originalPrice: item.originalPrice,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                if (!isWishlist)
                  Expanded(
                    child: _DeliveryInfo(
                      info: item.deliveryInfo,
                      originalPrice: item.originalPrice,
                    ),
                  ),
                if (!isWishlist) const SizedBox(width: 12),
                if (!isWishlist) _QuantitySelector(),

                if (isWishlist)
                  _WishlistActions(
                    // already has Expanded inside
                    onRemove: onRemove,
                    onMoveToCart: onMoveToCart,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SizeChip extends StatelessWidget {
  final String size;

  const _SizeChip({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        size,
        style: TextStyle(color: AppColors.mediumText, fontSize: 12),
      ),
    );
  }
}

class _RatingStars extends StatelessWidget {
  final double rating;
  final String ratingsCount;

  const _RatingStars({required this.rating, required this.ratingsCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) => Icon(
            index < rating.floor() ? Icons.star : Icons.star_border,
            color: AppColors.ratingStar,
            size: 16,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          ratingsCount,
          style: TextStyle(color: AppColors.mediumText, fontSize: 12),
        ),
      ],
    );
  }
}

class _PriceDisplay extends StatelessWidget {
  final String price;
  final String originalPrice;

  const _PriceDisplay({required this.price, required this.originalPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(price, style: AppTextStyles.price(context)),
        const SizedBox(width: 8),
        Text(
          originalPrice,
          style: TextStyle(
            color: AppColors.mediumText,
            decoration: TextDecoration.lineThrough,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _QuantitySelector extends StatefulWidget {
  const _QuantitySelector({Key? key}) : super(key: key);

  @override
  State<_QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<_QuantitySelector> {
  int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryGreen),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _decrement,
            child: Icon(Icons.remove, color: AppColors.primaryGreen, size: 20),
          ),
          const SizedBox(width: 12),
          Text(
            '$_quantity',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _increment,
            child: Icon(Icons.add, color: AppColors.primaryGreen, size: 20),
          ),
        ],
      ),
    );
  }
}

class _DeliveryInfo extends StatelessWidget {
  final String info;
  final String originalPrice;

  const _DeliveryInfo({required this.info, required this.originalPrice});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      // 👈 Add this to prevent layout issues in parent Row
      child: Row(
        children: [
          Flexible(
            // 👈 Allows text to wrap or ellipsize
            child: Text(
              info,
              style: AppTextStyles.body(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 3,
            height: 3,
            decoration: BoxDecoration(
              color: AppColors.darkText,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            originalPrice,
            style: TextStyle(
              color: AppColors.mediumText,
              decoration: TextDecoration.lineThrough,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Free',
            style: TextStyle(color: AppColors.primaryGreen, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class _WishlistActions extends StatelessWidget {
  final VoidCallback? onRemove;
  final VoidCallback? onMoveToCart;

  const _WishlistActions({this.onRemove, this.onMoveToCart});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // ✅ Wrap this in Expanded to fit within parent Row
      child: Row(
        children: [
          Expanded(
            child: _ActionButton(
              text: 'Remove',
              color: AppColors.mediumText,
              onPressed: onRemove,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ActionButton(
              text: 'Move to cart',
              color: AppColors.primaryGreen,
              isBorder: true,
              onPressed: onMoveToCart,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final Color color;
  final bool isBorder;
  final VoidCallback? onPressed;

  const _ActionButton({
    required this.text,
    required this.color,
    this.isBorder = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      // Replace Expanded with Flexible
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: isBorder ? Colors.transparent : color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
            border: isBorder ? Border.all(color: color) : null,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: color, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final dashWidth = 4.0;
          final dashCount =
              (constraints.constrainWidth() / (2 * dashWidth)).floor();
          return Row(
            children: List.generate(dashCount, (_) {
              return Container(
                width: dashWidth,
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                color: AppColors.mediumText,
              );
            }),
          );
        },
      ),
    );
  }
}

// ==================== SCREEN SECTIONS ====================
class _SearchFilterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search products',
                    prefixIcon: const Icon(Icons.search),
                    border: _buildBorder(),
                    enabledBorder: _buildBorder(),
                    focusedBorder: _buildBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mediumText),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.filter_list, color: AppColors.mediumText),
                    const SizedBox(width: 8),
                    Text('Filter', style: AppTextStyles.body(context)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryButton('All Categories (12)'),
              Text('Grocery', style: AppTextStyles.body(context)),
              Text('Minutes (11)', style: AppTextStyles.body(context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(text, style: const TextStyle(color: AppColors.darkText)),
          const Icon(Icons.expand_more),
        ],
      ),
    );
  }

  InputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.mediumText, width: 0.5),
    );
  }
}

class _DeliveryInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.secondaryGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SvgPicture.asset("assets/images/vehicle.svg"),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: AppTextStyles.body(context),
                          children: [
                            const TextSpan(text: 'Expected '),
                            TextSpan(
                              text: 'multiple delivery ',
                              style: TextStyle(color: AppColors.primaryGreen),
                            ),
                            const TextSpan(text: 'on this order'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'your items will be delivered from 5 different stores',
                        style: TextStyle(
                          color: AppColors.mediumText,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryGreen),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add item worth ₹200, to get free delivery',
                        style: AppTextStyles.body(context),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                color: AppColors.primaryGreen,
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(2),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.borderColor,
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(2),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryGreen),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(color: AppColors.primaryGreen),
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

class _CartItemsSection extends StatelessWidget {
  final List<CartItem> items;

  const _CartItemsSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((item) => ProductCard(item: item)).toList(),
    );
  }
}

class _WishlistSection extends StatelessWidget {
  final List<CartItem> items;

  const _WishlistSection({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text('Wishlist', style: AppTextStyles.title(context)),
        ),
        Column(
          children:
              items
                  .map(
                    (item) => ProductCard(
                      item: item,
                      isWishlist: true,
                      onRemove: () => _handleRemove(item),
                      onMoveToCart: () => _handleMoveToCart(item),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }

  void _handleRemove(CartItem item) {
    // Handle remove from wishlist
  }

  void _handleMoveToCart(CartItem item) {
    // Handle move to cart
  }
}

class _CouponSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.borderColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/discount_star.svg"),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Save ₹ 599 more on this order',
                      style: AppTextStyles.body(context),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Code : STE123',
                      style: TextStyle(
                        color: AppColors.mediumText,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryGreen),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color: AppColors.primaryGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('View all coupons', style: AppTextStyles.body(context)),
                const SizedBox(width: 4),
                const Icon(Icons.chevron_right, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BillSummarySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price Details', style: AppTextStyles.title(context)),
          const SizedBox(height: 12),
          _buildPriceRow('Price (32 items)', '₹1599', '₹1299'),
          const SizedBox(height: 8),
          _buildPriceRow('Discount', '-₹300', null),
          const SizedBox(height: 8),
          _buildPriceRow('Platform fee', '₹02', null, isUnderlined: true),
          const SizedBox(height: 8),
          _buildPriceRow('Shipping fee', '-40₹', 'Free', isUnderlined: true),
          const SizedBox(height: 12),
          const _DashedDivider(),
          const SizedBox(height: 12),
          _buildPriceRow('TOTAL AMOUNT', '₹12999', null, isTotal: true),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    String label,
    String value1,
    String? value2, {
    bool isUnderlined = false,
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              decoration: isUnderlined ? TextDecoration.underline : null,
              fontSize: 14,
              color: AppColors.darkText,
            ),
          ),
          const Spacer(),
          if (value2 != null)
            Row(
              children: [
                Text(
                  value1,
                  style: TextStyle(
                    color: AppColors.mediumText,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  value2,
                  style: TextStyle(
                    color:
                        value2 == 'Free'
                            ? AppColors.primaryGreen
                            : AppColors.darkText,
                    fontSize: 14,
                  ),
                ),
              ],
            )
          else
            Text(
              value1,
              style: TextStyle(
                color: AppColors.darkText,
                fontSize: isTotal ? 18 : 14,
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              ),
            ),
        ],
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFooterItem("assets/images/genuinee.svg", "Genuine products"),
          _buildDot(),
          _buildFooterItem("assets/images/refund.svg", "100% Refundable"),
          _buildDot(),
          _buildFooterItem("assets/images/secure.svg", "Secure Payment"),
        ],
      ),
    );
  }

  Widget _buildFooterItem(String iconPath, String text) {
    return Column(
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(height: 8),
        Text(text, style: TextStyle(color: AppColors.mediumText, fontSize: 12)),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.mediumText,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

class _ProceedToBuySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color(0xFFE4EDE2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/discount_star.svg"),
                const SizedBox(width: 8),
                Text(
                  'Saved ₹12,000 on this order',
                  style: TextStyle(color: AppColors.primaryGreen, fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₹20000',
                      style: TextStyle(
                        color: AppColors.mediumText,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '₹14990',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset("assets/images/instruct.svg"),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddressScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Proceed to Buy',
                      style: TextStyle(color: AppColors.white, fontSize: 16),
                    ),
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

// ==================== MAIN SCREEN ====================
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> _cartItems = [
    CartItem(
      image: "assets/images/iron_table.png",
      title: "Travel Steamer Iron for Clothes, 1250W....",
      size: "23 centimeters",
      rating: 4.0,
      ratingsCount: "4,764",
      price: "₹189",
      originalPrice: "₹199",
      deliveryInfo: "Free delivery Thu, 11 Apr",
    ),
    CartItem(
      image: "assets/images/iron_table.png",
      title: "Travel Steamer Iron for Clothes, 1250W....",
      size: "23 centimeters",
      rating: 4.0,
      ratingsCount: "4,764",
      price: "₹189",
      originalPrice: "₹199",
      deliveryInfo: "Free delivery Thu, 11 Apr",
    ),
    CartItem(
      image: "assets/images/iron_table.png",
      title: "Travel Steamer Iron for Clothes, 1250W....",
      size: "23 centimeters",
      rating: 4.0,
      ratingsCount: "4,764",
      price: "₹189",
      originalPrice: "₹199",
      deliveryInfo: "Free delivery Thu, 11 Apr",
    ),
    CartItem(
      image: "assets/images/iron_table.png",
      title: "Travel Steamer Iron for Clothes, 1250W....",
      size: "23 centimeters",
      rating: 4.0,
      ratingsCount: "4,764",
      price: "₹189",
      originalPrice: "₹199",
      deliveryInfo: "Free delivery Thu, 11 Apr",
    ),
    CartItem(
      image: "assets/images/iron_table.png",
      title: "Travel Steamer Iron for Clothes, 1250W....",
      size: "23 centimeters",
      rating: 4.0,
      ratingsCount: "4,764",
      price: "₹189",
      originalPrice: "₹199",
      deliveryInfo: "Free delivery Thu, 11 Apr",
    ),
  ];

  final List<CartItem> _wishlistItems = [
    CartItem(
      image: "assets/images/iron_table.png",
      title: "Travel Steamer Iron for Clothes, 1250W....",
      size: "23 centimeters",
      rating: 4.0,
      ratingsCount: "4,764",
      price: "₹189",
      originalPrice: "₹199",
      deliveryInfo: "Free delivery Thu, 11 Apr",
    ),

    CartItem(
      image: "assets/images/iron_table.png",
      title: "Travel Steamer Iron for Clothes, 1250W....",
      size: "23 centimeters",
      rating: 4.0,
      ratingsCount: "4,764",
      price: "₹189",
      originalPrice: "₹199",
      deliveryInfo: "Free delivery Thu, 11 Apr",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: AppTextStyles.title(context)),
        backgroundColor: AppColors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _SearchFilterSection(),
                const Divider(),
                _DeliveryInfoSection(),
                const Divider(thickness: 2),
                _CartItemsSection(items: _cartItems),
                const Divider(thickness: 2),
                _WishlistSection(items: _wishlistItems),
                const Divider(thickness: 2),
                _CouponSection(),
                const Divider(thickness: 2),
                _BillSummarySection(),
                const Divider(thickness: 2),
                _FooterSection(),
                const SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _ProceedToBuySection(),
          ),
        ],
      ),
    );
  }
}
