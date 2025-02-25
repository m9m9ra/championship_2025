import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifivationScreen extends StatefulWidget {
  const NotifivationScreen({super.key});

  @override
  State<NotifivationScreen> createState() => _NotifivationScreenState();
}

class _NotifivationScreenState extends State<NotifivationScreen> {
  final List<int> _build = [0, 1, 2, 2, 2, 2, 4];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () => {}, icon: const Icon(Icons.segment_rounded)),
          middle: const Text('Notification'),
          backgroundColor: const Color.fromARGB(1, 247, 247, 249),
        ),
        Container(
          width: double.maxFinite,
          height: 626,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
              child: Column(
                children: _build.map((toElement) {
                  return const SizedBox(
                      width: double.maxFinite,
                      height: 128.0,
                      child: Card(
                        color: Color.fromRGBO(247, 247, 249, 1),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Заголовок',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. Venenatis pulvinar lobortis risus consectetur morbi egestas id in bibendum. Volutpat nulla urna sit sed diam nulla.',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                '27.01.2024, 15:42',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                      ));
                }).toList(),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
