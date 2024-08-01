import 'package:exec_array/ui/items/event_items/event_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

             Stack(
            children: [
              // Display the image
              Image.asset(
                'assets/home_top.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                  height: 80,
              ),
             

 // Icon button at the left
              Positioned(
                left: 0,
                top: 20,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Segoe UI',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

               
              
            ],
          ),
      
            SizedBox(height: 20),
            Container(
                // Set the height for the grid view
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                ),
                itemCount: 4, // Number of items to display
                itemBuilder: (context, index) {
                  // Data for each item
                  final items = [
                    {
                      'imagePath': 'assets/chair.jpg', 'label': 'Chairs'
                    },
                    {
                     'imagePath': 'assets/canopies.jpg', 'label': 'canopies'
                    },
                    {
                     'imagePath': 'assets/speaker.jpg', 'label': 'Speakers'
                    },
                    {
                      'imagePath': 'assets/tents.jpg', 'label': 'Tents'
                    },
                  ];

                  // Returning each item widget
                  return EventItem(
                    imagePath: items[index]['imagePath']!,
                    label: items[index]['label']!,
                    categoryScreen: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
