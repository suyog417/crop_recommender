import 'package:auto_size_text/auto_size_text.dart';
import 'package:crop_recomm/screens/home.dart';
import 'package:crop_recomm/screens/on_boading/sign_In_bloc.dart';
import 'package:crop_recomm/utils/themes.dart';
import 'package:crop_recomm/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class PersonalInfoInput extends StatefulWidget {
  const PersonalInfoInput({super.key});

  @override
  State<PersonalInfoInput> createState() => _PersonalInfoInputState();
}

class _PersonalInfoInputState extends State<PersonalInfoInput> {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: AppTheme().screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AutoSizeText(
              "Personal Info",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              maxLines: 2,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            CustomTextField(
              controller: name,
              label: const Text("Name"),
              hintText: "Ex. Pablo Escobar",
            ),
            const Spacer(),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {

              },
              builder: (context, state) {
                return FilledElevatedButton(
                    label: "Proceed", onTap: () {
                      if(name.text.isNotEmpty){
                        Hive.box("UserData").put("Name", name.text.trim()).whenComplete(() {
                          Navigator.popUntil(context, (route) => route.isFirst);
                          Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const Home(),));
                        });
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter valid name."),backgroundColor: Colors.redAccent,));
                      }
                }, enabled: true);
              },
            )
          ],
        ),
      ),
    );
  }
}
