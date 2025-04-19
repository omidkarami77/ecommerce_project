import 'dart:ui';

import 'package:dartz/dartz_unsafe.dart';
import 'package:ecommerce_project/bloc/product/product_bloc.dart';
import 'package:ecommerce_project/constants/colors.dart';
import 'package:ecommerce_project/data/model/gallery.dart';
import 'package:ecommerce_project/data/model/product.dart';
import 'package:ecommerce_project/data/model/product_variant.dart';
import 'package:ecommerce_project/data/model/variant.dart';
import 'package:ecommerce_project/data/model/variant_type.dart';
import 'package:ecommerce_project/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductItems product;

  ProductDetailScreen(this.product, {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(
      context,
    ).add(ProductItemsInitEvent(widget.product.id!, widget.product.category!));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductItemsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorProject.backgroundScreenColor,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                if (state is ProductLoadingState) ...[
                  SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],

                if (state is ProductRequestSuccessState) ...[
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Image.asset(
                                "assets/images/icon_apple_blue.png",
                              ),
                            ),

                            state.productCategory.fold(
                              (l) {
                                return Text(l);
                              },
                              (r) {
                                return Text(r.title!);
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Image.asset("assets/images/icon_back.png"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      "se آیفون 22 ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "SB", fontSize: 16),
                    ),
                  ),
                ),
                if (state is ProductRequestSuccessState) ...[
                  state.response.fold(
                    (l) {
                      return SliverToBoxAdapter(child: Text(l));
                    },
                    (r) {
                      print(r[0].image);
                      return GalleryWidget(widget.product.thumbnail, r);
                    },
                  ),
                ],

                if (state is ProductRequestSuccessState) ...[
                  state.productVariant.fold(
                    (l) {
                      return SliverToBoxAdapter(child: Text(l));
                    },
                    (variantList) {
                      return VariantContainer(variantList);
                    },
                  ),
                ],
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 44,
                          vertical: 20,
                        ),
                        child: Container(
                          width: 340,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                              color: ColorProject.grey,
                              width: 1,
                            ),
                          ),

                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Image.asset(
                                "assets/images/icon_left_categroy.png",
                              ),
                              SizedBox(width: 10),
                              Text(
                                "مشاهده",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SB",
                                  color: ColorProject.blue,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  ": مشخصات فنی",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "SM",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 44),
                        child: Container(
                          width: 340,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                              color: ColorProject.grey,
                              width: 1,
                            ),
                          ),

                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Image.asset(
                                "assets/images/icon_left_categroy.png",
                              ),
                              SizedBox(width: 10),
                              Text(
                                "مشاهده",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SB",
                                  color: ColorProject.blue,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  ": توضیحات محصول",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "SM",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 44, right: 44, top: 20),
                        child: Container(
                          width: 340,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                              color: ColorProject.grey,
                              width: 1,
                            ),
                          ),

                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Image.asset(
                                "assets/images/icon_left_categroy.png",
                              ),
                              SizedBox(width: 10),
                              Text(
                                "مشاهده",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SB",
                                  color: ColorProject.blue,
                                ),
                              ),
                              Spacer(),

                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 15,
                                    child: Container(
                                      height: 26,
                                      width: 26,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 30,
                                    child: Container(
                                      height: 26,
                                      width: 26,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 45,
                                    child: Container(
                                      height: 26,
                                      width: 26,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 60,
                                    child: Container(
                                      height: 26,
                                      width: 26,
                                      decoration: BoxDecoration(
                                        color: ColorProject.grey,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          "+10",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "SB",
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10, left: 5),
                                child: Text(
                                  ": نظرات کاربران",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: "SM",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PriceButton(),
                      SizedBox(width: 20),
                      AddToBasketButton(),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 32)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class VariantContainer extends StatelessWidget {
  List<ProductVariant> variantList;

  @override
  VariantContainer(this.variantList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              variantList[0].variantTypeItems.title!,
              style: TextStyle(
                fontSize: 12,
                fontFamily: "SM",
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),

            ColorVariantList(variantList[0].variants),

            SizedBox(height: 20),

            Text(
              variantList[1].variantTypeItems.title!,
              style: TextStyle(
                fontSize: 12,
                fontFamily: "SM",
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),

            StorageVariantList(variantList[0].variants),
          ],
        ),
      ),
    );
  }
}

class GalleryWidget extends StatefulWidget {
  List<ProductImageItems> list;
  String? defaultProductTumbnail;
  int seletedItem = 0;

  GalleryWidget(this.defaultProductTumbnail, this.list, {super.key});

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44),
        child: Container(
          height: 284,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/icon_star.png"),
                      Text(
                        "4.5",
                        style: TextStyle(fontFamily: "SM", fontSize: 12),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 200,
                        width: 200,

                        child: CachedImage(
                          urlImage:
                              (widget.list.isEmpty)
                                  ? widget.defaultProductTumbnail
                                  : widget.list[widget.seletedItem].image,
                        ),
                      ),
                      Spacer(),
                      Image.asset("assets/images/icon_favorite_deactive.png"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              if (widget.list.isNotEmpty) ...[
                SizedBox(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: ListView.builder(
                      itemCount: widget.list.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.seletedItem = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(
                                  width: 1,
                                  color: ColorProject.grey,
                                ),
                              ),
                              width: 70,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CachedImage(
                                  urlImage: widget.list[index].image,
                                  radius: 10,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: 60,
            width: 140,
            decoration: BoxDecoration(
              color: ColorProject.blue,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),

            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 53,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      "افزودن سبد خرید",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "SB",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PriceButton extends StatelessWidget {
  const PriceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            height: 60,
            width: 140,
            decoration: BoxDecoration(
              color: ColorProject.green,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),

            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 53,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              'تومان',
                              style: TextStyle(
                                fontFamily: 'sm',
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "11,480,000",
                                  style: const TextStyle(
                                    fontFamily: 'sm',
                                    fontSize: 12,
                                    color: Colors.white,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  "11,400,000",
                                  style: const TextStyle(
                                    fontFamily: 'sm',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 24,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  width: 26,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    color: Colors.red,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Text(
                                      "3%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "SB",
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorVariantList extends StatefulWidget {
  List<Variant> variantList;

  ColorVariantList(this.variantList, {super.key});

  @override
  State<ColorVariantList> createState() => _ColorVariantListState();
}

class _ColorVariantListState extends State<ColorVariantList> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.variantList.length,
          itemBuilder: (context, index) {
            String categoryColor = 'ff${widget.variantList[index].value}';
            int hexColor = int.parse(categoryColor, radix: 16);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  border:
                      (selectedIndex == index)
                          ? Border.all(
                            color: Colors.white,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          )
                          : Border.all(color: Colors.white, width: 0),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: Color(hexColor),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class StorageVariantList extends StatefulWidget {
  List<Variant> storageVariantList;
  StorageVariantList(this.storageVariantList, {super.key});

  @override
  State<StorageVariantList> createState() => _StorageVariantListState();
}

class _StorageVariantListState extends State<StorageVariantList> {
  var selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 28,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedItemIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border:
                      (selectedItemIndex == index)
                          ? Border.all(
                            width: 2,
                            color: ColorProject.blueIndicator,
                          )
                          : Border.all(width: 1, color: ColorProject.green),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  child: Center(
                    child: Text(
                      widget.storageVariantList[index].name!,
                      style: TextStyle(fontFamily: 'sb', fontSize: 12),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
