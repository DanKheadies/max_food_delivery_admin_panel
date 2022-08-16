import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:max_food_delivery_admin_panel/bloc/blocs.dart';
import 'package:max_food_delivery_admin_panel/config/responsive.dart';
// import 'package:max_food_delivery_admin_panel/models/models.dart';
import 'package:max_food_delivery_admin_panel/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomLayout(
        title: 'Settings',
        widgets: [
          _buildImage(),
          Responsive.isDesktop(context) || Responsive.isWideDesktop(context)
              ? IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildBasicInformation(context),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildRestaurantDescription(context),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    _buildBasicInformation(context),
                    const SizedBox(height: 10),
                    _buildRestaurantDescription(context),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Text(
              'Opening Hours',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          _buildOpeningHours(),
        ],
      ),
    );
  }

  BlocBuilder<SettingsBloc, SettingsState> _buildOpeningHours() {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SettingsLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.restaurant.openingHours!.length,
            itemBuilder: (context, index) {
              var openingHours = state.restaurant.openingHours![index];
              return OpeningHoursSettings(
                openingHours: openingHours,
                onCheckboxChanged: (value) {
                  context.read<SettingsBloc>().add(
                        UpdateOpeningHours(
                          openingHours: openingHours.copyWith(
                            isOpen: !openingHours.isOpen,
                          ),
                        ),
                      );
                },
                onSliderChanged: (value) {
                  context.read<SettingsBloc>().add(
                        UpdateOpeningHours(
                          openingHours: openingHours.copyWith(
                            openAt: value.start,
                            closeAt: value.end,
                          ),
                        ),
                      );
                },
              );
            },
          );
        } else {
          return const Center(
            child: Text('Something went wrong.'),
          );
        }
      },
    );
  }

  Container _buildBasicInformation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).backgroundColor,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SettingsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basic Information',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Name',
                  hasTitle: true,
                  initialValue: (state.restaurant.name != null)
                      ? state.restaurant.name!
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant: state.restaurant.copyWith(
                              name: value,
                            ),
                          ),
                        );
                  },
                  onFocusChanged: (hasFocus) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            isUpdateComplete: true,
                            restaurant: state.restaurant,
                          ),
                        );
                  },
                ),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Image',
                  hasTitle: true,
                  initialValue: (state.restaurant.imageUrl != null)
                      ? state.restaurant.imageUrl!
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant: state.restaurant.copyWith(
                              imageUrl: value,
                            ),
                          ),
                        );
                  },
                  onFocusChanged: (hasFocus) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            isUpdateComplete: true,
                            restaurant: state.restaurant,
                          ),
                        );
                  },
                ),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Tags',
                  hasTitle: true,
                  initialValue: (state.restaurant.tags != null)
                      ? state.restaurant.tags!.join(', ')
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant: state.restaurant.copyWith(
                              tags: value.split(', '),
                            ),
                          ),
                        );
                  },
                  onFocusChanged: (hasFocus) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            isUpdateComplete: true,
                            restaurant: state.restaurant,
                          ),
                        );
                  },
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
    );
  }

  Container _buildRestaurantDescription(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).backgroundColor,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SettingsLoaded) {
            return Column(
              children: [
                Text(
                  'Restaurant Description',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  maxLines: 5,
                  title: 'Description',
                  hasTitle: false,
                  initialValue: (state.restaurant.description != null)
                      ? state.restaurant.description!
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant: state.restaurant.copyWith(
                              description: value,
                            ),
                          ),
                        );
                  },
                  onFocusChanged: (hasFocus) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            isUpdateComplete: true,
                            restaurant: state.restaurant,
                          ),
                        );
                  },
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
    );
  }

  BlocBuilder<SettingsBloc, SettingsState> _buildImage() {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SettingsLoaded) {
          return (state.restaurant.imageUrl != null)
              ? Container(
                  height: 200,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        state.restaurant.imageUrl!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const SizedBox();
        } else {
          return const Center(
            child: Text('Something went wrong.'),
          );
        }
      },
    );
  }
}
