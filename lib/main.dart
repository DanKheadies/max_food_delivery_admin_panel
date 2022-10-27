import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:max_food_delivery_admin_panel/bloc/blocs.dart';
import 'package:max_food_delivery_admin_panel/config/theme.dart';
import 'package:max_food_delivery_admin_panel/firebase_options.dart';
import 'package:max_food_delivery_admin_panel/models/models.dart';
import 'package:max_food_delivery_admin_panel/repositories/repositories.dart';
import 'package:max_food_delivery_admin_panel/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RestaurantRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryBloc()
              ..add(
                LoadCategories(
                  categories: Category.categories,
                ),
              ),
          ),
          BlocProvider(
            create: (context) => ProductBloc(
              categoryBloc: BlocProvider.of<CategoryBloc>(context),
              restaurantRepository: context.read<RestaurantRepository>(),
            )..add(
                LoadProducts(
                  products: Product.products,
                ),
              ),
          ),
          BlocProvider(
            create: (context) => SettingsBloc(
                restaurantRepository: context.read<RestaurantRepository>())
              ..add(
                const LoadSettings(),
              ),
          ),
        ],
        child: MaterialApp(
          title: 'Max Food Delivery Admin Panel',
          theme: theme(),
          initialRoute: '/dashboard',
          routes: {
            '/menu': (context) => const MenuScreen(),
            '/dashboard': (context) => const DashboardScreen(),
            '/settings': (context) => const SettingsScreen(),
          },
        ),
      ),
    );
  }
}
