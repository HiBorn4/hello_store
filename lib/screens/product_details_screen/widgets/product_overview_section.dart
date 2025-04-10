import 'package:flutter/material.dart';

class ProductOverviewSection extends StatelessWidget {
  const ProductOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Product Overview",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          _buildFeatureItem(
            "Holds up to 10 half size sheet pans or 10 full size steam table pans",
          ),
          const SizedBox(height: 8),
          _buildFeatureItem("Easy-to-use manual analog controls"),
          const SizedBox(height: 8),
          _buildFeatureItem("Triple-pane glass door with LED door light"),
          const SizedBox(height: 8),
          _buildFeatureItem(
            "Maximum cooking temperature of 500 degrees Fahrenheit",
          ),
          const SizedBox(height: 8),
          _buildFeatureItem(
            "Boilerless direct steam injection with reversible fan",
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check, color: Colors.green, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
