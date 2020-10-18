import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:myapp/bloc/categories_event.dart';
import 'package:myapp/bloc/categories_state.dart';
import 'package:myapp/models/Category.dart';
import 'package:myapp/repositories/category_repository.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoryRepository categoryRepository;

  CategoriesBloc(
      {@required this.categoryRepository, CategoriesState initialState})
      : super(initialState);

  @override
  Stream<CategoriesState> mapEventToState(event) async* {
    if (event is FetchCategoriesEvent) {
      yield CategoriesLoadingState();
      try {
        List<Category> categories = await categoryRepository.getCategories();
        print(categories[1].toJson());
        yield CategoriesLoadedState(categories: categories);
      } catch (e) {
        yield CategoriesErrorState(message: e.toString());
      }
    }
  }
}
