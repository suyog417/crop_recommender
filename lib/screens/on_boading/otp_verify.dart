import 'package:auto_size_text/auto_size_text.dart';
import 'package:crop_recomm/screens/home.dart';
import 'package:crop_recomm/screens/on_boading/personal_info_input.dart';
import 'package:crop_recomm/screens/on_boading/signInBloc.dart';
import 'package:crop_recomm/utils/themes.dart';
import 'package:crop_recomm/utils/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class OTPVerify extends StatefulWidget {
  final String phoneNumber;
  const OTPVerify({super.key, required this.phoneNumber});

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {

  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,),
      body: Padding(
        padding: AppTheme().screenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AutoSizeText("One Time Password",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w500),maxLines: 2,),
            const Divider(color: Colors.transparent,),
            CustomTextField(controller: otp,label: const Text("OTP"),inputType: TextInputType.number,maxlength: 6,),
            const Divider(color: Colors.transparent,),
            AutoSizeText.rich(TextSpan(text: "Resend OTP",recognizer: TapGestureRecognizer()..onTap = (){
              print("send OTP on ${widget.phoneNumber}");
            }),textAlign: TextAlign.right,),
            const Spacer(),
            BlocConsumer<SignInCubit,SignInState>(
              builder: (context, state) {
              return FilledElevatedButton(label: "Proceed", onTap: () {
                // print(widget.phoneNumber);
                context.read<SignInCubit>().checkOTP();
                Hive.box("UserData").put("isLoggedIn", true);
                Hive.box("UserData").put("phoneNumber",widget.phoneNumber);
              }, enabled: true);
            }, listener: (context, state) {
              if(state is SuccessState){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PersonalInfoInput(),));
              }
            },)
          ],
        ),
      ),
    );
  }
}
