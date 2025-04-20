import 'package:flutter/material.dart';

class PriceFilterOverlay extends StatefulWidget {
  const PriceFilterOverlay({super.key});

  @override
  State<PriceFilterOverlay> createState() => _PriceFilterOverlayState();
}

class _PriceFilterOverlayState extends State<PriceFilterOverlay> {
  RangeValues selectedRange = const RangeValues(200, 5800);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fixedHeight = MediaQuery.of(context).size.height * 0.35;

    return Container(
      height: fixedHeight,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Top grey drag bar
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),

          // Content aligned to start
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Price", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(
                  "Selected Price Range: ₹${selectedRange.start.toInt()} - ₹${selectedRange.end.toInt()}",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                RangeSlider(
                  min: 200,
                  max: 20000,
                  values: selectedRange,
                  onChanged: (RangeValues values) {
                    setState(() {
                      selectedRange = values;
                    });
                  },
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey.shade300,
                ),
                const SizedBox(height: 10),
                const Text(
                  "10,112,344 products found",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const Spacer(),
                Row(
                  children: [
                    // Close gesture box
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: screenWidth / 2 - 25,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text("Close", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Apply gesture box
                    GestureDetector(
                      onTap: () {
                        // Apply logic
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: screenWidth / 2 - 25,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // color: Colors.green,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          "Apply",
                          style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
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
