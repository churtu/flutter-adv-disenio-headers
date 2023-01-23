

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615aab),
      child: const Center(child: Text('hoal')),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)),
          color: Color(0xff615aab),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final pincel = Paint();
    pincel.color = const Color(0xff615aab);
    pincel.style = PaintingStyle.fill;
    pincel.strokeWidth = 2;

    final path = Path();
    path.moveTo(0, size.height*.35);
    path.lineTo(size.width, size.height*.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height*.35);
    canvas.drawPath(path, pincel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}



class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final pincel = Paint();
    pincel.color = const Color(0xff615aab);
    pincel.style = PaintingStyle.fill;
    pincel.strokeWidth = 2;

    final path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    canvas.drawPath(path, pincel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final pincel = Paint();
    pincel.color = const Color(0xff615aab);
    pincel.style = PaintingStyle.fill;
    pincel.strokeWidth = 2;

    final path = Path();
    path.lineTo(0, size.height*.3);
    path.lineTo(size.width*.5, size.height*.35);
    path.lineTo(size.width, size.height*.3);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, pincel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final pincel = Paint();
    pincel.color = const Color(0xff615aab);
    pincel.style = PaintingStyle.fill;
    pincel.strokeWidth = 2;

    final path = Path();
    path.lineTo(0, size.height*.25);
    path.quadraticBezierTo(size.width*.5, size.height*.5, size.width, size.height*.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, pincel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderWaves extends StatelessWidget {
  const HeaderWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final pincel = Paint();
    pincel.color = const Color(0xff615aab);
    pincel.style = PaintingStyle.fill;
    pincel.strokeWidth = 2;

    final path = Path();
    path.moveTo(0, size.height*.25);
    path.quadraticBezierTo(size.width*.25, size.height*.30, size.width*.5, size.height*.25);
    path.quadraticBezierTo(size.width*.75, size.height*.2, size.width, size.height*.25);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, pincel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderGradiente extends StatelessWidget {
  const HeaderGradiente({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderGradientPainter(),
      ),
    );
  }
}

class _HeaderGradientPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    const gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6d04e8),
        Color(0xffc012ff),
        Color(0xff6d05fa)
      ],
      stops: [
        .2, 
        .4,
        1
      ]
    );
    final pincel = Paint();
    pincel.shader = gradiente.createShader(Rect.fromCircle(
      center: const Offset(500, 55), radius: 180));
    pincel.style = PaintingStyle.fill;
    pincel.strokeWidth = 2;

    final path = Path();
    path.lineTo(0, size.height*.25);
    path.quadraticBezierTo(size.width*.25, size.height*.30, size.width*.5, size.height*.25);
    path.quadraticBezierTo(size.width*.75, size.height*.2, size.width, size.height*.25);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, pincel);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// EMERGENCY PAGE

class EmergencyHeader extends StatelessWidget {

    final IconData icon;
    final String title;
    final String subtitle;
    final Color graditenColor1;
    final Color gradientColor2;

  const EmergencyHeader({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.subtitle, 
    this.graditenColor1 = Colors.grey, 
    this.gradientColor2 = Colors.blueGrey
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _HeaderBackground(
          graditenColor1,
          gradientColor2
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon, 
            color: Colors.white.withOpacity(.2), 
            size: 250
          )
        ),
        Column(
          children: [
            const SizedBox(height: 80, width: double.infinity),
            Text(
              title, 
              style: TextStyle(
                color: Colors.white.withOpacity(.7)
              )
            ),
            const SizedBox(height: 20),
            Text(
              subtitle, 
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(.7)
              )
            ),
            const SizedBox(height: 20),
            FaIcon(
            icon, 
            color: Colors.white, 
            size: 80
          )
          ],
        )
      ],
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  final Color gradientColor1;
  final Color gradientColor2;

  const _HeaderBackground(this.gradientColor1, this.gradientColor2);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*.35,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            gradientColor1,
            gradientColor2
          ]
        )
      ),
    );
  }
}
