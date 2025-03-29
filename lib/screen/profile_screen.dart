import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/widgets/category_horizontal_item_list.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorProject.backgroundScreenColor,

      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 44,
                  right: 44,
                  bottom: 32,
                  top: 20,
                ),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "حساب کاربری",
                            style: TextStyle(
                              color: ColorProject.blue,
                              fontFamily: "SB",
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset("assets/images/icon_apple_blue.png"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                "محمد جواد  هاشمی",
                style: TextStyle(
                  fontFamily: "SB",
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 3),
              Text(
                "09123393795",
                style: TextStyle(
                  fontFamily: "SM",
                  fontSize: 10,
                  color: ColorProject.grey,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    // CategoryItemChip(),
                    // CategoryItemChip(),
                    // CategoryItemChip(),
                    // CategoryItemChip(),
                    // CategoryItemChip(),
                    // CategoryItemChip(),
                    // CategoryItemChip(),
                    // CategoryItemChip(),
                    // CategoryItemChip(),
                    // CategoryItemChip(),
                  ],
                ),
              ),
              Spacer(),

              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  children: [
                    Text(
                      "اپل شاپ",
                      style: TextStyle(fontFamily: "SM", fontSize: 10),
                    ),
                    Text(
                      "V1-0.0.0.00",
                      style: TextStyle(fontFamily: "SM", fontSize: 10),
                    ),
                    Text(
                      "navidtransport.com",
                      style: TextStyle(fontSize: 10, fontFamily: "SM"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
