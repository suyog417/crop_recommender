import 'package:auto_size_text/auto_size_text.dart';
import 'package:crop_recomm/screens/on_boading/intro.dart';
import 'package:crop_recomm/screens/on_boading/sign_In_bloc.dart';
import 'package:crop_recomm/utils/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:line_icons/line_icons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final box = Hive.box("UserData");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          forceMaterialTransparency: true,
        ),
        body: Column(
          children: [
            const AccountHeader(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.01),
                child: Column(
                  children: [
                    AutoSizeText(box.get("Name", defaultValue: ""),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                        maxLines: 1),
                    AutoSizeText("${FirebaseAuth.instance.currentUser!.phoneNumber}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                        maxLines: 1),
                    const AutoSizeText("Pune,Maharashtra",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                        maxLines: 1),
                    const Divider(),
                    const ListTile(
                      title: Text("Profile details"),
                      trailing: Icon(LineIcons.arrowRight),
                      leading: Icon(Icons.person),
                    ),
                    const ListTile(
                      title: Text("Settings"),
                      trailing: Icon(LineIcons.arrowRight),
                      leading: Icon(Icons.settings),
                    ),
                    BlocConsumer<SignInCubit, SignInState>(
                      listener: (context, state) {
                        if(state is AuthLoggedOutState){
                          Navigator.popUntil(context, (route) => route.isFirst);
                          Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const Introduction(),));
                        }
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return ListTile(
                          title: const Text("Log Out"),
                          leading: const Icon(Icons.logout_rounded),
                          onTap: () {
                            BlocProvider.of<SignInCubit>(context).logOut();
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
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
          height: MediaQuery.sizeOf(context).height * 0.25,
          // color: Colors.black,
          child: FractionallySizedBox(
            heightFactor: 0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                color: Colors.grey.shade900,
              ),
              foregroundDecoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.white,blurRadius: 5,offset: Offset(1, 1))
                ],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
              ),
            ),
          ),
        ),
        CircleAvatar(
          radius: MediaQuery.sizeOf(context).width * 0.17,
        )
      ],
    );
  }
}
