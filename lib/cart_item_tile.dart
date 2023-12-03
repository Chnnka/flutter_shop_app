import 'package:flutter/material.dart';
import 'package:flutter_shop_app/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;

    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context, index) {
        final cartItem = cart[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            radius: 30,
          ),
          title: Text(
            cartItem['title'].toString(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            'Size:${cartItem['size']}',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey[700]),
          ),
          trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog.adaptive(
                      title: Text(
                        'Delete Product',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text(
                        'Are you Sure want to delete product from the cart?',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[700],
                            ),
                      ),
                      actions: [
                        TextButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey[700],
                          ),
                          label: Text(
                            'No',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.blue[700]),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            context
                                .read<CartProvider>()
                                .removeProduct(cartItem);
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.done,
                            color: Colors.grey[700],
                          ),
                          label: Text(
                            'Yes',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.red[700]),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
        );
      },
    );
  }
}
