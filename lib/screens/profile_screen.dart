import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3; // Assuming Profile is 4th item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {/* Search functionality */},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            _buildOrdersSection(),
            _buildRecentlyViewed(),
            _buildSectionTitle('Account Settings'),
            _buildAccountSettings(),
            _buildSectionTitle('Preference'),
            _buildPreferences(),
            _buildSectionTitle('My Activity'),
            _buildMyActivity(),
            _buildSectionTitle('Feedback and Information'),
            _buildFeedbackSection(),
            _buildLogoutButton(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/profile_placeholder.png'),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Rubika v', 
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('rubika@gmail.com', style: TextStyle(color: Colors.grey)),
              Text('2345168206', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 3,
        children: [
          _buildGridItem(Icons.shopping_bag, 'Orders'),
          _buildGridItem(Icons.favorite_border, 'Wishlist'),
          _buildGridItem(Icons.repeat, 'Buy again'),
          _buildGridItem(Icons.help_outline, 'Help center'),
        ],
      ),
    );
  }

  Widget _buildRecentlyViewed() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Recently viewed'),
          SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentItem('Refrigerator'),
                _buildRecentItem('Electronics'),
                _buildRecentItem('Utensils'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSettings() {
    return _buildSectionList([
      'Edit profile',
      'Saved address',
      'Saved cards & Wallets',
    ]);
  }

  Widget _buildPreferences() {
    return _buildSectionList([
      'Theme',
      'Language (english)',
      'Notification',
    ]);
  }

  Widget _buildMyActivity() {
    return _buildSectionList([
      'Reviews',
      'Give us feedback',
    ]);
  }

  Widget _buildFeedbackSection() {
    return _buildSectionList([
      'Terms, Policies and Licenses',
      'Browse FAQs',
    ]);
  }

  Widget _buildSectionList(List<String> items) {
    return Column(
      children: List.generate(items.length, (index) {
        return SettingsItem(
          title: items[index],
          onTap: () {/* Navigation */},
        );
      }),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: Colors.red.shade100,
          foregroundColor: Colors.red,
        ),
        onPressed: () {/* Logout */},
        child: Text('Log out'),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(title, 
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildGridItem(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(text),
      onTap: () {/* Navigation */},
    );
  }

  Widget _buildRecentItem(String text) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(text),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.repeat),
          label: 'Order Again',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingsItem({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
        Divider(height: 1),
      ],
    );
  }
}