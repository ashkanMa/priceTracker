import 'package:flutter/material.dart';
import 'package:price_tracker/core/helper/string_const.dart';

class AppBarWidget extends StatelessWidget  with PreferredSizeWidget{
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(StringConstants.appTitle),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
