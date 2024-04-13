import 'package:auto_size_text/auto_size_text.dart';
import 'package:crop_recomm/screens/on_boading/otp_verify.dart';
import 'package:crop_recomm/screens/on_boading/sign_In_bloc.dart';
import 'package:crop_recomm/utils/themes.dart';
import 'package:crop_recomm/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  String countryCode = "+91";

  @override
  void dispose() {
    focusNode.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: ,
      ),
      body: Padding(
        padding: AppTheme().screenPadding(context),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AutoSizeText("Enter Your Phone Number", style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                // fontStyle: FontStyle.normal
              ),),
              const Divider(color: Colors.transparent,),
              IntlPhoneField(
                controller: phone,
                initialCountryCode: 'IN',
                onCountryChanged: (country) {
                  setState(() {
                    countryCode = country.code;
                  });
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: AppTheme().borderRadius(context)
                    ),
                    contentPadding: AppTheme().contentPadding(context)
                ),
              ),
              // Divider(color: Colors.transparent,),
              const Spacer(),
              BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if(state is AuthCodeSentState){
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => const OTPVerify(),));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return FilledElevatedButton(
                    enabled: true,
                    label: "Verify", onTap: () {
                      BlocProvider.of<SignInCubit>(context).sendOTP(countryCode + phone.text.trim());
                  },);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
