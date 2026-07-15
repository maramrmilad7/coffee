class DrinkModel {
  final String image;
  final String title;
  final String subTitle;
  final String price;

  DrinkModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
  });
  static List<DrinkModel> drinks = [
    DrinkModel(
      image: "assets/drinks/Banana.png",
      title: "Banana",
      subTitle: "20 flavors of cups",
      price: "50",
    ),
    DrinkModel(
      image: "assets/drinks/Brownie Island.png",
      title: "Brownie Island",
      subTitle: "30 flavors of cups",
      price: "35",
    ),
    DrinkModel(
      image: "assets/drinks/carmel.png",
      title: "carmel",
      subTitle: "230 flavors of cups",
      price: "44",
    ),
    DrinkModel(
      image: "assets/drinks/Chocolate.png",
      title: "Chocolate",
      subTitle: "20 flavors of cups",
      price: "8",
    ),
    DrinkModel(
      image: "assets/drinks/Peanut Butter.png",
      title: "Peanut Butter",
      subTitle: "10 flavors of cups",
      price: "9",
    ),
    DrinkModel(
      image: "assets/drinks/Salted Caramel.png",
      title: "Salted Caramel",
      subTitle: "22 flavors of cups",
      price: "9",
    ),
    DrinkModel(
      image: "assets/drinks/Strawberry.png",
      title: "Strawberry ",
      subTitle: "33 flavors of cups",
      price: "9",
    ),
  ];
}
