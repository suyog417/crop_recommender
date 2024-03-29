import 'package:crop_recomm/utils/themes.dart';
import 'package:crop_recomm/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AIChat extends StatefulWidget {
  const AIChat({super.key});

  @override
  State<AIChat> createState() => _AIChatState();
}

class _AIChatState extends State<AIChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // elevation: 1,
          leading: const FittedBox(fit: BoxFit.scaleDown,child: CircleAvatar(backgroundColor: Colors.black,)),
          title: const Text("Assistant"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.05,right: MediaQuery.sizeOf(context).width *0.03,left:MediaQuery.sizeOf(context).width *0.03 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(children: [
                  const Expanded(child: CustomTextField(controller: null,hintText: "Type your message here...",)),
                  const VerticalDivider(color: Colors.transparent,width: 5),
                  IconButton.filled(onPressed: () {  }, icon: const Icon(LineIcons.arrowRight),style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: AppTheme().borderRadius(context)),
                    padding: AppTheme().contentPadding(context)
                  ),)
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
