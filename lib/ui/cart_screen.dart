import 'package:exec_array/components/round_button.dart';
import 'package:exec_array/provider/cart_provider.dart';
import 'package:exec_array/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
   final  productProvider = Provider.of<ProductProvider>(context);
   
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY CART',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (cartProvider.items.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.items.length,
                  itemBuilder: (context, index) {
                    return CartItemWidget(index: index);
                  },
                ),
              ),
            
            if (cartProvider.items.isNotEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal', style: TextStyle(fontSize: 16)),
                  Text('\$${cartProvider.subtotal.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 16)),
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
                  Text('Total',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                      '\$${(cartProvider.subtotal + 4.00).toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 20),
              RoundButton(
                title: 'Checkout',
                onPress: () {
                  // Add checkout functionality
                },
              ),
              SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final int index;

  CartItemWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final item = cartProvider.items[index];

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Stack(
          children: [
            Row(
              children: [
                Image.asset(
                  item.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                               cartProvider.toggleRental(index, true);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: item.isRental
                                    ? Theme.of(context).primaryColor
                                    : Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                ),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5.0),
                                child: Text('Rental: \n   \$5'),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              cartProvider.toggleRental(index, false);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: item.isRental
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 5.0),
                                child: Text('Purchase: \n   \$23'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Quantity:'),
                          Row(
                            children: [
                              IconButton(
                                iconSize: 20,
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  cartProvider.decrementQuantity(index);
                                },
                              ),
                              Text('${item.quantity}'),
                              IconButton(
                                iconSize: 20,
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  cartProvider.incrementQuantity(index);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Duration (Days):'),
                          Row(
                            children: [
                              IconButton(
                                iconSize: 20,
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  cartProvider.decrementDuration(index);
                                },
                              ),
                              Text('${item.duration}'),
                              IconButton(
                                iconSize: 20,
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  cartProvider.incrementDuration(index);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                      int itemId = cartProvider.items[index].id;
                  cartProvider.removeItem(itemId);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
