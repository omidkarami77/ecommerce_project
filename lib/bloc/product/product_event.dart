part of 'product_bloc.dart';

@immutable
sealed class ProductItemsEvent {}

class ProductItemsInitEvent extends ProductItemsEvent {
  String productId;
  ProductItemsInitEvent(this.productId);
}
