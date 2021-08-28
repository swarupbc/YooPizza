import 'package:flutter/material.dart';
import 'package:yoo_pizza/models/ingredients_model.dart';
import 'package:yoo_pizza/views/widgets/pizza_ingredients/pizza_ingredients_item.dart';

class PizzaIngredients extends StatelessWidget {
  const PizzaIngredients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: ingredients.length,
      itemBuilder: (context, index) {
        final _ingredient = ingredients[index];
        return PizzaIngredientsItem(
          ingredient: _ingredient,
        );
      },
    );
  }
}
