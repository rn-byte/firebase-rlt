import 'package:flutter/material.dart';

InputDecoration formFieldDecoration(
    {required String hText,
    required String lText,
    required IconData icon,
    IconData? suffixIcon}) {
  return InputDecoration(
      hintText: hText,
      labelText: lText,
      prefixIcon: Icon(icon),
      suffixIcon: Icon(suffixIcon),
      floatingLabelStyle: const TextStyle(color: Colors.black),
      filled: true,
      fillColor: const Color.fromARGB(255, 249, 250, 250),
      contentPadding: const EdgeInsets.all(15),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          )),
      enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          )));
}
