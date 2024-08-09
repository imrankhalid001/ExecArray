import 'package:exec_array/provider/user_provider.dart';
import 'package:exec_array/routes/routes_name.dart';
import 'package:exec_array/ui/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileSection(context),
            _buildMenuSection(context),
          ],
        ),
      ),
    );
  }

   Widget _buildProfileSection(BuildContext context) {
      final userProvider = Provider.of<UserProvider>(context);  

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
             Positioned(
              left: 0,
              right: 0,
              top: 100, // Adjust this value to position the CircleAvatar
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Card(
                    elevation: 5,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/speaker.jpg'),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hi,''\n' '${userProvider.firstName} ${userProvider.lastName}',
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
                Navigator.pushNamed(context, RoutesName.myDetailsScreen);
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
              Navigator.pushNamed(context, RoutesName.paymentScreen);


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
