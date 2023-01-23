import 'package:adv_disenios/src/widgets/widgets.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _ItemButton {
  final IconData icon;
  final String text;
  final Color gradientColorStart;
  final Color gradientColorEnd;

  _ItemButton(this.icon, this.text, this.gradientColorStart, this.gradientColorEnd);
}

class EmergencyPage extends StatelessWidget {

  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <_ItemButton>[
      _ItemButton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      _ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      _ItemButton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      _ItemButton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
      _ItemButton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      _ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      _ItemButton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      _ItemButton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
      _ItemButton( FontAwesomeIcons.carBurst, 'Motor Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
      _ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
      _ItemButton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
      _ItemButton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top:200 ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 80),
                ...items.map((btn) => FadeInLeft(
                  child: EmergencyBtn(
                    text: btn.text, 
                    icon: btn.icon,
                    gradientColorStart: btn.gradientColorStart,
                    gradientColorEnd: btn.gradientColorEnd,
                    onPressed: (){}
                  ),
                )
              ).toList()
              ],
            ),
          ),
          _Header(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const EmergencyHeader(
          title: 'Haz solicidado',
          subtitle: 'Asistencia Médica',
          icon: FontAwesomeIcons.plus,
          graditenColor1: Color(0xff536CF6),
          gradientColor2: Color(0xff66A9F2),
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            padding: const EdgeInsets.all(15),
            onPressed: () {
              
            },
            shape: const CircleBorder(),
            child: const FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.white,))
        )
      ],
    );
  }
}
