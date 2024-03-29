import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile",style: TextStyle(fontWeight: FontWeight.w500),),
      ),
      body: const Column(
        children: [
          AccountHeader(),
          AutoSizeText("UserName",textAlign: TextAlign.center,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),maxLines: 1),
          AutoSizeText("+911234567890",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),maxLines: 1),
          AutoSizeText("Pune,Maharashtra",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),maxLines: 1),
          Divider(),
          ListTile(title: Text("Profile details"),trailing: Icon(LineIcons.arrowRight),),
          ListTile(title: Text("Settings"),trailing: Icon(LineIcons.arrowRight),),
        ],
      ),
    );
  }
}

class AccountHeader extends StatefulWidget {
  const AccountHeader({super.key});

  @override
  State<AccountHeader> createState() => _AccountHeaderState();
}

class _AccountHeaderState extends State<AccountHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          alignment: Alignment.topCenter,
          // color: Colors.black,
          child: FractionallySizedBox(
            heightFactor: 0.8,
            child: Container(color: Colors.black,),
          ),
          height: MediaQuery.sizeOf(context).height * 0.2,
        ),
        CircleAvatar(radius: MediaQuery.sizeOf(context).width * 0.1,)
      ],
    );
  }
}
