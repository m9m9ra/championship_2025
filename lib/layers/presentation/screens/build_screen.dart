import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuildScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  BuildScreen({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  State<BuildScreen> createState() => _BuildScreenState();
}

class _BuildScreenState extends State<BuildScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
          child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: widget.child,
      )),
    );
  }
}
