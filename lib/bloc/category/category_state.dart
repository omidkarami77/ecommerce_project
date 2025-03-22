part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryResponseState extends CategoryState {
  Either<String, List<Items>> response;

  CategoryResponseState(this.response);
}
