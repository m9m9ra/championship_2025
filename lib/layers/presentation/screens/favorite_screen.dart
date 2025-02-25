import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/presentation/shared/ui/product_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<int> _build = [0, 1, 2, 2, 2, 2, 4];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        CupertinoNavigationBar(
          leading: IconButton.filled(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white)),
              onPressed: () => context.go('/'),
              icon: const Icon(
                CupertinoIcons.chevron_back,
                color: Colors.black,
              )),
          middle: const Text('Favorite'),
          trailing: IconButton.filled(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white)),
              onPressed: () => context.go('/'),
              icon: const Icon(
                CupertinoIcons.heart,
                color: Colors.black,
              )),
        ),
        SizedBox(
          height: 626,
          child: SingleChildScrollView(
              child: GridView.count(
              shrinkWrap: true,
              primary: false,
              crossAxisSpacing: 0,
              padding: const EdgeInsets.only(top: 10, left: 20),
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              children: _build.map((toElement) => const ProductCard()).toList(),
          )),
        )
      ],
    ));
  }
}
