import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yoo_pizza/models/ingredients_model.dart';
import 'package:yoo_pizza/views/utils/app_images.dart';
import 'package:yoo_pizza/views/utils/app_styles.dart';

class PizzaDetails extends StatefulWidget {
  const PizzaDetails({Key? key}) : super(key: key);

  @override
  _PizzaDetailsState createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails>
    with SingleTickerProviderStateMixin {
  final _listIngredients = <Ingredients>[];
  int _total = 349;
  final _notifierFocused = ValueNotifier(false);
  AnimationController? _animationController;

  List<Animation> _animationList = <Animation>[];
  BoxConstraints? _pizzaConstraints;

  void _buildIngredientsAnimation() {
    _animationList.clear();
    _animationList.add(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(0.0, 0.8, curve: Curves.decelerate),
      ),
    );
    _animationList.add(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(0.2, 0.8, curve: Curves.decelerate),
      ),
    );
    _animationList.add(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(0.4, 1.0, curve: Curves.decelerate),
      ),
    );
    _animationList.add(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(0.1, 0.7, curve: Curves.decelerate),
      ),
    );
    _animationList.add(
      CurvedAnimation(
        parent: _animationController!,
        curve: Interval(0.3, 1.0, curve: Curves.decelerate),
      ),
    );
  }

  Widget _buildIngredientWidget() {
    List<Widget> elements = [];
    if (_animationList.isNotEmpty) {
      for (int i = 0; i < _listIngredients.length; i++) {
        Ingredients ingredients = _listIngredients[i];

        final _ingredientWidget =
            Image.asset(ingredients.imageUnit, height: 40);

        for (int j = 0; j < ingredients.position.length; j++) {
          final animation = _animationList[j];
          final position = ingredients.position[j];
          final positionX = position.dx;
          final positionY = position.dy;
          if (i == _listIngredients.length - 1) {
            double fromX = 0.0, fromY = 0.0;
            if (j < i) {
              fromX = -_pizzaConstraints!.maxWidth * (1 - animation.value);
            } else if (j < 2) {
              fromX = _pizzaConstraints!.maxWidth * (1 - animation.value);
            } else if (j < 4) {
              fromY = -_pizzaConstraints!.maxHeight * (1 - animation.value);
            } else {
              fromY = _pizzaConstraints!.maxHeight * (1 - animation.value);
            }
            final _opacity = animation.value;
            if (animation.value > 0) {
              elements.add(
                Opacity(
                  opacity: _opacity,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(
                        fromX + _pizzaConstraints!.maxWidth * positionX,
                        fromY + _pizzaConstraints!.maxHeight * positionY,
                      ),
                    child: _ingredientWidget,
                  ),
                ),
              );
            }
          } else {
            elements.add(
              Transform(
                transform: Matrix4.identity()
                  ..translate(
                    _pizzaConstraints!.maxWidth * positionX,
                    _pizzaConstraints!.maxHeight * positionY,
                  ),
                child: _ingredientWidget,
              ),
            );
          }
        }
      }
      return Stack(
        children: elements,
      );
    }
    return SizedBox.fromSize();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: DragTarget<Ingredients>(
                onAccept: (ingredient) {
                  _notifierFocused.value = false;
                  setState(() {
                    _listIngredients.add(ingredient);
                    _total += 25;
                  });
                  _buildIngredientsAnimation();
                  _animationController!.forward(from: 0.0);
                  print('onAccept');
                },
                onWillAccept: (ingredient) {
                  print('onWillAccept');
                  _notifierFocused.value = true;
                  for (Ingredients i in _listIngredients) {
                    if (i.compare(ingredient!)) {
                      return false;
                    }
                  }

                  return true;
                },
                onLeave: (ingredient) {
                  _notifierFocused.value = false;
                  print('onLeave');
                },
                builder: (context, list, rejects) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      _pizzaConstraints = constraints;
                      return Center(
                        child: ValueListenableBuilder<bool>(
                            valueListenable: _notifierFocused,
                            builder: (context, _focused, _) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 400),
                                height: _focused
                                    ? constraints.maxHeight
                                    : constraints.maxHeight - 10,
                                child: Stack(
                                  children: [
                                    Image.asset(AppImages.dish),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset(AppImages.pizza1),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: animation.drive(Tween<Offset>(
                        begin: Offset(0.0, 0.0),
                        end: Offset(0.0, animation.value))),
                    child: child,
                  ),
                );
              },
              child: Text(
                '\₹$_total',
                key: UniqueKey(),
                style: AppStyles.kBrownPriceTextStyle,
              ),
            ),
          ],
        ),
        AnimatedBuilder(
            animation: _animationController!,
            builder: (context, _) {
              return _buildIngredientWidget();
            }),
      ],
    );
  }
}
