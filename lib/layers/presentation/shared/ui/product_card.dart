import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () => {
          print('CARD TAP')
        },
        child: SizedBox(
          width: 160,
          height: 182,
          child: Card.outlined(
            elevation: 1,
            shadowColor: Colors.black38,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 9, right: 9),
                  child: Image.asset('assets/nike_zoom.png'),
                ),
                const SizedBox(height: 12.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Best Seller'.toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 13, 168, 241),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      Text('Nike Air Max'),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('₽752.00'),
                      // IconButton.filled(onPressed: () => {}, icon: Icon(CupertinoIcons.plus))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Positioned(
          top: 9,
          left: 9,
          child: IconButton.filled(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black12),
                iconColor: WidgetStatePropertyAll(Colors.black)
              ),
              onPressed: () => {print('Favorite tap')},
              icon: Icon(CupertinoIcons.heart)))
    ]);
  }
}
