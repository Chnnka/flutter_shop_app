import 'package:flutter/material.dart';
import 'package:flutter_shop_app/cart_item_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: const Text(''),
        ),
        body: const CartItem());
  }
}
