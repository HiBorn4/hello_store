import 'package:flutter/material.dart';

class SimilarProductsSection extends StatelessWidget {
  const SimilarProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Similar products",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildSimilarProduct(
                    " 189",
                    " 199",
                    "Premium Cooling Unit",
                    4.5,
                    "4764",
                    "assets/images/kitchen.png"),
                _buildSimilarProduct(
                    " 189",
                    " 199",
                    "Standard Cooling Unit",
                    4.0,
                    "4764",
                    "assets/images/kitchen.png"),
                _buildSimilarProduct(
                    " 189",
                    " 199",
                    "Deluxe Cooling Unit",
                    4.2,
                    "4764",
                    "assets/images/kitchen.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarProduct(String price, String oldPrice, String title,
      double rating, String reviews, String imagePath) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 90,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: 1.3,
                fontFamily: 'Poppins',
                color: Color(0xff1A1A1A)),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                price,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: Color(0xff1A1A1A)),
              ),
              const SizedBox(width: 4),
              Text(
                oldPrice,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
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
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xffC80433),
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ...List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  size: 14,
                  color: index < rating ? Colors.orange : Colors.grey[300],
                ),
              ),
              const SizedBox(width: 4),
              Text(
                reviews,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Text(
            "50+ bought in past month",
            style: TextStyle(
              fontSize: 11,
              fontFamily: 'Poppins',
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}