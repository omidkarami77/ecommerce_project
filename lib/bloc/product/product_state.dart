part of 'product_bloc.dart';

@immutable
sealed class ProductItemsState {}

final class ProductInitial extends ProductItemsState {}

class ProductLoadingState extends ProductItemsState {}

class ProductRequestSuccessState extends ProductItemsState {
  Either<String, List<ProductImageItems>> response;
  Either<String, List<ProductVariant>> productVariant;

  ProductRequestSuccessState(this.response, this.productVariant);
}
