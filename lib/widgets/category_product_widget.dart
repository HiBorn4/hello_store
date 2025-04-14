import 'package:flutter/material.dart';

class ProductListItemWidget extends StatelessWidget {
  final Size screenSize;

  const ProductListItemWidget({
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.03,
        vertical: screenSize.height * 0.007,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenSize.width * 0.04),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(screenSize.width * 0.04),
                  ),
                  child: Image.asset(
                    'assets/product.png',
                    height: screenSize.height * 0.23,
                    width: screenSize.width * 0.35,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(screenSize.width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Travel Steamer iron for Clothes, 1200W Portable...",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenSize.width * 0.038,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenSize.height * 0.005),
                        Text(
                          "23 centimeters",
                          style: TextStyle(
                            fontSize: screenSize.width * 0.03,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.005),
                        Row(
                          children: [
                            ...List.generate(
                              5,
                              (i) => Icon(
                                Icons.star,
                                color: i < 4 ? Colors.orange : Colors.grey,
                                size: screenSize.width * 0.04,
                              ),
                            ),
                            SizedBox(width: screenSize.width * 0.02),
                            Text(
                              "4,784",
                              style: TextStyle(
                                fontSize: screenSize.width * 0.03,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.005),
                        Text(
                          "50+ bought in past month",
                          style: TextStyle(
                            fontSize: screenSize.width * 0.03,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.005),
                        Row(
                          children: [
                            Text(
                              "₹189",
                              style: TextStyle(
                                fontSize: screenSize.width * 0.038,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: screenSize.width * 0.015),
                            Text(
                              "₹199",
                              style: TextStyle(
                                fontSize: screenSize.width * 0.03,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height * 0.005),
                        Text(
                          "Free delivery Thu, 10 Apr",
                          style: TextStyle(
                            fontSize: screenSize.width * 0.03,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "Save extra with No cost EMI",
                          style: TextStyle(
                            fontSize: screenSize.width * 0.03,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}