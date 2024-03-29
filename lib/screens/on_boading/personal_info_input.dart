import 'package:auto_size_text/auto_size_text.dart';
import 'package:crop_recomm/screens/home.dart';
import 'package:crop_recomm/screens/on_boading/signInBloc.dart';
import 'package:crop_recomm/utils/themes.dart';
import 'package:crop_recomm/utils/widgets.dart';
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
                if(state is SuccessState){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
                }
              },
              builder: (context, state) {
                return FilledElevatedButton(
                    label: "Proceed", onTap: () {
                      Hive.box("UserData").put("Name", name.text.trim());
                      context.read<SignInCubit>().checkName(name.text.trim());
                }, enabled: true);
              },
            )
          ],
        ),
      ),
    );
  }
}
