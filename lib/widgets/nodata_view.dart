import 'package:flutter/material.dart';

// View to empty data message
Widget noDataView(String msg) {
  return Center(
    child: Text(
      msg,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
