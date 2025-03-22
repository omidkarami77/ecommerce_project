import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_project/data/model/category.dart';
import 'package:ecommerce_project/data/repository/categoryy_repository.dart';
import 'package:ecommerce_project/di/di.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    final ICategoryRepository _repository = locator.get();
    on<CategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CategoryRequestList>((event, emit) async {
      emit(CategoryLoading());
      var response = await _repository.getCategories();
      emit(CategoryResponseState(response));
    });
  }
}
