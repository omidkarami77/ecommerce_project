import 'package:dartz/dartz_unsafe.dart';
import 'package:ecommerce_project/bloc/category/category_bloc.dart';
import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/data/model/category.dart';
import 'package:ecommerce_project/data/repository/categoryy_repository.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:ecommerce_project/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Items>? list;

  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestList());

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
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset("assets/images/icon_apple_blue.png"),
                      ),

                      Expanded(
                        child: Center(
                          child: Text(
                            "دسته بندی",
                            style: TextStyle(
                              color: ColorProject.blue,
                              fontFamily: "SB",
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: ((context, state) {
                if (state is CategoryLoading) {
                  return SliverToBoxAdapter(child: CircularProgressIndicator());
                }
                if (state is CategoryResponseState) {
                  return state.response.fold(
                    (l) {
                      return SliverToBoxAdapter(child: Text(l));
                    },
                    (r) {
                      return _listCategory(list: r);
                    },
                  );
                }
                return SliverToBoxAdapter(child: Text("error"));
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class _listCategory extends StatelessWidget {
  List<Items>? list;
  _listCategory({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 44),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: list?.length ?? 0, (
          context,
          index,
        ) {
          return CachedImage(urlImage: list?[index].thumbnail ?? 'test');
        }),

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
