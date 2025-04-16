import 'package:flutter/material.dart';

class CouponsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
  backgroundColor: Colors.white,
  title: Text(
    'Coupons',
    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),
  ),
  elevation: 0, // Keep elevation 0 to avoid shadow
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(1), // Height of the line
    child: Container(
      color: Colors.grey.shade400, // Line color
      height: 1, // Thickness of the line
    ),
  ),
),
      body: CouponList(),
    );
  }
}

class CouponList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      padding: EdgeInsets.all(screenWidth * 0.04),
      children: [
        CouponInputSection(),
        SizedBox(height: screenHeight * 0.03),
        SectionTitle(title: 'Best coupon for you'),
        SizedBox(height: screenHeight * 0.015),
        BestCouponCard(),
        SizedBox(height: screenHeight * 0.03),
        SectionTitle(title: 'Bank offers'),
        SizedBox(height: screenHeight * 0.015),
        BankOffersList(),
      ],
    );
  }
}

class CouponInputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
      padding: EdgeInsets.all(screenWidth * 0.012),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: screenWidth * 0.035),
              decoration: InputDecoration(
                hintText: 'Type coupon code here',
                hintStyle: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.black,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          SizedBox(
            width: screenWidth * 0.25,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.025),
                ),
                padding: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
              ),
              child: Text(
                'Apply',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BestCouponCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/cart/blue_sale.png',
                  width: screenWidth * 0.12,
                  height: screenWidth * 0.12,
                ),
                SizedBox(width: screenWidth * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flat ₹50 off',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Use code HSW0123',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.025),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                        vertical: screenHeight * 0.01,
                      ),
                    ),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Divider(),
            SizedBox(height: screenHeight * 0.015),
            CouponDetailText('All orders above ₹499'),
            CouponDetailText('Select grocery categories Fruits, Vegetables, Dairy and Bakery'),
            CouponDetailText('First-time users only'),
            CouponDetailText('Applicable on prepaid orders (UPI/ Debit/ Credit Card)'),
            CouponDetailText('Valid from 10th April to 15th April 2025'),
            CouponDetailText('Use code : FRESH20 at checkout'),
          ],
        ),
      ),
    );
  }
}

class BankOffersList extends StatelessWidget {
  final List<Map<String, dynamic>> offers = [
    {
      'code': 'HSW0123',
      'description': 'Upto ₹50 cashback',
      'details': 'Valid on orders above ₹299 using HDFC Bank cards',
    },
    {
      'code': 'SBI2023',
      'description': 'Upto 10% cashback',
      'details': 'Special offer for SBI credit card users',
    },
    {
      'code': 'SBI2023',
      'description': 'Upto 10% cashback',
      'details': 'Special offer for SBI credit card users',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: offers.map((offer) => BankOfferCard(offer: offer)).toList(),
    );
  }
}

class BankOfferCard extends StatelessWidget {
  final Map<String, dynamic> offer;
  final double iconSize = 45;

  const BankOfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: ExpansionTile(
        leading: Image.asset(
          'assets/icons/cart/green_sale.png',
          width: screenWidth * 0.1,
          height: screenWidth * 0.1,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              offer['description'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.038,
              ),
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              'Use code ${offer['code']}',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.032,
              ),
            ),
          ],
        ),
        trailing: Icon(Icons.expand_more, size: screenWidth * 0.06),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.01,
            ),
            child: Text(
              offer['details'],
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: screenWidth * 0.035,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width * 0.045,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CouponDetailText extends StatelessWidget {
  final String text;

  const CouponDetailText(this.text);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: screenWidth * 0.01, color: Colors.black),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: screenWidth * 0.032),
            ),
          ),
        ],
      ),
    );
  }
}