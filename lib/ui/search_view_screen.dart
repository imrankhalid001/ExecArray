import 'package:exec_array/utils/utils.dart';
import 'package:flutter/material.dart';

class SearchViewScreen extends StatelessWidget {
  const SearchViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [




            // Display the image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/home_top.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 120, // Set the desired height for the image
              ),
            ),


  // Centered text
            const Positioned.fill(
              top: 35,
              child: Align(
                alignment: Alignment.topCenter,
                
                child: Text(
                  'SEARCH',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Segoe UI',
                    color: Colors.white,
                  ),
                ),
              ),
            ),




            // Search bar positioned partly over the image and screen
          // Search bar positioned partly over the image and screen
            Positioned(
              left: 20,
              right: 20,
              top: 90, // Adjusted top position for visibility
              child: Card(
                elevation: 8, // Elevation for shadow effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'What are you looking for?',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      icon: GestureDetector(
                        // onTap: Utils.toastMessage('Coming soon!'),
                        child: Icon(Icons.search),
                      ),
                    ),
                    onSubmitted: (value) {
                      Utils.toastMessage('Coming soon!' );
                    },
                  ),
                ),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
