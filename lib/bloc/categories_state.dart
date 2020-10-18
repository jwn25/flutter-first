import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/Category.dart';

abstract class CategoriesState extends Equatable {}

class CategoriesInitialState extends CategoriesState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoriesLoadingState extends CategoriesState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CategoriesLoadedState extends CategoriesState {
  @override
  List<Category> categories;
  CategoriesLoadedState({@required this.categories});
  List<Object> get props => [categories];
}

class CategoriesErrorState extends CategoriesState {
  String message;

  CategoriesErrorState({@required this.message});
  @override
  List<Object> get props => throw UnimplementedError();
}
