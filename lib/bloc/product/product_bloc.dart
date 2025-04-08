import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/data/model/gallery.dart';
import 'package:ecommerce_project/data/model/product.dart';
import 'package:ecommerce_project/data/model/product_variant.dart';
import 'package:ecommerce_project/data/model/variant_type.dart';
import 'package:ecommerce_project/data/repository/product_detail_repository.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductItemsEvent, ProductItemsState> {
  final IProductDetailRepository _productDetailRepository = locator.get();

  ProductBloc() : super(ProductInitial()) {
    on<ProductItemsInitEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProductLoadingState());

      var response = await _productDetailRepository.getGallery();
      var productVariant = await _productDetailRepository.getProductVariants();

      emit(ProductRequestSuccessState(response, productVariant));
    });
  }
}
