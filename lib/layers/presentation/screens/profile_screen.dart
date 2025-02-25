import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        CupertinoNavigationBar(
          leading: IconButton(
              onPressed: () => {}, icon: const Icon(Icons.segment_rounded)),
          middle: const Text('Profile'),
          backgroundColor: const Color.fromARGB(1, 247, 247, 249),
        ),
        Container(
          height: 626,
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CircleAvatar(
                    radius: 48,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'data',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 38),
                  Container(
                    height: 67,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 19),
                  const Text('Name'),
                  const SizedBox(height: 19),
                  SizedBox(
                    height: 48.0,
                    child: TextField(
                      decoration: InputDecoration(
                          label: const Text('Search'),
                          focusColor: Colors.teal[700],
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14))),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide: BorderSide(color: Colors.green, width: 0),
                          )),
                    ),
                  ),
                  const SizedBox(height: 19),
                  const Text('Name'),
                  const SizedBox(height: 19),
                  SizedBox(
                    height: 48.0,
                    child: TextField(
                      decoration: InputDecoration(
                          label: const Text('Search'),
                          focusColor: Colors.teal[700],
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14))),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide: BorderSide(color: Colors.green, width: 0),
                          )),
                    ),
                  ),
                  const SizedBox(height: 19),
                  const Text('Name'),
                  const SizedBox(height: 19),
                  SizedBox(
                    height: 48.0,
                    child: TextField(
                      decoration: InputDecoration(
                          label: const Text('Search'),
                          focusColor: Colors.teal[700],
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14))),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide: BorderSide(color: Colors.green, width: 0),
                          )),
                    ),
                  ),
                  const SizedBox(height: 19),
                  const Text('Name'),
                  const SizedBox(height: 19),
                  SizedBox(
                    height: 48.0,
                    child: TextField(
                      decoration: InputDecoration(
                          label: const Text('Search'),
                          focusColor: Colors.teal[700],
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14))),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide: BorderSide(color: Colors.green, width: 0),
                          )),
                    ),
                  ),
                  const SizedBox(height: 19),
                  const Text('Name'),
                  const SizedBox(height: 19),
                  SizedBox(
                    height: 48.0,
                    child: TextField(
                      decoration: InputDecoration(
                          label: const Text('Search'),
                          focusColor: Colors.teal[700],
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14))),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            borderSide: BorderSide(color: Colors.green, width: 0),
                          )),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
