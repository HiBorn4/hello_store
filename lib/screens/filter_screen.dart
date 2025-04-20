import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int _selectedCategoryIndex = 0;
  RangeValues _priceRange = const RangeValues(200, 5800);
  final List<String> categories = ['Category', 'Size', 'Color', 'Brand','Rating','Discount','Material','Price Range', 'Discount'];
  Set<String> selectedPriceRanges = {};
  Set<String> selectedDiscounts = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text(
    'Filters',
    style: TextStyle(color: Colors.black),
  ),
  backgroundColor: Colors.white,
  elevation: 1,
  leading: IconButton(
    icon: const Icon(Icons.close, color: Colors.black),
    onPressed: () => Navigator.pop(context),
  ),
  actions: [
    TextButton(
      onPressed: () {
        // TODO: Add your "clear all filters" logic here
      },
      child: const Text(
        'Clear All',
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ],
),

      body: Column(
  children: [
    // Main content row wrapped in Expanded
    Expanded(
      child: Row(
        children: [
          // Left Categories Panel
          Container(
            width: 120,
            color: Colors.grey[200],
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) => Column(
                children: [
                  InkWell(
                    onTap: () => setState(() => _selectedCategoryIndex = index),
                    child: Container(
                      height: 60,
                      color: _selectedCategoryIndex == index 
                          ? Colors.white 
                          : Colors.transparent,
                      alignment: Alignment.center,
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: _selectedCategoryIndex == index
                              ? Colors.green
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 1, color: Colors.grey),
                ],
              ),
            ),
          ),

          // Right Options Panel
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: SingleChildScrollView(child: _buildOptionsContent())),
                ],
              ),
            ),
          ),
        ],
      ),
    ),

    // Bottom buttons row
    _buildBottomButtons(),
  ],
));

  }

  Widget _buildOptionsContent() {
  switch (_selectedCategoryIndex) {
    case 0:
      return Column(); // Empty for now
    case 1:
      return Column(); // Empty for now
    case 2:
      return Column(); // Empty for now
    case 3:
      return Column(); // Empty for now
    case 4:
      return Column(); // Empty for now
    case 5:
      return Column(); // Empty for now
    case 6:
      return Column(); // Empty for now
    case 7: // Price
      return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text('Selected price range', style: TextStyle(fontSize: 16)),
    const SizedBox(height: 8),
    Text(
      '₹ ${_priceRange.start.round()} - ₹ ${_priceRange.end.round()}',
      style: const TextStyle(fontSize: 18),
    ),
    RangeSlider(
      values: _priceRange,
      min: 200,
      max: 20000,
      divisions: 100,
      activeColor: Colors.green,
      inactiveColor: Colors.grey.shade300,
      labels: RangeLabels(
        '₹ ${_priceRange.start.round()}',
        '₹ ${_priceRange.end.round()}',
      ),
      onChanged: (values) => setState(() => _priceRange = values),
    ),
    const SizedBox(height: 8),
    const Text(
      '1332434 products found',
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    ),
    const SizedBox(height: 12),
    const Text(
      'Price',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 8),
    Wrap(
      spacing: 8,
      children: [
        _buildPriceButton('All prices'),
        _buildPriceButton('Upto ₹ 200'),
        _buildPriceButton('₹ 200 - ₹ 500'),
        _buildPriceButton('₹ 500 - ₹ 1000'),
      ],
    ),
    const SizedBox(height: 16),
    const Text(
      'Discounts',
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 8),
    Wrap(
      spacing: 8,
      children: [
        _buildPriceButton('Flat 50% Off'),
        _buildPriceButton('Buy 1 Get 1 Free'),
        _buildPriceButton('Minimum 30% Off'),
        _buildPriceButton('Clearance Sale'),
      ],
    ),
  ],
);

    case 8:
      return Column(); // Empty for now
    default:
      return Text('Options for ${categories[_selectedCategoryIndex]}');
  }
}


  Widget _buildPriceButton(String text) {
    final isSelected = selectedPriceRanges.contains(text);
    return ChoiceChip(
      label: Text(text),
      selected: isSelected,
      selectedColor: Colors.green.withOpacity(0.2),
      onSelected: (selected) => setState(() {
        if (selected) {
          selectedPriceRanges.add(text);
        } else {
          selectedPriceRanges.remove(text);
        }
      }),
    );
  }

 Widget _buildBottomButtons() {
  return Row(
    children: [
      // Close Button - Left Half
      Expanded(
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 60,
            alignment: Alignment.center,
            color: Colors.white,
            child: const Text(
              'Close',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),

      // Apply Button - Right Half
      Expanded(
        child: GestureDetector(
          onTap: () => Navigator.pop(context), // replace with actual apply logic
          child: Container(
            height: 60,
            alignment: Alignment.center,
            color: Colors.white,
            child: const Text(
              'Apply',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

}