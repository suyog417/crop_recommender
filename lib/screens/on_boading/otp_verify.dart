import 'package:auto_size_text/auto_size_text.dart';
import 'package:crop_recomm/screens/on_boading/intro.dart';
import 'package:crop_recomm/screens/on_boading/personal_info_input.dart';
import 'package:crop_recomm/screens/on_boading/sign_In_bloc.dart';
import 'package:crop_recomm/utils/themes.dart';
import 'package:crop_recomm/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPVerify extends StatefulWidget {
  const OTPVerify({super.key});

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: const Text("Are you sure ?"),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text("No")),
                TextButton(onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const Introduction(),));
                }, child: const Text("Yes"))
              ],
            );
          },);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: AppTheme().screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AutoSizeText(
              "One Time Password",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              maxLines: 2,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            CustomTextField(
              controller: otpController,
              label: const Text("OTP"),
              inputType: TextInputType.number,
              maxlength: 6,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            AutoSizeText.rich(
              TextSpan(
                  text: "Resend OTP",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("send OTP on ");
                    }),
              textAlign: TextAlign.right,
            ),
            const Spacer(),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is AuthLoggedInState){
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => const PersonalInfoInput(),));
                }
                else if (state is AuthErrorState){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error),backgroundColor: Colors.redAccent,));
                }
              },
              builder: (context, state) {

                if(state is AuthLoadingState){
                  return const Center(child: CircularProgressIndicator(),);
                }
                return FilledElevatedButton(
                    label: "Proceed",
                    onTap: () {
                      BlocProvider.of<SignInCubit>(context).verifyOTP(otpController.text);
                    },
                    enabled: true);
              },
            )
          ],
        ),
      ),
    );
  }
}
