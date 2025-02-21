import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';
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
    return Padding(
      padding: EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Observer(builder: (context) {
              return Text('${_rootStore.userStore.counter}');
            }),
            Image.asset('assets/image_1.png'),
            Container(
              height: 500,
              color: Colors.amber,
              width: double.maxFinite,
              child: FutureBuilder(
                future: _future,
                
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final instruments = snapshot.data!;
                  print(snapshot);
                  return ListView.builder(
                    itemCount: instruments.length,
                    itemBuilder: ((context, index) {
                      final instrument = instruments[index];
                      return ListTile(
                        title: Text(instrument['name']),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
