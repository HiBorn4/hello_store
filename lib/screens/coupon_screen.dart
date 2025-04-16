import 'package:flutter/material.dart';

class CouponsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coupons'),
        elevation: 0,
      ),
      body: CouponList(),
    );
  }
}

class CouponList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        CouponInputSection(),
        SizedBox(height: 24),
        SectionTitle(title: 'Best coupon for you'),
        SizedBox(height: 12),
        BestCouponCard(),
        SizedBox(height: 24),
        SectionTitle(title: 'Bank offers'),
        SizedBox(height: 12),
        BankOffersList(),
      ],
    );
  }
}

class CouponInputSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Type coupon code here',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                ApplyButton(onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BestCouponCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Color(0xFFF5FDF7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.percent, color: Colors.green, size: 28),
                SizedBox(width: 12),
                Text(
                  'Flat ₹50 off',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CouponDetailRow(code: 'Use code HSW0123'),
            CouponDetailText('All orders above ₹499'),
            CouponDetailText('Select grocery categories...'),
            CouponDetailText('First-time users only'),
            CouponDetailText('Applicable on prepaid orders...'),
            CouponDetailText('Valid from...'),
            SizedBox(height: 16),
            CouponDetailRow(code: 'Use code : FRESH20'),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ApplyButton(onPressed: () {}),
            ),
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
      'details': 'Valid on orders above ₹299 using HDFC Bank cards'
    },
    {
      'code': 'SBI2023',
      'description': '10% cashback',
      'details': 'Special offer for SBI credit card users'
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

  const BankOfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        leading: Icon(Icons.percent, color: Colors.green),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              offer['description'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Use code ${offer['code']}',
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
        trailing: Icon(Icons.expand_more),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              offer['details'],
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}

class ApplyButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ApplyButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text('Apply'),
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
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CouponDetailRow extends StatelessWidget {
  final String code;

  const CouponDetailRow({required this.code});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: Colors.green),
          SizedBox(width: 8),
          Text(
            code,
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class CouponDetailText extends StatelessWidget {
  final String text;

  const CouponDetailText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: Colors.green),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}