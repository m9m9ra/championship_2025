import 'package:flutter/cupertino.dart';
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
  int currentTab = 0;

  @override
  void initState() {
    currentTab = widget.child.currentIndex;
    super.initState();
  }

  void _goBranch(int index) {
    currentTab = index;
    widget.child.goBranch(
      index,
      initialLocation: index == widget.child.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.child.shellRouteContext.routerState.fullPath);
    return Scaffold(
      appBar: null,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: widget.child,
      ),
      backgroundColor: Color.fromRGBO(247, 247, 249, 1),
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/catalog'),
        child: Icon(CupertinoIcons.bag),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      bottomNavigationBar: SizedBox(
        height: 92.0,
        child: BottomAppBar(
          elevation: 2,
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Icon(CupertinoIcons.home,
                      color: currentTab == 0
                          ? Color.fromRGBO(72, 178, 231, 1)
                          : Colors.black),
                  onPressed: () => _goBranch(0)),
              IconButton(
                  icon: Icon(CupertinoIcons.heart,color: currentTab == 1
                          ? Color.fromRGBO(72, 178, 231, 1)
                          : Colors.black),
                  onPressed: () => _goBranch(1)),
              SizedBox(width: 40),
              IconButton(
                  icon: Icon(Icons.notifications_none_rounded,color: currentTab == 2
                          ? Color.fromRGBO(72, 178, 231, 1)
                          : Colors.black),
                  onPressed: () => _goBranch(2)),
              IconButton(
                  icon: Icon(CupertinoIcons.person_fill,color: currentTab == 3
                          ? Color.fromRGBO(72, 178, 231, 1)
                          : Colors.black), onPressed: () => _goBranch(3)),
            ],
          ),
        ),
      ),
    );
  }
}
