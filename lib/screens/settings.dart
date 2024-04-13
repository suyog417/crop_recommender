import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: Text("Switch theme"),
            trailing: Switch(value: true, onChanged: (bool value) {
              value = !value;
            },),
          ),
        ]
      )
    );
  }
}
