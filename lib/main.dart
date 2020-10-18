import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/bloc/categories_bloc.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/repositories/category_repository.dart';
import 'package:random_color/random_color.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cocktail App",
      home: BlocProvider(
        create: (context) =>
            CategoriesBloc(categoryRepository: CategoryRepositoryImpl()),
        child: HomePage(),
      ),
    );
  }
}
