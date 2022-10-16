
import 'package:flutter/material.dart';

class PageTitleWidget extends StatelessWidget {

  final String title;
  String? subtitle;

  PageTitleWidget({
    super.key,
    this.subtitle,
    required this.title
  });

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 10),
            Text(subtitle ?? '', style: TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}