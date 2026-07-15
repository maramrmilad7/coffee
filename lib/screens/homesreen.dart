import 'package:demoo/models/drinkmodel.dart';
import 'package:demoo/widgets/drink.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          SizedBox(height: 100),

          Expanded(
            child: ListView.builder(
              itemCount: DrinkModel.drinks.length,
              itemBuilder: (context, index) {
                final drink = DrinkModel.drinks[index];
                return DrinkItem(
                  drinkImage: drink.image,
                  title: drink.title,
                  subTitle: drink.subTitle,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
