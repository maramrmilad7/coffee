import 'package:demoo/models/drinkmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({super.key});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final PageController _controller = PageController(viewportFraction: 0.50);
  double drinkSize = 1.1;
  double _currentPage = 0;
  int? selectedSize;
  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 0;
      });
    });
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drinks[_currentPage.round()].title,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(drinks[_currentPage.round()].subTitle),
                  ],
                ),
                Text(
                  "${drinks[_currentPage.round()].price}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
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
                      Expanded(
                        child: Image.asset(
                          drinks[index].image,
                          height: 900,
                          fit: BoxFit.contain,
                        ),
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

          Positioned(
            left: 20,
            right: 20,
            bottom: 60,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedSize == index
                              ? Colors.orange
                              : Colors.white,
                          border: Border.all(
                            color: selectedSize == index
                                ? Colors.orange
                                : Colors.black,
                          ),
                        ),
                        child: SvgPicture.asset(
                          "assets/Vector.svg",
                          color: selectedSize == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
