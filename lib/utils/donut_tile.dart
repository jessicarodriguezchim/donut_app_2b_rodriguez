import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  //dynamic será un tipo de color
  final dynamic donutColor;
  final String imageName;

  const DonutTile(
      {super.key,
      required this.donutFlavor,
      required this.donutPrice,
      this.donutColor,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: donutColor[100], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            Row(
              //Alinea a la derecha
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: donutColor[200],
                      borderRadius:
                          //pada darle borde a los precios.
                          BorderRadius.only(
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                      )),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  //para que se vea el signo de pesos $ se utiliza \$ segudo llamando a un atributo donutprice.
                  child: Text(
                    "\$$donutPrice",
                    //texto en negritas
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        //cambia el color de el texto igual al fondo.
                        color: donutColor[800]),
                  ),
                )
              ],
            ),

            //PriceTag

            //Image

            //Donut Picture
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 34),
              child: Image.asset(imageName),
            )
            //Donut text

            //love icon + add button
          ],
        ),
      ),
    );
  }
}
