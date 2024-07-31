
import 'package:exec_array/components/round_button.dart';
import 'package:exec_array/routes/routes_name.dart';
import 'package:exec_array/ui/home_screen.dart';
import 'package:exec_array/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

 final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              children: <Widget>[
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
                "Let's Sign In",
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
                'Enter your email and password...',
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
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration:  InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email),
                      border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0), // Adjust the corner radius as needed
                     borderSide: const BorderSide(
                      color: Colors.blue, // Set the border color
                      width: 2.0, // Set the border width
                     ),
                     )),
                  
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),


               const SizedBox(height: 20),

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
                            border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10.0), // Adjust the corner radius as needed
                     borderSide: const BorderSide(
                      color: Colors.blue, // Set the border color
                      width: 2.0, // Set the border width
                     ),
                     ),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined))),
                  );
                }),


                // Forgot password link
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Add your forgot password logic here
                    },
                    child: Text('Forgot password?',
                    style: TextStyle(
                      color: Colors.grey[500]
                    ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Sign In button
                              // login button
            RoundButton(
              title: 'Sign in',
              onPress: ()  {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please enter password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'Please enter 6 digit password', context);
                } else {

                  Navigator.push(context, MaterialPageRoute
                  (builder: (context)=> HomePage())
                  );


                  // Map data = {
                  //   'email': _emailController.text.toString(),
                  //   'password': _passwordController.text.toString()
                  // };

                  // Call login API
                

                }
              },
            ),




                const SizedBox(height: 16),
                // Terms and conditions
                const Text(
                  'By continuing, you agree to accept our',
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    // Add your terms and conditions logic here
                  },
                  child: Text('Terms & Conditions',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                    color: Theme.of(context).primaryColor
                  )),
                ),
                SizedBox(height: 16),
                // Sign Up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account?',
                    style: TextStyle(
                    color: Colors.grey[500]
                    ),),
                    TextButton(
                      onPressed: () {
                        // Add your sign-up logic here
                      Navigator.pushNamed(context, RoutesName.signUp);

                      },
                      child: Text('Sign Up', 
                      style: TextStyle(
                      color: Theme.of(context).primaryColor
                    )),
                    ),
                  ],
                ),
                // Divider and social media login buttons
                Row(
                  children: <Widget>[
                    const Expanded(child: Divider()),
                    Text(" OR CONTINUE WITH ",
                      style: TextStyle(
                    color: Colors.grey[500]
                    ),),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook),
                      onPressed: () {
                        // Add your Facebook login logic here
                      },
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.account_circle),
                      onPressed: () {
                        // Add your Google login logic here
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}