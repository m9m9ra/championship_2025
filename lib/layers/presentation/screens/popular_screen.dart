import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/presentation/shared/ui/product_card.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({super.key});

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  final List<int> _build = [0, 1, 2, 2, 2, 2, 4];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        child: Column(
          children: [
            CupertinoNavigationBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () => context.go('/'),
                  icon: const Icon(CupertinoIcons.chevron_back)),
              middle: const Text('Popular'),
              trailing: IconButton(
                  onPressed: () => context.go('/'),
                  icon: const Icon(CupertinoIcons.heart)),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: GridView.count(
                primary: false,
                crossAxisSpacing: 0,
                padding: const EdgeInsets.only(top: 10),
                mainAxisSpacing: 15,
                crossAxisCount: 2,
                children: _build.map((toElement) => const ProductCard()).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
