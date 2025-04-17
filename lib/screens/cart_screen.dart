import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/cart_item.dart';
import '../utils/app_colors.dart';
import 'address_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<CartItem> items = List.generate(
    5,
    (index) => CartItem(
      // id: 'item$index',
      image: 'assets/images/product.png',
      title: 'Samsung Refrigerator 255L',
      size: '255L',
      rating: 4.5,
      ratingsCount: '1.2k',
      price: '₹32,999',
      originalPrice: '₹45,999',
      deliveryInfo: 'Delivery by Mon, 25th Sep',
    ),
  );

  void _handleRemove(CartItem item) {
    // Handle remove logic
  }

  void _handleMoveToCart(CartItem item) {
    // Handle move to cart logic
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...items.map((item) => ProductCard(
                  item: item,
                  isWishlist: false,
                  onRemove: () => _handleRemove(item),
                  onMoveToCart: () => _handleMoveToCart(item),
                )),
            _CouponSection(),
            _PriceSummary(),
            _ProceedToBuySection(),
          ],
        ),
      ),
    );
  }
}

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
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    item.image,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.body(context),
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
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _DeliveryInfo(
                  info: item.deliveryInfo,
                  originalPrice: item.originalPrice,
                ),
                isWishlist
                    ? _WishlistActions(
                        onRemove: onRemove,
                        onMoveToCart: onMoveToCart,
                      )
                    : _QuantitySelector(),
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
        style: TextStyle(
          color: AppColors.mediumText,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _RatingStars extends StatelessWidget {
  final double rating;
  final String ratingsCount;

  const _RatingStars({
    required this.rating,
    required this.ratingsCount,
  });

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
          style: TextStyle(
            color: AppColors.mediumText,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _PriceDisplay extends StatelessWidget {
  final String price;
  final String originalPrice;

  const _PriceDisplay({
    required this.price,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          price,
          style: AppTextStyles.price(context),
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
      ],
    );
  }
}

class _QuantitySelector extends StatefulWidget {
  @override
  __QuantitySelectorState createState() => __QuantitySelectorState();
}

class __QuantitySelectorState extends State<_QuantitySelector> {
  int _quantity = 1;

  void _increment() => setState(() => _quantity++);
  void _decrement() => setState(() => _quantity = _quantity > 1 ? _quantity - 1 : 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: _decrement,
            child: Icon(
              Icons.remove,
              color: AppColors.primaryGreen,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '$_quantity',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _increment,
            child: Icon(
              Icons.add,
              color: AppColors.primaryGreen,
              size: 20,
            ),
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
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Expanded(  // Changed from Flexible to Expanded
      child: Row(
        children: [
          Expanded(  // Changed from Flexible to Expanded
            child: Text(
              info,
              style: AppTextStyles.body(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Container(
            width: screenWidth * 0.008,
            height: screenWidth * 0.008,
            decoration: BoxDecoration(
              color: AppColors.darkText,
              borderRadius: BorderRadius.circular(screenWidth * 0.008),
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Text(
            originalPrice,
            style: TextStyle(
              color: AppColors.mediumText,
              decoration: TextDecoration.lineThrough,
              fontSize: screenWidth * 0.035,
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Text(
            'Free',
            style: TextStyle(
              color: AppColors.primaryGreen, 
              fontSize: screenWidth * 0.035
            ),
          ),
        ],
      ),
    );
  }
}
class _WishlistActions extends StatelessWidget {
  final VoidCallback? onRemove;
  final VoidCallback? onMoveToCart;

  const _WishlistActions({
    this.onRemove,
    this.onMoveToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: _ActionButton(
            text: 'Remove',
            color: AppColors.mediumText,
            onPressed: onRemove,
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: _ActionButton(
            text: 'Move to cart',
            color: AppColors.primaryGreen,
            isBorder: true,
            onPressed: onMoveToCart,
          ),
        ),
      ],
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
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CouponSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondaryGreen,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/images/discount_star.svg"),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.body(context),
                    children: [
                      const TextSpan(text: 'Apply coupon '),
                      TextSpan(
                        text: 'SAVE10',
                        style: TextStyle(color: AppColors.primaryGreen),
                      ),
                      const TextSpan(text: ' & save ₹599'),
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
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryGreen),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Apply',
              style: TextStyle(color: AppColors.primaryGreen),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Details',
            style: AppTextStyles.title(context),
          ),
          const SizedBox(height: 12),
          _buildPriceRow('Price (32 items)', '₹1599', '₹1299'),
          const SizedBox(height: 8),
          _buildPriceRow('Discount', '-₹300', null),
          const SizedBox(height: 8),
          _buildPriceRow('Platform fee', '₹02', null, isUnderlined: true),
          const SizedBox(height: 8),
          _buildPriceRow('Shipping fee', '-40₹', 'Free', isUnderlined: true),
          const SizedBox(height: 12),
          _DashedDivider(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : null,
            fontSize: isTotal ? 16 : 14,
          ),
        ),
        Row(
          children: [
            if (value1 != null)
              Text(
                value1,
                style: TextStyle(
                  decoration: isUnderlined ? TextDecoration.underline : null,
                  fontWeight: isTotal ? FontWeight.bold : null,
                  fontSize: isTotal ? 16 : 14,
                ),
              ),
            if (value2 != null) ...[
              const SizedBox(width: 8),
              Text(
                value2,
                style: TextStyle(
                  color: AppColors.mediumText,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _DashedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            (constraints.constrainWidth() ~/ 10).toInt(),
            (index) => SizedBox(
              width: 5,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(color: AppColors.borderColor),
              ),
            ),
          ),
        );
      },
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
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontSize: 14,
                  ),
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
                      MaterialPageRoute(
                        builder: (context) => AddressScreen(),
                      ),
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
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
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