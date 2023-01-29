
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

import 'package:designs/widgets/widgets.dart';

class _ItemBoton {

  final IconData icon;
  final String text;
  final Color gradientPrimaryColor;
  final Color gradientSecondaryColor;

  _ItemBoton( this.icon, this.text, this.gradientPrimaryColor, this.gradientSecondaryColor );
}

class EmergencyScreen extends StatelessWidget {

  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final items = <_ItemBoton>[
      _ItemBoton( FontAwesomeIcons.carBurst,     'Motor Accident',     const Color(0xff6989F5), const Color(0xff906EF5) ),
      _ItemBoton( FontAwesomeIcons.plus,         'Medical Emergency',  const Color(0xff66A9F2), const Color(0xff536CF6) ),
      _ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement',const Color(0xffF2D572), const Color(0xffE06AA3) ),
      _ItemBoton( FontAwesomeIcons.personBiking, 'Awards',             const Color(0xff317183), const Color(0xff46997D) ),
      _ItemBoton( FontAwesomeIcons.carBurst,     'Motor Accident',     const Color(0xff6989F5), const Color(0xff906EF5) ),
      _ItemBoton( FontAwesomeIcons.plus,         'Medical Emergency',  const Color(0xff66A9F2), const Color(0xff536CF6) ),
      _ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement',const Color(0xffF2D572), const Color(0xffE06AA3) ),
      _ItemBoton( FontAwesomeIcons.personBiking, 'Awards',             const Color(0xff317183), const Color(0xff46997D) ),
      _ItemBoton( FontAwesomeIcons.carBurst,     'Motor Accident',     const Color(0xff6989F5), const Color(0xff906EF5) ),
      _ItemBoton( FontAwesomeIcons.plus,         'Medical Emergency',  const Color(0xff66A9F2), const Color(0xff536CF6) ),
      _ItemBoton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement',const Color(0xffF2D572), const Color(0xffE06AA3) ),
      _ItemBoton( FontAwesomeIcons.personBiking, 'Awards',             const Color(0xff317183), const Color(0xff46997D) ),
    ];

    List<Widget> itemMaps = items.map((item) => FadeInLeft(
      duration: const Duration( milliseconds: 250 ),
      child: EmergencyListButton(
        onPressed: () {},
        text: item.text,
        icon: item.icon,
        gradientPrimaryColor: item.gradientPrimaryColor,
        gradientSecondaryColor: item.gradientSecondaryColor,
      ),
    )).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only( top: 200 ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox( height: 60 ),

                ...itemMaps,

                EmergencyListButton(
                  icon: FontAwesomeIcons.accessibleIcon,
                  text: 'Lorem Ipsum',
                  gradientPrimaryColor: Colors.blue,
                  gradientSecondaryColor: Colors.purple,
                  onPressed: () { },
                ),
              ]
            ),
          ),

          const _MainHeader(),
        ],
      ),
    );
  }
}

class _MainHeader extends StatelessWidget {
  const _MainHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          subtitle: 'Has solicitado',
          title: 'Asistencia médica',
        ),

        Positioned(
          top: 40,
          right: -10,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15),
            child: const FaIcon( FontAwesomeIcons.ellipsisVertical, color: Colors.white )
          )
        )
      ],
    );
  }
}