import 'package:demoo/models/drinkmodel.dart';
import 'package:demoo/screens/drinkkdetails.dart';
import 'package:demoo/widgets/drink.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
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
                controller: controller,
                itemCount: DrinkModel.drinks.length,
                itemBuilder: (context, index) {
                  final drink = DrinkModel.drinks[index];
                  return AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      double offset = 0;
                      if (controller.hasClients) {
                        offset = controller.offset / 100 - index;
                      }
                      offset = offset.clamp(0, 1);
                      return Transform.scale(
                        scale: 1 - (offset * 0.2),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (c) => DrinkDetails()),
                          ),
                          child: DrinkItem(
                            drinkImage: drink.image,
                            title: drink.title,
                            subTitle: drink.subTitle,
                          ),
                        ),
                      );
                    },
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
