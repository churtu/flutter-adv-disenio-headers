import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyBtn extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color gradientColorStart;
  final Color gradientColorEnd;
  final Function() onPressed;
  const EmergencyBtn({
    super.key, 
    this.icon = FontAwesomeIcons.circleQuestion, 
    required this.text, 
    required this.onPressed,
    this.gradientColorStart = Colors.grey, 
    this.gradientColorEnd = Colors.blueGrey, 
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _Background(
            gradientColorStart,
            gradientColorEnd,
            icon
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 40),
              FaIcon(icon, color: Colors.white, size: 40,),
              const SizedBox(width: 20),
              Expanded(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18))),
              const FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 40,)
            ],
          )
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  final Color gradientColorStart;
  final Color gradientColorEnd;
  final IconData icon;

  const _Background(this.gradientColorStart, this.gradientColorEnd, this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            offset: const Offset(4, 6),
            blurRadius: 10
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            gradientColorStart,
            gradientColorEnd
          ]
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon, 
                color: Colors.white.withOpacity(.2),
                size: 150,
              )
            )
          ],
        ),
      ),
    );
  }
}