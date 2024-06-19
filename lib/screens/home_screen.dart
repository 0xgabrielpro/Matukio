import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eventright_pro_user/constant/color_constant.dart';
import 'package:eventright_pro_user/constant/pref_constants.dart';
import 'package:eventright_pro_user/constant/preferences.dart';
import 'package:eventright_pro_user/screens/auth/signin_screen.dart';
import 'package:eventright_pro_user/screens/events_screen.dart';
import 'package:eventright_pro_user/screens/favorite_screen.dart';
import 'package:eventright_pro_user/screens/order_screen.dart';
import 'package:eventright_pro_user/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatefulWidget {
  final int? index;
  final String? goOutText;

  const HomeScreen({Key? key, this.index, this.goOutText}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedPageIndex = 0;

  List<Widget> pages = [
    const EventsScreen(),
    const OrderScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    if (widget.index != null) {
      _selectedPageIndex = widget.index!;
    }
    super.initState();
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: "Tap again to exit App",
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        primary: true,
        body: Scaffold(
          key: scaffoldKey,
          body: pages[_selectedPageIndex],
          bottomNavigationBar: _buildBottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return CustomNavigationBar(
      iconSize: 25.0,
      selectedColor: AppColors.primaryColor,
      strokeColor: AppColors.whiteColor,
      unSelectedColor: AppColors.inputTextColor,
      items: [
        CustomNavigationBarItem(
          icon: const Icon(Icons.home),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.calendar_month),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.favorite),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.person),
        ),
      ],
      currentIndex: _selectedPageIndex,
      onTap: (index) {
        setState(() {
          if ((index == 1 || index == 2 || index == 3) &&
              SharedPreferenceHelper.getBoolean(Preferences.isLoggedIn) == false) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          } else {
            _selectedPageIndex = index;
          }
        });
      },
    );
  }
}
