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
  leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.of(context).pop(); // Or Get.back() if using GetX
    },
  ),
  title: Text(
    'Profile',
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        // Search functionality
      },
    ),
  ],
),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DividerLine(),
            _buildProfileHeader(),
            const DividerLine(),
            _buildOrdersSection(),
            const DividerLine(),
            _buildRecentlyViewed(),
            const DividerLine(),
            _buildSectionTitle('Account Settings'),
            _buildAccountSettings(),
            const DividerLine(),
            _buildSectionTitle('Preference'),
            _buildPreferences(),
            const DividerLine(),
            _buildSectionTitle('My Activity'),
            _buildMyActivity(),
            const DividerLine(),
            _buildSectionTitle('Feedback and Information'),
            _buildFeedbackSection(),
            const DividerLine(),
            _buildLogoutButton(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  

  Widget _buildProfileHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            // backgroundImage: AssetImage('assets/profile_placeholder.png'),
            backgroundColor: Colors.grey,
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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

  Widget _buildRecentItem(String imagePath, String label) {
  return Container(
    margin: const EdgeInsets.only(right: 15),
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(2),
      border: Border.all(color: Colors.grey),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Display image with rounded corners
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        // Label below the image
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    ),
  );
}

Widget _buildRecentlyViewed() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Recently viewed'),
        const SizedBox(height: 8),
        SizedBox(
          // Adjust the height to ensure the image and label fit comfortably
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildRecentItem('assets/icons/recently_viewed/refrigerator.png', 'Refrigerator'),
              _buildRecentItem('assets/icons/recently_viewed/electronics.png', 'Electronics'),
              _buildRecentItem('assets/icons/recently_viewed/utensils.png', 'Utensils'),
              _buildRecentItem('assets/icons/recently_viewed/refrigerator.png', 'Furniture'),
              _buildRecentItem('assets/icons/recently_viewed/electronics.png', 'Clothes'),
            ],
          ),
        ),
      ],
    ),
  );
}

  Widget _buildAccountSettings() {
  return _buildSectionList([
    {'title': 'Edit profile', 'icon': Icons.person},
    {'title': 'Saved address', 'icon': Icons.location_on},
    {'title': 'Saved cards & Wallets', 'icon': Icons.credit_card},
  ]);
}

Widget _buildPreferences() {
  return _buildSectionList([
    {'title': 'Theme', 'icon': Icons.color_lens},
    {'title': 'Language (english)', 'icon': Icons.language},
    {'title': 'Notification', 'icon': Icons.notifications},
  ]);
}

Widget _buildMyActivity() {
  return _buildSectionList([
    {'title': 'Reviews', 'icon': Icons.star},
    {'title': 'Give us feedback', 'icon': Icons.feedback},
  ]);
}

Widget _buildFeedbackSection() {
  return _buildSectionList([
    {'title': 'Terms, Policies and Licenses', 'icon': Icons.description},
    {'title': 'Browse FAQs', 'icon': Icons.question_answer},
  ]);
}


  Widget _buildSectionList(List<Map<String, dynamic>> items) {
  return Column(
    children: items.map((item) {
      return SettingsItem(
        title: item['title'],
        icon: item['icon'],
        onTap: () {
          // Handle tap
        },
      );
    }).toList(),
  );
}


  Widget _buildLogoutButton() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: OutlinedButton.icon(
      onPressed: () {
        // Logout action
      },
      icon: Icon(Icons.logout, color: Colors.green, size: 25,),
      label: Text(
        'Log out',
        style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w500),
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        side: BorderSide(color: Colors.green),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.transparent,
      ),
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
  return Container(
    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 7),
    decoration: BoxDecoration(
      color: Colors.grey[200], // Light grey background
      // borderRadius: BorderRadius.circular(8),
    ),
    child: Center(
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(text, style: TextStyle(color: Colors.black)),
        onTap: () {/* Navigation */},
      ),
    ),
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

class DividerLine extends StatelessWidget {
  const DividerLine();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Divider(
      color: Colors.grey,
      height: screenHeight * 0.005,
      thickness: screenHeight * 0.001,
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SettingsItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
      ],
    );
  }
}
