import 'package:doa_api/views/detail_recipe.dart';
import 'package:doa_api/widgets/appbar.dart';
import 'package:doa_api/widgets/navbar.dart';
import 'package:doa_api/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

import '../controller/controller_recipe.dart';
import '../models/model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipe = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    recipe = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
    // print(recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeaeee5),
        drawer: NavBar(),
        appBar: homeAppBar(context),
        // appBar: AppBar(
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Icon(Icons.restaurant_menu),
        //       SizedBox(width: 10),
        //       Text('Food Recipes'),
        //     ],
        //   ),
        // ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: recipe.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: RecipeCard(
                        title: recipe[index].name,
                        cookTime: recipe[index].totalTime,
                        rating: recipe[index].rating.toString(),
                        thumbnailUrl: recipe[index].images,
                      ),
                      onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => DetailRecipe(
                                        name: recipe[index].name,
                                        totalTime: recipe[index].totalTime,
                                        rating: recipe[index].rating.toString(),
                                        images: recipe[index].images,
                                        description: recipe[index].description,
                                        instructions:
                                            recipe[index].instructions,
                                        sections: recipe[index].sections,
                                      )),
                                ))
                          });
                },
              ));
  }
}
