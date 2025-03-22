part of 'banner_bloc.dart';

@immutable
sealed class BannerState {}

final class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerResponseState extends BannerState {
  Either<String, List<BannerItems>> response;

  BannerResponseState(this.response);
}
