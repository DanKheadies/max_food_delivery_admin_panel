import 'package:flutter/material.dart';

import 'package:max_food_delivery_admin_panel/config/responsive.dart';

class CustomLayout extends StatelessWidget {
  const CustomLayout({
    Key? key,
    required this.title,
    required this.widgets,
  }) : super(key: key);

  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: 20),
                  ...widgets,
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
            ? Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                    right: 20,
                  ),
                  color: Theme.of(context).backgroundColor,
                  child: const Center(
                    child: Text('Some ads here'),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
