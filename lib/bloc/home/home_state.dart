part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class BannerInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerItems>> response;
  Either<String, List<Items>> categoryList;
  Either<String, List<ProductItems>> getProducts;
  Either<String, List<ProductItems>> getBestSellerProduct;
  Either<String, List<ProductItems>> getHotest;

  HomeRequestSuccessState(
    this.response,
    this.categoryList,
    this.getProducts,
    this.getBestSellerProduct,
    this.getHotest,
  );
}
