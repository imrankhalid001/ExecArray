import 'package:exec_array/provider/user_provider.dart';
import 'package:exec_array/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exec_array/components/round_button.dart';

class MyDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY DETAILS',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Segoe UI',
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: 'FIRST NAME',
                hintText: 'Enter your first name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'LAST NAME',
                hintText: 'Enter your last name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                labelText: 'PHONE NUMBER',
                hintText: 'Enter your primary phone number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Icon(Icons.info_outline, size: 16),
                SizedBox(width: 8),
                Text('All changes will be saved'),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: RoundButton(
                title: 'SAVE CHANGES',
                onPress: () {
                  final firstName = firstNameController.text;
                  final lastName = lastNameController.text;

                  if (firstName.isEmpty || lastName.isEmpty) {
                    
                      Utils.flushBarErrorMessage('First name and last name cannot be empty', context);
                    return;
                  }

                  userProvider.saveUserDetails(firstName, lastName);
                Utils.toastMessage('Your details have been saved.');
                Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
