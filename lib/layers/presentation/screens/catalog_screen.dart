import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/presentation/shared/ui/product_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  final List<int> _build = [0, 1, 2, 2, 2, 2, 4];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Категории'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 2, bottom: 2),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 108,
                          height: 40,
                          child: FloatingActionButton.extended(
                              elevation: 1,
                              heroTag: '1',
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () => {},
                              label: Text(
                                'All',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 108,
                          height: 40,
                          child: FloatingActionButton.extended(
                              elevation: 1,
                              heroTag: '2',
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () => {},
                              label: Text(
                                'Outdoor',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 108,
                          height: 40,
                          child: FloatingActionButton.extended(
                              elevation: 1,
                              heroTag: '3',
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () => {},
                              label: Text(
                                'Tennis',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 20),
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