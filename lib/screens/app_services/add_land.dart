import 'package:flutter/material.dart';

class AddLand extends StatefulWidget {
  const AddLand({super.key});

  @override
  State<AddLand> createState() => _AddLandState();
}

class _AddLandState extends State<AddLand> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(key: GlobalKey(), child: const Column());
  }
}
