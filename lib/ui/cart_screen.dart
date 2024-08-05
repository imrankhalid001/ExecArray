

import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY CART'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CartItem(),
                  CartItem(),
                ],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: TextStyle(fontSize: 16)),
                Text('\$7.00', style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery Cost', style: TextStyle(fontSize: 16)),
                Text('\$4.00', style: TextStyle(fontSize: 16)),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('\$10.00', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Checkout', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isRentalSelected = true;

  void _onRentalTap() {
    setState(() {
      isRentalSelected = true;
    });
  }

  void _onPurchaseTap() {
    setState(() {
      isRentalSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Image.asset(
                'assets/table.jpg',
              width: 80,
              height: 80,
               fit: BoxFit.fill
              
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _onRentalTap,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isRentalSelected ? Theme.of(context).primaryColor : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                            child: Text('Rental: \n   \$5'),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _onPurchaseTap,
                        child: Container(
                          decoration: BoxDecoration(
                            color: isRentalSelected ? Colors.white : Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                            child: Text('Purchase: \n   \$23'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Quantity:'),
                      IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                      Text('1'),
                      IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Duration (Days):'),
                      IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                      Text('1'),
                      IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}