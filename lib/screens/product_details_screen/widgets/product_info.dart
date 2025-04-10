import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Brand: APRA",
            style: TextStyle(fontSize: 10, color: Color(0xFF2079D3)),
          ),
          const SizedBox(height: 8),
          const Text(
            "Cooking Performance Group OCB110I 10 Pan Half Size Electric Combi Oven with Manual Controls - 208/240V, 3 Phase",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 130,
            height: 22,
            decoration: BoxDecoration(
              color: const Color(0xFFC80433),
              borderRadius: BorderRadius.circular(4),
            ),
            alignment: Alignment.center,
            child: const Text(
              'Lowest price since launch',
              style: TextStyle(
                fontSize: 8,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    size: 18,
                    color: index < 4 ? Colors.amber : Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                "4.0",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFE47B1E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                " good(1642 ratings)",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF0D7600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Text(
                  "-10%",
                  style: TextStyle(
                    color: Color(0xffC80433),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Text(
                "₹ 14,990",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              SizedBox(width: 8),
              Text(
                "MRP ",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff4D4D4D),
                ),
              ),
              Text(
                " ₹ 15,099",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff4D4D4D),
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "EMI from ₹543. No Cost EMI availabe. ",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff4D4D4D),
                  ),
                ),
              ),
              Text(
                "EMI options",
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff0D7600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "incl. of taxes",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff0D7600),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 328,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffDFECF1),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: BorderSide.none,
                  ),
                  elevation: 0,
                  foregroundColor: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Ships free with plus",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff3B4238),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}