import 'package:flutter/material.dart';

class CartItem {
  String name;
  String image;
  double rentalPrice;
  double purchasePrice;
  int quantity;
  int duration;
  bool isRental;

  CartItem({
    required this.name,
    required this.image,
    required this.rentalPrice,
    required this.purchasePrice,
    this.quantity = 1,
    this.duration = 1,
    this.isRental = true,
  });

    double get totalPrice => isRental ? rentalPrice * quantity * duration : purchasePrice * quantity;

}

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void incrementQuantity(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }

  void incrementDuration(int index) {
    _items[index].duration++;
    notifyListeners();
  }

  void decrementDuration(int index) {
    if (_items[index].duration > 1) {
      _items[index].duration--;
      notifyListeners();
    }
  }

   double get subtotal {
    double total = 0.0;
    for (var item in _items) {
      total += item.totalPrice;
    }
    return total;
  }

  double get deliveryCost => 4.00;

  double get total => subtotal + deliveryCost;

  
}
