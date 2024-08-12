import 'package:exec_array/components/round_button.dart';
import 'package:exec_array/models/product.dart';
import 'package:exec_array/provider/cart_provider.dart';
import 'package:exec_array/provider/product_provider.dart';
import 'package:exec_array/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
     final cartProvider = Provider.of<CartProvider>(context, listen: false);
     final productProvider = Provider.of<ProductProvider>(context);

     
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.imagePath, fit: BoxFit.cover, width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: 
      
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
              Text(product.name, 
                style: const TextStyle(fontSize: 25, 
                fontWeight: FontWeight.bold),),
      
      
                    SizedBox(height: 10,),
             
               Text('Sale: \$${product.salePrice}', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      
              Text('Rent: \$${product.rentPrice} / Day', style: TextStyle(fontWeight: FontWeight.bold)),
      
                    SizedBox(height: 20,),
      
      
            Text('Descraption of product', 
                style: const TextStyle(fontSize: 20, 
                fontWeight: FontWeight.bold),),
      
                 SizedBox(height: 10,),
      
                    Text(product.productDescraption, style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
      
              
            ),
          
              const Spacer(),
      
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.center,
                child: RoundButton(title: 'Add to cart',
                 onPress: (){
                  // add to cart logic
                  cartProvider.addItem(CartItem(
                  id: product.id, // Ensure the product ID is used as CartItem ID
                  name: product.name,
                  image: product.imagePath,
                  rentalPrice: product.rentPrice,
                  purchasePrice: product.salePrice,
                  quantity: 1,
                  duration: 1,
                  isRental: true,
                ));
                
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}