import 'package:exec_array/models/product.dart';
import 'package:exec_array/provider/cart_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseService {
  static Database? _db;
  static final DataBaseService instance = DataBaseService._construct();

  DataBaseService._construct();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE products (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          imagePath TEXT NOT NULL,
          salePrice REAL NOT NULL,
          rentPrice REAL NOT NULL,
          productDescraption TEXT NOT NULL
        )
        ''');

        db.execute('''
        CREATE TABLE cart_items (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          image TEXT NOT NULL,
          rentalPrice REAL NOT NULL,
          purchasePrice REAL NOT NULL,
          quantity INTEGER NOT NULL,
          duration INTEGER NOT NULL,
          isRental INTEGER NOT NULL
        )
        ''');
      },
    );
  }

  // Product Methods
  Future<void> addProduct(Product product) async {
    final db = await database;
    await db.insert('products', product.toMap());
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  Future<void> updateProduct(Product product) async {
    final db = await database;
    await db.update('products', product.toMap(), where: 'id = ?', whereArgs: [product.id]);
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  // Cart Item Methods
  Future<void> addCartItem(CartItem item) async {
    final db = await database;

    // Check if the item already exists
    final List<Map<String, dynamic>> existingItems = await db.query(
      'cart_items',
      where: 'name = ? AND isRental = ?',
      whereArgs: [item.name, item.isRental ? 1 : 0],
    );

    if (existingItems.isNotEmpty) {
      // Item exists, update the quantity
      final existingItem = CartItem.fromMap(existingItems.first);
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + item.quantity,
      );

      await db.update(
        'cart_items',
        updatedItem.toMap(),
        where: 'id = ?',
        whereArgs: [existingItem.id],
      );
    } else {
      // Item does not exist, insert it
      await db.insert('cart_items', item.toMap());
    }
  }

  Future<List<CartItem>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cart_items');
    return List.generate(maps.length, (i) {
      return CartItem.fromMap(maps[i]);
    });
  }

  Future<void> updateCartItem(CartItem item) async {
    final db = await database;
    await db.update('cart_items', item.toMap(), where: 'id = ?', whereArgs: [item.id]);
  }

  Future<void> deleteCartItem(int id) async {
    final db = await database;
    await db.delete('cart_items', where: 'id = ?', whereArgs: [id]);
  }
}