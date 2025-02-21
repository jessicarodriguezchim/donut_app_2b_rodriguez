import 'package:donut_app_2b_rodriguez/utils/donut_tile.dart';
import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
//Lista de donas
  final List donutsOnSale = [
    //[donutFalavor, donutPrice, donutColor, imageName];
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
  ];

  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    //cuantos elementos tengo
    return GridView.builder(
        //elementos en nuestra lista
        itemCount: donutsOnSale.length,
        padding: const EdgeInsets.all(8.0),
        //gridDelegate- encargado de organizador elementos en la cuadricula
        //SliverGrid- permite crear listas y scrolls eficientes con efectos
        //personalizados y optimizados.
        // CrossAxisCount- el eje principal de una columna es vertical
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
            //numero de columnas que estan en un eje
            (crossAxisCount: 2),
        itemBuilder: (context, index) {
          return DonutTile(
            donutFlavor: donutsOnSale[index][0],
            donutPrice: donutsOnSale[index][1],
            donutColor: donutsOnSale[index][2],
            imageName: donutsOnSale[index][3],
          );
        });
  }
}
