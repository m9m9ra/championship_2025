import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';
import 'package:matule/layers/presentation/shared/ui/product_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RootStore _rootStore = RootStore();
  final _future = Supabase.instance.client.from('instruments').select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1, 247, 247, 249),
      appBar: CupertinoNavigationBar(
        leading:
            IconButton(onPressed: () => {}, icon: Icon(Icons.segment_rounded)),
        middle: Text('Home'),
        backgroundColor: Color.fromARGB(1, 247, 247, 249),
        trailing: IconButton.filled(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white)),
            onPressed: () => {},
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 21),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                      width: 269,
                      height: 52,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(1, 0))
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                            label: const Text('Search'),
                            prefixIcon: const Icon(Icons.search),
                            focusColor: Colors.teal[700],
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14))),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 0),
                            )),
                      )),
                  SizedBox(width: 14),
                  IconButton.filled(
                      iconSize: 36,
                      onPressed: () => {},
                      icon: Icon(CupertinoIcons.slider_horizontal_3))
                ],
              ),
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
                            heroTag: 'all',
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
                            heroTag: 'outdoor',
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
                            heroTag: 'popular',
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onPressed: () {
                              print('object');
                              context.go('/popular');
                            },
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
            const SizedBox(height: 12),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text('Популярное'),
                        const Spacer(),
                        SizedBox(
                          width: 42,
                          child: TextButton(
                              onPressed: () => context.go('/popular'),
                              child: const Text('All')),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      children: [ProductCard(), Spacer(), ProductCard()],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Text('Action'),
                        const Spacer(),
                        SizedBox(
                          width: 42,
                          child: TextButton(
                              onPressed: () => context.go('/catalog'),
                              child: const Text('All')),
                        )
                      ],
                    ),
                    Image.asset('assets/action.png'),
                    SizedBox(height: 24.0),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
