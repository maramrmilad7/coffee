import 'package:demoo/models/drinkmodel.dart';
import 'package:flutter/material.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({super.key});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final PageController _controller = PageController(viewportFraction: 0.50);
  double drinkSize = 1.1;
  double _currentPage = 0;
  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 0;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final drinks = DrinkModel.drinks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: drinks.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final scale = drinkSize - (_currentPage - index).abs() * 1;
              final translateY = (_currentPage - index).abs() * 400;
              return Transform.translate(
                offset: Offset(translateY, 0),

                child: Transform.scale(
                  scale: scale.clamp(0.5, 1.0),
                  child: Column(
                    children: [
                      Image.asset(
                        drinks[index].image,
                        height: 900,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        bottom: 200,
                        right: 0,
                        left: 0,

                        child: Image.asset("assets/drinks/Ellipse 2.png"),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
