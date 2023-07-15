import 'package:flutter/material.dart';
import '../style/style.dart';

showProgressWidget(context){
  return Container(
    color: colorPrimary,
    child: Center(
      child: CircularProgressIndicator(
        color: colorAccent,
      ),
    ),
  );
}