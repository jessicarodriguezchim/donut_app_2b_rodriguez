import 'package:donut_app_2b_rodriguez/utils/donut_tile.dart';
import 'package:flutter/material.dart';

// Definición de la clase BurguerTab como StatelessWidget
class BurgerTab extends StatelessWidget {
  final Function(double) addToCart;

  BurgerTab({super.key, required this.addToCart});

  //lista de donas
  final List donutsOnsale = [
    //[donutFlavor, donutPrice, donutColor, imageName]
    [
      "Simple Burger",
      "Angry burger",
      "95",
      Colors.green,
      "lib/images/hamburguesa (1).png"
    ],
    [
      "double Cheeseburger",
      "Burger king",
      "120",
      Colors.pink,
      "lib/images/hamburguesa (2).png"
    ],
    [
      "simple Burger",
      "MC Donalds",
      "80",
      Colors.purple,
      "lib/images/hamburguesa-con-queso.png"
    ],
    [
      "double Beef burger",
      "Don Nico",
      "140",
      Colors.blueGrey,
      "lib/images/hamburguesa.png"
    ],
    [
      "double Cheeseburger",
      "Burger king",
      "120",
      Colors.pink,
      "lib/images/hamburguesa (2).png"
    ],
    [
      "simple Burger",
      "MC Donalds",
      "80",
      Colors.purple,
      "lib/images/hamburguesa-con-queso.png"
    ],
    [
      "double Beef burger",
      "Don Nico",
      "140",
      Colors.blueGrey,
      "lib/images/hamburguesa.png"
    ],
    [
      "Simple Burger",
      "Angry burger",
      "95",
      Colors.green,
      "lib/images/hamburguesa (1).png"
    ],
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
