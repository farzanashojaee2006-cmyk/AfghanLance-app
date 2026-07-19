import 'package:flutter/material.dart';

const  kFirstColor = Color(0xFFA8CDC9);
const  kSecondColor = Color(0xFF2FD1C5);
const  kThirdColor = Color(0xFF1D837F);
const  k4Color = Color(0xFF2C6A74);
const kDarkBackgroundColor = Color(0xFF121212);
const kDarkSurfaceColor = Color(0xFF1E1E1E);
const  textDarkColor = TextStyle(color:Color(0xFF1F1F1F),fontWeight: FontWeight.bold);
const  textLightColor =TextStyle( height:1.4,color:Color(0xFF666666),fontSize: 13) ;
const kLightColor=Color(0xFFEAE9E9);

InputDecoration kAuthInputDecoration({
  required String label,
  required IconData icon,
  required bool isDark,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    labelText: label,
    floatingLabelBehavior: FloatingLabelBehavior.never,

    filled: true,
    fillColor: isDark ? Colors.grey.shade900 : kLightColor,

    prefixIcon: Icon(icon, color: kThirdColor),
    suffixIcon: suffixIcon,

    labelStyle: TextStyle(
      color: isDark ? Colors.white54 : Colors.grey.shade600,
      fontSize: 14,
    ),

    errorStyle: TextStyle(fontSize: 12, height: 1.4),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: kThirdColor, width: 1.3),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red),
    ),

    contentPadding: EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 18,
    ),
  );
}