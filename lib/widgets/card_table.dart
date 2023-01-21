
import 'dart:ui';

import 'package:flutter/material.dart';

class CardTableWidget extends StatelessWidget {
  const CardTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            SingleCard(text: 'General', icon: Icons.dashboard, color: Colors.blue),
            SingleCard(text: 'Transport', icon: Icons.directions_bus_filled_rounded, color: Colors.deepPurpleAccent)
          ]
        ),

        TableRow(
          children: [
            SingleCard(text: 'Shopping', icon: Icons.shopping_bag, color: Colors.purpleAccent),
            SingleCard(text: 'Bills', icon: Icons.request_quote_outlined, color: Colors.orange)
          ]
        ),

        TableRow(
          children: [
            SingleCard(text: 'Entertaiment', icon: Icons.movie, color: Colors.blueAccent),
            SingleCard(text: 'Grocery', icon: Icons.storefront, color: Colors.green)
          ]
        ),

        TableRow(
          children: [
            SingleCard(text: 'General', icon: Icons.dashboard, color: Colors.blue),
            SingleCard(text: 'Transport', icon: Icons.directions_bus_filled_rounded, color: Colors.deepPurpleAccent)
          ]
        ),

        TableRow(
          children: [
            SingleCard(text: 'Shopping', icon: Icons.shopping_bag, color: Colors.purpleAccent),
            SingleCard(text: 'Bills', icon: Icons.request_quote_outlined, color: Colors.orange)
          ]
        ),

        TableRow(
          children: [
            SingleCard(text: 'Entertaiment', icon: Icons.movie, color: Colors.blueAccent),
            SingleCard(text: 'Grocery', icon: Icons.storefront, color: Colors.green)
          ]
        ),
      ],
    );
  }
}

class SingleCard extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String text;

  const SingleCard({
    super.key,
    required this.icon,
    required this.color,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    var column = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Icon( icon, size: 35, color: Colors.white, ),
        ),
        const SizedBox(height: 10),
        Text(text, style: TextStyle(color: color, fontSize: 18))
      ],
    );

    return CardBackground(child: column);
  }
}

class CardBackground extends StatelessWidget {

  final Widget child;

  const CardBackground({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(62, 67, 107, 0.7)),
      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(vertical: 40, horizontal: 10)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // side: BorderSide(color: Colors.red)
        )
      )
    );

    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur( sigmaX: 5, sigmaY: 5 ),
          child: TextButton(
            style: buttonStyle,
            onPressed: () => {},
            // height: 180,
            // decoration: BoxDecoration(
            //   color: Color.fromRGBO(62, 67, 107, 0.7),
            //   borderRadius: BorderRadius.circular(20)
            // ),
            child: child,
          ),
        ),
      ),
    );
  }
}