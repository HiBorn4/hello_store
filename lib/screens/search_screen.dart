import 'package:flutter/material.dart';

class SearchResultsScreen extends StatefulWidget {
  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final List<String> allSuggestions = [
    'refrigerator single door',
    'refrigerator double door',
    'side-by-side refrigerator',
    'French door refrigerator',
    'compact refrigerator',
    'mini refrigerator',
  ];
  
  late TextEditingController _searchController;
  List<String> _filteredSuggestions = [];
  bool _showInitialState = true;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredSuggestions = [];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterSuggestions(String query) {
    setState(() {
      _showInitialState = query.isEmpty;
      if (query.isNotEmpty) {
        _filteredSuggestions = allSuggestions.where((item) {
          return item.toLowerCase().contains(query.toLowerCase());
        }).toList();
      } else {
        _filteredSuggestions = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: AppSearchBar(
                screenSize: screenSize,
                controller: _searchController,
                onChanged: _filterSuggestions,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.grey[300], height: 1),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_showInitialState) {
      return Center(
        child: Text(
          'Start typing to search products',
          style: TextStyle(color: Colors.grey),
      ),);
      
    }

    return Column(
      children: [
        Expanded(
          child: _filteredSuggestions.isEmpty
              ? Center(
                  child: Text(
                    'No results found',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  itemCount: _filteredSuggestions.length,
                  itemBuilder: (context, index) => _buildSearchResultItem(
                    context,
                    _filteredSuggestions[index],
                    index,
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildSearchResultItem(
      BuildContext context, String productName, int index) {
    return InkWell(
      onTap: () => _navigateToProductDetail(context, productName),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
        ),
        child: Row(
          children: [
            if (index < 2) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/product.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
            ],
            if (index >= 2) ...[
              Icon(Icons.search, color: Colors.grey, size: 20),
              SizedBox(width: 16),
            ],
            Expanded(
              child: Text(
                productName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, 
                color: Colors.grey, 
                size: 20),
          ],
        ),
      ),
    );
  }

  void _navigateToProductDetail(BuildContext context, String productName) {
    // TODO: Implement navigation logic
  }
}

class AppSearchBar extends StatelessWidget {
  final Size screenSize;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const AppSearchBar({
    required this.screenSize,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.055,
      margin: EdgeInsets.only(right: screenSize.width * 0.03),
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenSize.width * 0.035),
        border: Border.all(color: Colors.grey[500]!, width: 1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
            size: screenSize.width * 0.055,
          ),
          SizedBox(width: screenSize.width * 0.02),
          Expanded(
            child: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(fontSize: screenSize.width * 0.038),
              ),
              onChanged: onChanged,
            ),
          ),
          Container(
            height: screenSize.height * 0.025,
            width: 1,
            color: Colors.grey[400],
            margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.02),
          ),
          IconButton(
            icon: Icon(Icons.mic, 
                color: Colors.grey, 
                size: screenSize.width * 0.055),
            onPressed: () {
              // TODO: Implement voice search
            },
          ),
        ],
      ),
    );
  }
}