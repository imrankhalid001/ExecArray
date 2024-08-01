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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Events', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
                // Set the height for the grid view
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                ),
                itemCount: 4, // Number of items to display
                itemBuilder: (context, index) {
                  // Data for each item
                  final items = [
                    {
                      'imagePath':
                          'https://images.unsplash.com/photo-1595407753234-0882f1e77954?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      'label': 'Wedding'
                    },
                    {
                      'imagePath':
                          'https://images.unsplash.com/photo-1501527459-2d5409f8cf9f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      'label': 'Concert'
                    },
                    {
                      'imagePath':
                          'https://images.unsplash.com/photo-1505373877841-8d25f7d46678?q=80&w=2012&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      'label': 'Conference'
                    },
                    {
                      'imagePath':
                          'https://images.unsplash.com/photo-1472653431158-6364773b2a56?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      'label': 'Event'
                    },
                  ];

                  // Returning each item widget
                  return EventItem(
                    imagePath: items[index]['imagePath']!,
                    label: items[index]['label']!,
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
