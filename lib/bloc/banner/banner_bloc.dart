import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/data/model/banner.dart';
import 'package:ecommerce_project/data/repository/banner_repository.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final IBannerRepository _repository = locator.get();
  BannerBloc() : super(BannerInitial()) {
    on<BannerEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<BannerRequestEvent>((event, emit) async {
      // TODO: implement event handler
      emit(BannerLoading());

      var response = await _repository.getBanners();
      emit(BannerResponseState(response));
    });
  }
}
