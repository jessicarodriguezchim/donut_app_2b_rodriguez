import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutStore;
  final String donutPrice;
  //dynamic sera un tipo de color
  final dynamic donutColor;
  final String imageName;
  final VoidCallback onTap;

  const DonutTile({
    super.key,
    required this.donutFlavor,
    required this.donutStore,
    required this.donutPrice,
    required this.donutColor,
    required this.imageName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: donutColor[100], borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            //priceTag
            Row(
              //alinea a la derecha
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: donutColor[200],
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text('\$$donutPrice',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: donutColor[800])),
                ),
              ],
            ),
            //Donut Picture
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Image.asset(imageName),
            ),

            //Donut Text
            Text(
              donutFlavor,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            Text(
              donutStore,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.pink[400],
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text("add",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        )),
                  )
                ],
              ),
            ),

            //para tener un espacio entre texto
            SizedBox(
              height: 4,
            )

            //Love Icon + add button
          ],
        ),
      ),
    );
  }
}
