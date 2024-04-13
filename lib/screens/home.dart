import 'package:auto_size_text/auto_size_text.dart';
import 'package:crop_recomm/screens/app_services/add_land.dart';
import 'package:crop_recomm/screens/app_services/ai_chat.dart';
import 'package:crop_recomm/screens/app_services/services.dart';
import 'package:crop_recomm/screens/profile.dart';
import 'package:crop_recomm/utils/ml_models.dart';
import 'package:crop_recomm/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [const HomeScreen(), const Services(), const AIChat(), const Profile()];
  int selecteScreen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selecteScreen],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft:
                    Radius.circular(MediaQuery.sizeOf(context).width * 0.07),
                topRight:
                    Radius.circular(MediaQuery.sizeOf(context).width * 0.07)),
            // color: Colors.grey.shade200,
            border: const Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).width * 0.03,
            horizontal: MediaQuery.sizeOf(context).height * 0.03),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          tabActiveBorder: Border.all(color: Colors.grey),
          gap: 0,
          curve: Curves.easeInExpo,
          padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.02),
          selectedIndex: 0,
          style: GnavStyle.google,
          onTabChange: (value) {
            setState(() {
              selecteScreen = value;
            });
          },
          tabs: const [
            GButton(icon: LineIcons.home, text: "Home"),
            GButton(icon: LineIcons.servicestack, text: "Services"),
            GButton(icon: LineIcons.rocketChat, text: "Chat"),
            GButton(icon: LineIcons.user, text: "Profile"),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.05,
          right: MediaQuery.sizeOf(context).width * 0.03,
          left: MediaQuery.sizeOf(context).width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AutoSizeText.rich(
            TextSpan(text: "Hello,", children: [
              TextSpan(
                  text: "\n${Hive.box("UserData").get("Name",defaultValue: "")}",
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500))
            ]),
            style: const TextStyle(fontSize: 22),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Nothing to show here.\n click on \"ADD LAND\" to add new land.",
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(),
          FilledElevatedButton(label: "Add Land", onTap: () {
            showModalBottomSheet<dynamic>(
              context: context,
              builder: (context) => const AddLand(),
              backgroundColor: Theme.of(context).colorScheme.surface,
              isScrollControlled: true,
            );
          }, enabled: true),
          const AutoSizeText(
            "Services",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          // GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2),
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   padding: EdgeInsets.zero,
          //   itemCount: 4,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       margin: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.02),
          //       decoration: BoxDecoration(color: Colors.blue,borderRadius: AppTheme().borderRadius(context)),
          //       padding: AppTheme().contentPadding(context),
          //       child: const ServiceTile(label: "24/7 Call Support",description: "Our call centers are availbel 24/7 for any of your queries"),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String label;
  final String description;
  const ServiceTile({super.key, required this.label, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AutoSizeText(label,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        AutoSizeText(description,maxLines: 2,overflow: TextOverflow.ellipsis,),
        // Spacer(),
        Row(mainAxisAlignment: MainAxisAlignment.end,children: [
          IconButton(onPressed: () {} , icon: const Icon(LineIcons.arrowRight))
        ],)
      ],
    );
  }
}

