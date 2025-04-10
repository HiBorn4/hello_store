import 'package:flutter/material.dart';

class ProductImageDisplay extends StatefulWidget {
  const ProductImageDisplay({super.key});

  @override
  State<ProductImageDisplay> createState() => _ProductImageDisplayState();
}

class _ProductImageDisplayState extends State<ProductImageDisplay> {
  int _currentImageIndex = 0;
  final List<String> _images = [
    'assets/images/fridge.png',
    'assets/images/fridge.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          color: Colors.white,
          child: PageView.builder(
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() {
                _currentImageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  _images[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
        // Dots indicator
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _images.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentImageIndex == index
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
            ),
          ),
        ),
        // 10% OFF
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFC80433),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 6.0),
                child: Text(
                  "10% OFF",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}