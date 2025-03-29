import 'dart:ui';
import 'package:ecommerce_project/bloc/home/home_bloc.dart';
import 'package:ecommerce_project/bloc/category/category_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_project/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/screen/card_screen.dart';
import 'package:ecommerce_project/screen/category_screen.dart';
import 'package:ecommerce_project/screen/home_screen.dart';
import 'package:ecommerce_project/screen/login_screen.dart';
import 'package:ecommerce_project/screen/product_detail_screen.dart';
import 'package:ecommerce_project/screen/product_list_screen.dart';
import 'package:ecommerce_project/screen/profile_screen.dart';
import 'package:ecommerce_project/widgets/banner_slider.dart';
import 'package:ecommerce_project/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedBottomNavigation = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) => AuthenticationBloc(),
          child: IndexedStack(
            index: selectedBottomNavigation,
            children: getLayout(),
          ),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: BottomNavigationBar(
              currentIndex: selectedBottomNavigation,
              onTap: (int index) {
                setState(() {
                  selectedBottomNavigation = index;
                });
              },
              unselectedLabelStyle: TextStyle(
                fontFamily: "SB",
                fontSize: 10,
                color: Colors.black,
              ),
              selectedLabelStyle: TextStyle(
                fontFamily: "SB",
                fontSize: 10,
                color: ColorProject.blue,
              ),
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: Colors.transparent,

              items: [
                BottomNavigationBarItem(
                  label: 'حساب کاربری',

                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset("assets/images/icon_profile.png"),
                  ),

                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      child: Image.asset(
                        "assets/images/icon_profile_active.png",
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: ColorProject.blue,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'سبد خرید',
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      child: Image.asset(
                        "assets/images/icon_basket_active.png",
                      ),
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset("assets/images/icon_basket.png"),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'دسته بندی',
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      child: Image.asset(
                        "assets/images/icon_category_active.png",
                      ),
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset("assets/images/icon_category.png"),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'خانه',
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      child: Image.asset("assets/images/icon_home_active.png"),
                    ),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset("assets/images/icon_home.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      ProfileScreen(),
      CardScreen(),
      BlocProvider(
        create: (context) => CategoryBloc(),
        child: CategoryScreen(),
      ),
      BlocProvider(create: (context) => HomeBloc(), child: HomeScreen()),
    ];
  }
}
