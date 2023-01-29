
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyListButton extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color gradientPrimaryColor;
  final Color gradientSecondaryColor;
  final Function onPressed;

  const EmergencyListButton({
    Key? key,
    this.icon = FontAwesomeIcons.carBurst,
    required this.text,
    this.gradientPrimaryColor = const Color(0xff6989F5),
    this.gradientSecondaryColor = const Color(0xff906EF5),
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => onPressed(),
      child: Stack(
        children: <Widget>[
          _EmergencyListButtonBackground(
            icon: icon,
            gradientPrimaryColor: gradientPrimaryColor,
            gradientSecondaryColor: gradientSecondaryColor,
          ),

          Row(
            children: <Widget>[
              const SizedBox( height: 140, width: 40 ),

              FaIcon( icon, size: 40, color: Colors.white ),

              const SizedBox( width: 20 ),

              Expanded(child: Text( text, style: const TextStyle( color: Colors.white, fontSize: 18 ) )),

              const FaIcon( FontAwesomeIcons.chevronRight, color: Colors.white ),

              const SizedBox( width: 40 ),
            ],
          )
        ]
      ),
    );
  }
}

class _EmergencyListButtonBackground extends StatelessWidget {

  final IconData icon;
  final Color gradientPrimaryColor;
  final Color gradientSecondaryColor;

  const _EmergencyListButtonBackground({
    Key? key,
    required this.icon,
    required this.gradientPrimaryColor,
    required this.gradientSecondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all( 20 ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 6),
            blurRadius: 10
          )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            gradientPrimaryColor,
            gradientSecondaryColor,
          ]
        )
      ),
      child: _EmergencyListButtonBackgroundBody( icon: icon ),
    );
  }
}

class _EmergencyListButtonBackgroundBody extends StatelessWidget {

  final IconData icon;

  const _EmergencyListButtonBackgroundBody({
    Key? key, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -20,
            right: -20,
            child: FaIcon( icon, size: 150, color: Colors.white.withOpacity(0.2) ),
          )
        ],
      ),
    );
  }
}