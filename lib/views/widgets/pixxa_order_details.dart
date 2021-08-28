import 'package:flutter/material.dart';
import 'package:yoo_pizza/views/utils/app_styles.dart';
import 'package:yoo_pizza/views/widgets/pizza_cart_button.dart';
import 'package:yoo_pizza/views/widgets/pizza_details.dart';
import 'package:yoo_pizza/views/widgets/pizza_ingredients/pizza_ingredients.dart';

class PizzaOrderDetails extends StatelessWidget {
  const PizzaOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Spicy Veg Pizza',
          style: AppStyles.kAppBarTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.brown,
              ))
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 50.0,
              left: 10,
              right: 10,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  20.0,
                )),
                elevation: 10.0,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: PizzaDetails(),
                    ),
                    Expanded(
                      flex: 2,
                      child: PizzaIngredients(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: PizzaCartButton(
                onTap: () {
                  print('button tapped');
                },
              ),
              bottom: 25.0,
              height: AppStyles.kPizzaCartSize,
              width: AppStyles.kPizzaCartSize,
              left: MediaQuery.of(context).size.width / 2 -
                  AppStyles.kPizzaCartSize / 2,
            ),
          ],
        ),
      ),
    );
  }
}
