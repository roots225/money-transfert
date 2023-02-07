import 'package:flutter/material.dart';

class YemiAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const YemiAppBar({super.key, required this.title});

  @override
  State<YemiAppBar> createState() => _YemiAppBarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _YemiAppBarState extends State<YemiAppBar> {
  String get title => widget.title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
}
