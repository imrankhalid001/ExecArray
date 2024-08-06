import 'package:exec_array/components/round_button.dart';
import 'package:flutter/material.dart';

class FavoturiteScreen extends StatelessWidget {
  const FavoturiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SAVED ITEMS', style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).primaryColor,

        centerTitle: true,
      ),
      body: const DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'ITEMS' ),
                Tab(text: 'BOARDS'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // ITEMS tab content
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductCard(
                          productName: 'Table',
                          description: 'Brief description of category Lorem ipsum dolor sit amet, consetetur sadipscing elitr,',
                          salePrice: 23,
                          rentPrice: 5,
                          imageUrl: 'assets/table.jpg', // Replace with actual image path
                        ),
                        // Add more product cards here if needed
                      ],
                    ),
                  ),
                  // BOARDS tab content (placeholder)
                  Center(child: Boarditem()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String description;
  final int salePrice;
  final int rentPrice;
  final String imageUrl;

  const ProductCard({
    Key? key,
    required this.productName,
    required this.description,
    required this.salePrice,
    required this.rentPrice,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Stack(
            children:[
               Row(
              children: [
                Image.asset(imageUrl,
                width: 100), // Adjust width as needed
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productName, style: TextStyle(fontWeight:
                        FontWeight.bold, fontSize: 18)), 
            
                      Text(description ,style: TextStyle(fontSize: 10),),
                      SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sale:  \$$salePrice', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                          Text('Rent:\$$rentPrice/Day',  style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
                        ],
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart_outlined),
                  onPressed: () {},
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}



class Boarditem extends StatelessWidget {
  const Boarditem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Image.asset(height: 100, width: 100, 'assets/boards.png'),
             SizedBox(height: 20,),
            Text('No items added to your board yet'),
             SizedBox(height: 100,),
        
             RoundButton(title: 'CREATE BOARD', onPress: (){
        
             })
          ],
        ),
      ),
    );
  }
}