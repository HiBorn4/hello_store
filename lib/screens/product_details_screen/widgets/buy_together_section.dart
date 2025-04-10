import 'package:flutter/material.dart';

class BuyTogetherSection extends StatelessWidget {
  const BuyTogetherSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Buy together and save more",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),

          const SizedBox(height: 16),
          // Product 1
          _buildComboProduct(
            " 199",
            " 299",
            "Small Cooling Unit for Home Kitchen",
            4.5,
            true,
          ),
          const Divider(),
          // Product 2
          _buildComboProduct(
            " 899",
            " 1,199",
            "Medium Cooling Unit Stand",
            4.0,
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildComboProduct(String price, String originalPrice, String title,
      double rating, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: isSelected,
            onChanged: (value) {},
            activeColor: Colors.green,
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/kitchen.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "₹$price",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "₹$originalPrice",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff666666),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                const Text(
                  "- 10% OFF",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffC80433),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 14,
                          color:
                              index < rating ? Colors.orange : Colors.grey[300],
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '4,764',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}