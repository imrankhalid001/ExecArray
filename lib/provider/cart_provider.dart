import 'package:exec_array/servies/database_service.dart';
import 'package:flutter/material.dart';

class CartItem {
  final int id;
  final String name;
  final String image;
  final double rentalPrice;
  final double purchasePrice;
  int quantity;
  int duration;
  bool isRental;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.rentalPrice,
    required this.purchasePrice,
    this.quantity = 1,
    this.duration = 1,
    this.isRental = true,
  });

  // Convert a CartItem into a Map. The keys must correspond to the names of the columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'rentalPrice': rentalPrice,
      'purchasePrice': purchasePrice,
      'quantity': quantity,
      'duration': duration,
      'isRental': isRental ? 1 : 0,
    };
  }

  // A method that converts a map into a CartItem
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      rentalPrice: map['rentalPrice'],
      purchasePrice: map['purchasePrice'],
      quantity: map['quantity'],
      duration: map['duration'],
      isRental: map['isRental'] == 1,
    );
  }

CartItem copyWith({
    int? id,
    String? name,
    String? image,
    double? rentalPrice,
    double? purchasePrice,
    int? quantity,
    int? duration,
    bool? isRental,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      rentalPrice: rentalPrice ?? this.rentalPrice,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      quantity: quantity ?? this.quantity,
      duration: duration ?? this.duration,
      isRental: isRental ?? this.isRental,
    );
  }


    double get totalPrice => isRental ? rentalPrice * quantity * duration : purchasePrice * quantity;

}

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get subtotal => _items.fold(0.0, (sum, item) => sum + item.totalPrice);

  CartProvider() {
    loadCartItems();
  }

  Future<void> loadCartItems() async {
    _items = await DataBaseService.instance.getCartItems();
    notifyListeners();
  }

  Future<void> addItem(CartItem item) async {
    await DataBaseService.instance.addCartItem(item);
    _items = await DataBaseService.instance.getCartItems();
    notifyListeners();
  }

  Future<void> removeItem(int id) async {
    await DataBaseService.instance.deleteCartItem(id);
    _items = await DataBaseService.instance.getCartItems();
    notifyListeners();
  }

  Future<void> incrementQuantity(int index) async {
    _items[index].quantity++;
    await DataBaseService.instance.updateCartItem(_items[index]);
    notifyListeners();
  }

  Future<void> decrementQuantity(int index) async {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
      await DataBaseService.instance.updateCartItem(_items[index]);
      notifyListeners();
    }
  }

  Future<void> incrementDuration(int index) async {
    _items[index].duration++;
    await DataBaseService.instance.updateCartItem(_items[index]);
    notifyListeners();
  }

  Future<void> decrementDuration(int index) async {
    if (_items[index].duration > 1) {
      _items[index].duration--;
      await DataBaseService.instance.updateCartItem(_items[index]);
      notifyListeners();
    }
  }

  void toggleRental(int index, bool isRental) async {
    _items[index].isRental = isRental;
    await DataBaseService.instance.updateCartItem(_items[index]);
    notifyListeners();
  }
}
