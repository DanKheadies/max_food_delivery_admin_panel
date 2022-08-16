import 'package:flutter/material.dart';

import 'package:max_food_delivery_admin_panel/models/models.dart';

class CategoryListTile extends StatelessWidget {
  const CategoryListTile({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  final Category category;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        category.imageUrl,
        height: 25,
      ),
      title: Text(
        category.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        category.description,
        style: Theme.of(context).textTheme.headline6,
      ),
      // trailing: const Icon(Icons.menu),
      onTap: onTap,
    );
  }
}
