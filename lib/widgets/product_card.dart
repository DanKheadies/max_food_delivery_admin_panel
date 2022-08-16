import 'package:flutter/material.dart';

import 'package:max_food_delivery_admin_panel/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(
        right: 10,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(product.imageUrl),
          ),
          Text(
            product.name,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            '\$${product.price}',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
