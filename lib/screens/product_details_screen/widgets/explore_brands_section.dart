import 'package:flutter/material.dart';

class ExploreBrandsSection extends StatelessWidget {
  const ExploreBrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Explore Brands Oven",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: [
                      _buildBrandLogo('assets/images/haier.png'),
                      _buildBrandLogo('assets/images/LG.png'),
                      _buildBrandLogo('assets/images/samsung.png'),
                      _buildBrandLogo('assets/images/faber.png'),
                      _buildBrandLogo('assets/images/Whirlpool.png'),
                      _buildBrandLogo('assets/images/carrier.png'),
                      _buildBrandLogo('assets/images/samsung.png'),
                      _buildBrandLogo('assets/images/samsung.png'),
                    ],
                  ),
                ],
              ),
            );

  }
  Widget _buildBrandLogo(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          height: 32,
        ),
      ),
    );
  }

}