import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:max_food_delivery_admin_panel/bloc/blocs.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return AppBar(
            title: Text(
              '',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.white,
                  ),
            ),
            centerTitle: false,
          );
        }
        if (state is SettingsLoaded) {
          return AppBar(
            title: Text(
              (state.restaurant.name == null) ? '' : state.restaurant.name!,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.white,
                  ),
            ),
            centerTitle: false,
          );
        } else {
          return const Center(
            child: Text('Something went wrong.'),
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
