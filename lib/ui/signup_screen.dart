import 'package:exec_array/components/round_button.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);


  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
                 
            children: [
          
                  SizedBox(height: 80),
                  Text(
                    'ExecArray',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                     fontFamily: 'Segoe UI',
                      color: Theme.of(context).primaryColor
                    ),
                  ),
          
                  
                  const Text(
                    'EVENT MANAGEMENT',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
          
          

              const SizedBox(height: 32),

              // Heading and instructions

              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
               Text(
                "Getting started",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
             
                ],
              ),
             

               const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                'Create an account to continue...',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
             
                ],
              ),

           
              const SizedBox(height: 16),

              
              // email text field
              TextFormField(
                controller: _firstNameController,
                keyboardType: TextInputType.text,
                focusNode: emailFocusNode,
                decoration:  InputDecoration(
                    hintText: 'First Name',
                    labelText: 'John Doe',
                    prefixIcon: const Icon(Icons.person),
                     border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0), // Adjust the corner radius as needed
                     borderSide: const BorderSide(
                      color: Colors.blue, // Set the border color
                      width: 2.0, // Set the border width
                     ),
                     )
                    ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
          

            const SizedBox(
                height: 20
              ),

          
              // email text field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration:  InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.alternate_email),
                     border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0), // Adjust the corner radius as needed
                     borderSide: const BorderSide(
                      color: Colors.blue, // Set the border color
                      width: 2.0, // Set the border width
                     ),
                     )
                    ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
          
           const SizedBox(
                height: 20
              ),

              // password text field
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: _obsecurePassword.value,
                      controller: _passwordController,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_open_rounded),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                !_obsecurePassword.value;
                              },
                              child: Icon(_obsecurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined)),

                                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0), // Adjust the corner radius as needed
                     borderSide: const BorderSide(
                      color: Colors.blue, // Set the border color
                      width: 2.0, // Set the border width
                     ),
                     ) ),
                    );
                  }),


                     const SizedBox(
                height: 20
              ),

              // password text field
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: _obsecurePassword.value,
                      controller: _confirmPasswordController,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(Icons.lock_open_rounded),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                !_obsecurePassword.value;
                              },
                              child: Icon(_obsecurePassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined)),

                                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0), // Adjust the corner radius as needed
                     borderSide: const BorderSide(
                      color: Colors.blue, // Set the border color
                      width: 2.0, // Set the border width
                     ),
                     ) ),
                    );
                  }),
          
          
            const SizedBox(
                height: 50
              ),
          
              // SignUp button
              RoundButton(
                title: 'SignUp',
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Please enter 6 digit password', context);
                  } else {
                    // Map data = {
                    //   'email': _emailController.text.toString(),
                    //   'password': _passwordController.text.toString()
                    // };
          
          Navigator.pop(context);
                  }
                },
              ),
          
              const SizedBox(
                height: 30
              ),
          
          
              InkWell(
                onTap: (){
                  // Navigator.pushNamed(context, RoutesName.login);
                  Navigator.pop(context);
                },
                child: Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
