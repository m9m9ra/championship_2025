import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:matule/layers/presentation/shared/store/root_store.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final RootStore _rootStore = RootStore();

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(22), child: 
    SingleChildScrollView(
      child: Column(
        children: [
          Observer(
            builder: (context) {
              return Text('${_rootStore.userStore.counter}');
            }
          ),
          Image.asset('assets/image_1.png')
        ],
      ),
    ),);
  }
}