import 'package:flutter/material.dart';

import '../widgets/shop_rules.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ShopRules(
        title: 'Rules',
        children: [
          Text(
            'Pass time trials by giving correct answers in our quiz and earn valuable points and valuable prizes. Take part in the quiz, where you can try your luck and earn additional prizes in our Wheel of Fortune, which becomes available to you after each successful answer. Earn points and dive into other adventure levels',
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
