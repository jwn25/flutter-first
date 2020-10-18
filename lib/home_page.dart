import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/categories_bloc.dart';
import 'package:myapp/bloc/categories_event.dart';
import 'package:myapp/bloc/categories_state.dart';
import 'package:myapp/models/Category.dart';
import 'package:random_color/random_color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RandomColor _randomColor = RandomColor();
  CategoriesBloc categoriesBloc;

  @override
  void initState() {
    super.initState();
    categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    categoriesBloc.add(FetchCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.orange[100],
        Colors.white,
      ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(children: [
              Image(
                image: NetworkImage(
                    "https://liveasily.com/website/images/logo.png"),
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Liveasily Quotes",
                ),
              )
            ]),
            elevation: 0.5,
          ),
          body: Center(
            child: BlocListener<CategoriesBloc, CategoriesState>(
              listener: (context, state) {
                if (state is CategoriesErrorState) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesInitialState) {
                    return buildLoader();
                  } else if (state is CategoriesLoadingState) {
                    return buildLoader();
                  } else if (state is CategoriesLoadedState) {
                    return buildCategoriesGrid(state.categories);
                  } else if (state is CategoriesErrorState) {
                  } else {
                    return buildLoader();
                  }
                },
              ),
            ),
          )),
    );
  }

  Widget buildLoader() {
    return CircularProgressIndicator(backgroundColor: Colors.black);
  }

  Widget buildCategoriesGrid(List<Category> categories) {
    return GridView.builder(
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.4),
        itemBuilder: (context, index) {
          var category = categories[index];
          return Padding(
            padding: const EdgeInsets.all(7),
            child: Container(
              child: Card(
                elevation: 8,
                // margin: EdgeInsets.all(5),
                color: _randomColor.randomColor(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black26,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(children: [
                      Text(
                        category.name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Positioned(
                        child: Opacity(
                          opacity: 0.9,
                          child: Image(
                            image: NetworkImage((category.image != null)
                                ? category.categoryImage.thumb
                                : 'https://liveasily.com/website/images/logo.png'),
                            height: 80,
                          ),
                        ),
                        bottom: -10,
                        right: 0,
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
