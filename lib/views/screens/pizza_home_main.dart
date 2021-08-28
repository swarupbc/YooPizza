import 'package:flutter/material.dart';
import 'package:yoo_pizza/views/widgets/pixxa_order_details.dart';

class PizzaHomeMain extends StatelessWidget {
  const PizzaHomeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: PizzaOrderDetails(),
    );
  }
}
