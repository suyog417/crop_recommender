import 'package:crop_recomm/utils/themes.dart';
import 'package:flutter/material.dart';

class FilledElevatedButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  final bool enabled;
  const FilledElevatedButton({super.key, required this.label, required this.onTap, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: enabled ? onTap : null,style: FilledButton.styleFrom(
      disabledBackgroundColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: AppTheme().borderRadius(context))
    ), child: Text(label),);
  }
}

class CustomTextField extends StatelessWidget {
  final Widget? suffix;
  final Widget? prefix;
  final Text? label;
  final String? hintText;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final int? maxlength;
  const CustomTextField({super.key, this.suffix, this.prefix, this.label, this.controller, this.hintText, this.inputType, this.maxlength});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      autofocus: false,
      keyboardType: inputType,
      maxLength: maxlength,
      decoration: InputDecoration(
        label: label,
          prefix: prefix,
          border: OutlineInputBorder(borderRadius: AppTheme().borderRadius(context)),
          contentPadding: AppTheme().contentPadding(context),
          suffixIcon: suffix,
        hintText: hintText,
      ),
    );
  }
}
