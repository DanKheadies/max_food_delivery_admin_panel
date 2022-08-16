import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:max_food_delivery_admin_panel/bloc/blocs.dart';
import 'package:max_food_delivery_admin_panel/config/responsive.dart';
import 'package:max_food_delivery_admin_panel/widgets/widgets.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomLayout(
        title: 'Restaurant Menu',
        widgets: [
          _buildProductCarousel(),
          const SizedBox(height: 20),
          Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
              ? Container(
                  constraints: const BoxConstraints(
                    minHeight: 300,
                    // maxHeight: 1300,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildCategories(context),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildProducts(context),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    _buildCategories(context),
                    const SizedBox(height: 20),
                    _buildProducts(context),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        minHeight: 75,
                      ),
                      color: Theme.of(context).colorScheme.primary,
                      child: const Center(
                        child: Text('Some ads here'),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  BlocBuilder<ProductBloc, ProductState> _buildProductCarousel() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductLoaded) {
          return SizedBox(
            width: double.infinity,
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return (index == 0)
                    ? const AddProductCard()
                    : ProductCard(
                        product: state.products[index - 1],
                      );
              },
            ),
          );
        } else {
          return const Center(
            child: Text('Something went wrong.'),
          );
        }
      },
    );
  }

  Container _buildCategories(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 20),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
              if (state is CategoryLoaded) {
                return ReorderableListView(
                  shrinkWrap: true,
                  onReorder: (oldIndex, newIndex) {
                    context.read<CategoryBloc>().add(
                          SortCategories(
                            oldIndex: oldIndex,
                            newIndex: newIndex,
                          ),
                        );
                  },
                  children: [
                    for (int index = 0;
                        index < state.categories.length;
                        index++)
                      CategoryListTile(
                        category: state.categories[index],
                        onTap: () {
                          context.read<CategoryBloc>().add(
                                SelectCategory(
                                  state.categories[index],
                                ),
                              );
                        },
                        key: ValueKey(state.categories[index].id),
                      ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('Something went wrong.'),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Container _buildProducts(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Products',
            style: Theme.of(context).textTheme.headline4,
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
              if (state is ProductLoaded) {
                return ReorderableListView(
                  shrinkWrap: true,
                  onReorder: (oldIndex, newIndex) {
                    context.read<ProductBloc>().add(
                          SortProducts(
                            oldIndex: oldIndex,
                            newIndex: newIndex,
                          ),
                        );
                  },
                  children: [
                    for (int index = 0; index < state.products.length; index++)
                      ProductListTile(
                        product: state.products[index],
                        onTap: () {},
                        key: ValueKey(state.products[index].id),
                      ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('Something went wrong.'),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
