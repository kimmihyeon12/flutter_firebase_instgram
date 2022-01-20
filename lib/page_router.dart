import 'package:flutter/material.dart';

void NavigatorPush(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}
