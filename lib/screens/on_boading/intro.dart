import 'package:auto_size_text/auto_size_text.dart';
import 'package:crop_recomm/screens/on_boading/phone_num_verfication.dart';
import 'package:crop_recomm/utils/themes.dart';
import 'package:crop_recomm/utils/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppTheme().screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset("assets/vectors/on_boarding.png"),
            const AutoSizeText("Welcome, Farmer",maxLines: 1,textAlign: TextAlign.center,style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,)),
            const Center(
              child: AutoSizeText.rich(
                  TextSpan(text: "\"Empowering Farmers, Cultivating Tommorow\"",children: [
                TextSpan(text: "\n-ChatGPT",style: TextStyle(fontStyle: FontStyle.italic))
              ]),textAlign: TextAlign.right,style: TextStyle(fontSize: 16),maxLines: 2,),
            ),
            const Spacer(),
            AutoSizeText.rich(
              TextSpan(
              text: "By Clicking on the button you agree to all our terms and condiions. You can read terms and conditions ",
              children: [
                TextSpan(
                  text: "here",
                  recognizer: TapGestureRecognizer()..onTap = () {
                    print("Docs");
                  },
                  style: const TextStyle(
                    color: Colors.blue
                  )
              )
              ],
                  style: TextStyle(
                    fontSize: 12
                  )
            ),
              maxLines: 2,
            ),
            FilledElevatedButton(label: "Start Your Journey", onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PhoneVerification(),));
            },enabled: true,)
          ],
        ),
      ),
    );
  }
}
