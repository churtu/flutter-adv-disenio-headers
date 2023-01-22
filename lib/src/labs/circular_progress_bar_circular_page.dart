import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});
   
  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  double porcentaje = 0;
  double porcentajeASumar = 0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800)
    );
    _animationController.addListener(() { 

      porcentaje = lerpDouble(porcentaje, porcentajeASumar, _animationController.value) ?? 0.0;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[200]
          ),
          child: CustomPaint(
            painter: _RadialProgress(porcentaje),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          porcentaje = porcentajeASumar;
          porcentajeASumar += 10;
          if(porcentajeASumar > 100){
            porcentajeASumar = 0;
            porcentaje = 0;
          }
          _animationController.forward( from: 0 );
        }),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {

  final double porcentaje;

  _RadialProgress(this.porcentaje);


  @override
  void paint(Canvas canvas, Size size) {
    
    // circulo

    final paint = Paint()
    ..strokeWidth = 4
    ..color = Colors.grey
    ..style = PaintingStyle.stroke;

    final center = Offset(size.width*.5, size.height*.5);
    final radius = min(size.width*.5, size.hashCode*.5);

    canvas.drawCircle(
      center, 
      radius, 
      paint
    );

    // arco

    final paintArco = Paint()
    ..strokeWidth = 10
    ..color = Colors.blue
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

    // Parte que se debera ir llenando
    
    double anguloArco = 2 * pi * ( porcentaje / 100 );

    canvas.drawArc(
      Rect.fromCircle(
        center: center, 
        radius: radius
      ), 
      -pi / 2, 
      anguloArco, 
      false, 
      paintArco
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}