import 'package:exec_array/servies/database_service.dart';
import 'package:flutter/material.dart';
import 'package:exec_array/models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    _products = await DataBaseService.instance.getProducts();
    notifyListeners();
  }

  Future<void> addProduct(Product product) async {
    await DataBaseService.instance.addProduct(product);
    fetchProducts();
  }

  Future<void> updateProduct(Product product) async {
    await DataBaseService.instance.updateProduct(product);
    fetchProducts();
  }

  Future<void> deleteProduct(int id) async {
    await DataBaseService.instance.deleteProduct(id);
    fetchProducts();
  }
}
