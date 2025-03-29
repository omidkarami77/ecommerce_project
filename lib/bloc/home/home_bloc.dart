import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/data/model/banner.dart';
import 'package:ecommerce_project/data/model/category.dart';
import 'package:ecommerce_project/data/model/product.dart';
import 'package:ecommerce_project/data/repository/banner_repository.dart';
import 'package:ecommerce_project/data/repository/categoryy_repository.dart';
import 'package:ecommerce_project/data/repository/product_repository.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _repository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();
  final IProductRepository _productRepository = locator.get();
  HomeBloc() : super(BannerInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HomeRequestEvent>((event, emit) async {
      // TODO: implement event handler
      emit(HomeLoadingState());

      var response = await _repository.getBanners();
      var categoryResponse = await _categoryRepository.getCategories();

      var productResponse = await _productRepository.getProducts();
      var bestSellerProductResponse =
          await _productRepository.getBestSellerProduct();
      var hotestProductResponse = await _productRepository.getHotest();

      emit(
        HomeRequestSuccessState(
          response,
          categoryResponse,
          productResponse,
          bestSellerProductResponse,
          hotestProductResponse,
        ),
      );
    });
  }
}
