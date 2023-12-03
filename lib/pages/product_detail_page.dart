import 'package:flutter/material.dart';

import 'package:flutter_shop_app/cart_provider.dart';
import 'package:provider/provider.dart';

import 'pages.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedSize = 0;

  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'size': selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.greenAccent,
          content: Text(
            'Item Added to the cart',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          action: SnackBarAction(
            label: 'Go to cart',
            textColor: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {},
          ),
          backgroundColor: Colors.redAccent,
          content: Text(
            'Please Select a Size',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(),
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(207, 207, 207, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Text(
                    '\$${widget.product['price']}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 45),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['size'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size =
                            (widget.product['size'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              label: Text(
                                size.toString(),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              backgroundColor: selectedSize == size
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    label: Text(
                      'Add to Cart',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 46),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: onTap,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
