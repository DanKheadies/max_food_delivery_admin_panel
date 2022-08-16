import 'package:flutter/material.dart';

import 'package:max_food_delivery_admin_panel/models/models.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.product,
    required this.onTap,
  }) : super(key: key);

  final Product product;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(
        product.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        product.description,
        style: Theme.of(context).textTheme.headline6,
      ),
      onTap: onTap,
    );
  }
}
