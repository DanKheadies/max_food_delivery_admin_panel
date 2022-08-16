import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:max_food_delivery_admin_panel/bloc/blocs.dart';
import 'package:max_food_delivery_admin_panel/models/models.dart';
import 'package:max_food_delivery_admin_panel/widgets/widgets.dart';

class AddProductCard extends StatelessWidget {
  const AddProductCard({
    Key? key,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            iconSize: 40,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return _buildNewProduct(context);
                },
              );
            },
          ),
          Text(
            'Add a Product',
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }

  Dialog _buildNewProduct(BuildContext context) {
    var uuid = const Uuid();
    Product product = Product(
      name: '',
      restaurantId: 'HfcneOR3g8Jpfrpdaj92',
      id: uuid.v1(),
      category: '',
      description: '',
      imageUrl: '',
      price: 0,
    );

    return Dialog(
      child: Container(
        height: 500,
        width: 450,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Add a Product',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(height: 20),
            CustomDropdownButton(
              items:
                  Category.categories.map((category) => category.name).toList(),
              onChanged: (value) {
                product = product.copyWith(
                  category: value,
                );
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              maxLines: 1,
              title: 'Name',
              hasTitle: true,
              initialValue: '',
              onChanged: (value) {
                product = product.copyWith(
                  name: value,
                );
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              maxLines: 1,
              title: 'Price',
              hasTitle: true,
              initialValue: '',
              onChanged: (value) {
                product = product.copyWith(
                  price: double.parse(value),
                );
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              maxLines: 1,
              title: 'Image URL',
              hasTitle: true,
              initialValue: '',
              onChanged: (value) {
                product = product.copyWith(
                  imageUrl: value,
                );
              },
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              maxLines: 3,
              title: 'Description',
              hasTitle: true,
              initialValue: '',
              onChanged: (value) {
                product = product.copyWith(
                  description: value,
                );
              },
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ProductBloc>(context).add(
                    AddProduct(
                      product: product,
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 40),
                ),
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
