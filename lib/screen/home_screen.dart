import 'package:ecommerce_project/bloc/banner/banner_bloc.dart';
import 'package:ecommerce_project/bloc/category/category_bloc.dart';
import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/widgets/banner_slider.dart';
import 'package:ecommerce_project/widgets/category_horizontal_item_list.dart';
import 'package:ecommerce_project/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<BannerBloc>(context).add(BannerRequestEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorProject.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
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
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            textAlign:
                                TextAlign.right, // متن داخل فیلد راست‌چین شود
                            textDirection:
                                TextDirection.rtl, // جهت متن راست‌چین شود
                            decoration: InputDecoration(
                              label: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  "جستجوی محصولات",
                                  style: TextStyle(
                                    fontFamily: "SB",
                                    fontSize: 16,
                                    color: ColorProject.grey,
                                  ),
                                ),
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior
                                      .auto, // لیبل هنگام فوکوس به بالا می‌رود
                              border: InputBorder.none, // حذف خط زیرین
                              // لیبل به راست برود
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(
                                  10.0,
                                ), // تنظیم فاصله آیکون از لبه‌ها
                                child: SizedBox(
                                  width: 26,
                                  height: 26,
                                  child: Image.asset(
                                    "assets/images/icon_search.png",
                                  ),
                                ),
                              ), // آیکون سمت چپ
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: 26,
                                  height: 26,
                                  child: Image.asset(
                                    "assets/images/icon_apple_blue.png",
                                  ),
                                ),
                              ), // آیکون سمت راست
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<BannerBloc, BannerState>(
              builder: (context, state) {
                if (state is BannerLoading) {
                  return SliverToBoxAdapter(child: CircularProgressIndicator());
                }

                if (state is BannerResponseState) {
                  return state.response.fold(
                    (l) {
                      return SliverToBoxAdapter(child: Text(l));
                    },
                    (r) {
                      return SliverToBoxAdapter(child: BannerSlider(list: r));
                    },
                  );
                }
                return SliverToBoxAdapter(child: Text("error"));
              },
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 44,
                  right: 44,
                  bottom: 20,
                  top: 32,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "دسته بندی",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SB",
                        color: ColorProject.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 44),
                child: SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CategoryItemChip(),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 44,
                  right: 44,
                  bottom: 20,
                  top: 32,
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/icon_left_categroy.png"),
                    SizedBox(width: 10),
                    Text(
                      "مشاهده همه ",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SB",
                        color: ColorProject.blue,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "پر فروش ترین ها",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SB",
                        color: ColorProject.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 44),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ProductItem(),
                      );
                    },
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 44,
                  right: 44,
                  bottom: 20,
                  top: 32,
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/icon_left_categroy.png"),
                    SizedBox(width: 10),
                    Text(
                      "مشاهده همه ",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SB",
                        color: ColorProject.blue,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "پر بازدید ترین ها",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "SB",
                        color: ColorProject.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(right: 44),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ProductItem(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
