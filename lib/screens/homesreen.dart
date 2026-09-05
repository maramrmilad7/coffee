import 'package:demoo/models/drinkmodel.dart';
import 'package:demoo/widgets/drink.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Menu",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Image.asset("assets/cart.png", width: 25),
                ],
              ),
            ),

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
      ),
    );
  }
}
