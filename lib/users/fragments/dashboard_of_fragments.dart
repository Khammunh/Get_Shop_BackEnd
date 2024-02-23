// ignore_for_file: must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxshop/users/fragments/favorites_fragment_screen.dart';
import 'package:getxshop/users/fragments/home_fragment_screen.dart';
import 'package:getxshop/users/fragments/order_fragment_screen.dart';
import 'package:getxshop/users/fragments/profile_fragment_screen.dart';
import 'package:getxshop/users/userPreferences/current_user.dart';

class DashboardOfFragments extends StatelessWidget {
  DashboardOfFragments({super.key});
  CurrentUser _rememberCurrentUser = Get.put(CurrentUser());
  List<Widget> _fragmentScreen = [
    const HomeFragmentScreen(),
    const FavoritesFragmentScreen(),
    const OrderFragmentScreen(),
    const ProfileFragmentScreen(),
  ];

  List _navigationButtonsProperties = [
    {
      "active_icon": Icons.home,
      "non_active_icon": Icons.home_outlined,
      "label": "Home"
    },
    {
      "active_icon": Icons.favorite,
      "non_active_icon": Icons.favorite_border,
      "label": "Favorites"
    },
    {
      "active_icon": Icons.favorite,
      "non_active_icon": Icons.favorite_border,
      "label": "Favorites"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentUser(),
      initState: (currentState) {
        _rememberCurrentUser.getUserInfo();
      },
      builder: (controller) {
        return const Scaffold();
      },
    );
  }
}
