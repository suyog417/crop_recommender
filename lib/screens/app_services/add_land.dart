import 'package:auto_size_text/auto_size_text.dart';
import 'package:crop_recomm/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AddLand extends StatefulWidget {
  const AddLand({super.key});

  @override
  State<AddLand> createState() => _AddLandState();
}

class _AddLandState extends State<AddLand> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.02,vertical: MediaQuery.sizeOf(context).height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AutoSizeText("Add Land Info",style: TextStyle(fontSize: 32),),
              const CustomTextField(
                prefix: Icon(LineIcons.seedling,color: Colors.black,),
                hintText: "Crop Name",
      
              ),
              const Divider(color:Colors.transparent),
              const CustomTextField(
                prefix: Icon(LineIcons.calendar,color: Colors.black,),
              ),
              const Divider(color:Colors.transparent),
              const CustomTextField(
                prefix: Icon(LineIcons.seedling,color: Colors.black,),
              ),
              const Divider(color:Colors.transparent),
              const CustomTextField(
                prefix: Icon(LineIcons.seedling,color: Colors.black,),
              ),
              const Divider(color:Colors.transparent),
              FilledElevatedButton(label: "Add Land", onTap: (){}, enabled: true),
              const Divider(color: Colors.transparent,)
            ],
          ),
        ),
      ),
    );
  }
}
