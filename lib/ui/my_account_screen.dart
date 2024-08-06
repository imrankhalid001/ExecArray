import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account', style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white,),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileSection(),
            _buildMenuSection(context),
          ],
        ),
      ),
    );
  }

   Widget _buildProfileSection() {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none, // Ensures children can overflow the stack
          children: <Widget>[
            Image.asset(
              'assets/account_top.png',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Positioned(
              left: 0,
              right: 0,
              top: 100, // Adjust this value to position the CircleAvatar
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/user_profile.png'),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hi,\nImran Khalid',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget _buildMenuSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
        const  SizedBox(height: 150,),
           const  Divider(),
          _buildMenuItem(
            icon: Icons.shopping_cart_outlined,
            title: 'My Orders',
            onTap: () {
              // Handle My Orders tap
            },
          ),
        const  Divider(),
          _buildMenuItem(
            icon: Icons.sell_outlined,
            title: 'Sell With Us',
            onTap: () {
              // Handle Sell With Us tap
            },
          ),
        const    Divider(),
          _buildMenuItem(
            icon: Icons.person_2_outlined,
            title: 'My Details',
            onTap: () {
              // Handle Sell With Us tap
            },
          ),

          const  Divider(),
          _buildMenuItem(
            icon: Icons.key,
            title: 'Change Password',
            onTap: () {
              // Handle Sell With Us tap
            },
          ),

          const  Divider(),
          _buildMenuItem(
            icon: Icons.payment,
            title: 'Payment methods',
            onTap: () {
              // Handle Sell With Us tap
            },
          ),

           const  Divider(),
          _buildMenuItem(
            icon: Icons.home_outlined,
            title: 'Delivery Address',
            onTap: () {
              // Handle Sell With Us tap
            },
          ),

        const  Divider(),
          _buildMenuItem(
            icon: Icons.support_agent,
            title: 'Support Center',
            onTap: () {
              // Handle Support Center tap
            },
          ),
         const Divider(),
          _buildMenuItem(
            icon: Icons.info_outline,
            title: 'About Us',
            onTap: () {
              // Handle About Us tap
            },
          ),
        const  Divider(),
        ],
      ),
    );
  }

  Widget _buildMenuItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      title: Text(title),
      onTap: onTap,
    );
  }
}
