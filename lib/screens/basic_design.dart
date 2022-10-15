// ignore: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(image: AssetImage('assets/landscape.jpg')),

          const TitleWidget(),

          const ButtonsWidget(),

          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: const Text('Fugiat nostrud tempor labore cillum nostrud id nisi elit ipsum sint consectetur excepteur. Laboris aliquip adipisicing et magna. Reprehenderit elit eu nulla incididunt deserunt cillum. Eu ad in excepteur ullamco velit minim eiusmod labore sit voluptate laboris velit. Aute velit quis adipisicing exercitation exercitation.', textAlign: TextAlign.justify)
          )

        ]
      )
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Lorem ipsum dolor', style: TextStyle( fontWeight: FontWeight.bold)),
              Text('Subtitle of the section')
            ],
          ),

          Expanded(child: Container()),

          Icon( Icons.star, color: Colors.red),
          Text('41')
        ],
      ),
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          CustomButton(text: 'Call', icon: Icons.call),
          CustomButton(text: 'Route', icon: Icons.map_sharp),
          CustomButton(text: 'Share', icon: Icons.share),

        ]
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final String text;
  Color? color;

  CustomButton({
    Key? key,
    this.color,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (color == null) color = Colors.blue;

    return Column(
      children: [
        Icon(icon, color: color),
        Text(text, style: TextStyle(color: color))
      ],
    );
  }
}