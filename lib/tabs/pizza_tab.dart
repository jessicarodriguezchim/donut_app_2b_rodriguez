import 'package:donut_app_2b_rodriguez/utils/donut_tile.dart';
import 'package:flutter/material.dart';

// Definición de la clase BurguerTab como StatelessWidget
class PizzaTab extends StatelessWidget {
  final Function(double) addToCart;

  PizzaTab({super.key, required this.addToCart});

  //lista de donas
  final List donutsOnsale = [
    //[donutFlavor, donutPrice, donutColor, imageName]
    ["cheese piza", "cotsco", "236", Colors.blue, "lib/images/queso.png"],
    ["pepperoni piza", "Don nico", "145", Colors.red, "lib/images/pizza3.png"],
    ["hawaiian", "Dominos", "200", Colors.purple, "lib/images/pizza2.png"],
    ["pepperoni", "Soriana", "145", Colors.brown, "lib/images/pizza4.png"],
    ["pepperoni piza", "Don nico", "145", Colors.red, "lib/images/pizza3.png"],
    ["hawaiian", "Dominos", "200", Colors.purple, "lib/images/pizza2.png"],
    ["pepperoni", "Soriana", "145", Colors.brown, "lib/images/pizza4.png"],
    ["cheese piza", "cotsco", "236", Colors.blue, "lib/images/queso.png"],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        //elementos en nuestra lista
        itemCount: donutsOnsale.length,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //Número de columnas
            crossAxisCount: 2,
            //Relacion de aspecto o proporción
            childAspectRatio: 1 / 1.5),
        itemBuilder: (context, index) {
          return DonutTile(
            donutFlavor: donutsOnsale[index][0],
            donutStore: donutsOnsale[index][1],
            donutPrice: donutsOnsale[index][2],
            donutColor: donutsOnsale[index][3],
            imageName: donutsOnsale[index][4],
            onTap: () {
              double price = double.tryParse(donutsOnsale[index][2]) ?? 0;
              addToCart(price);
            },
          );
        });
  }
}
