import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final double arcStrokeWidth;
  final double circleStrokeWidth;
  final double porcentaje;
  final Gradient? gradiente;

  const RadialProgress({
    super.key, 
    required this.porcentaje,
    this.arcStrokeWidth = 10,
    this.circleStrokeWidth = 4,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.gradiente
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late double _porcentajeAnterior;

  @override
  void initState() {
    _porcentajeAnterior = widget.porcentaje;
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward(from: 0);
    final double diferenciaAnimar = widget.porcentaje - _porcentajeAnterior;
    _porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.all(15),
            child: CustomPaint(
              painter: _RadialProgress(
                porcentaje: (widget.porcentaje - diferenciaAnimar ) + ( diferenciaAnimar * _animationController.value),
                primaryColor: widget.primaryColor,
                secondaryColor: widget.secondaryColor,
                circleStrokeWidth: widget.circleStrokeWidth,
                arcStrokeWidth: widget.arcStrokeWidth,
                gradiente: widget.gradiente
              ),
            ),
          );
        });
  }
}

class _RadialProgress extends CustomPainter {
  final double porcentaje;
  final Color primaryColor;
  final Color secondaryColor;
  final double circleStrokeWidth;
  final double arcStrokeWidth;
  final Gradient? gradiente;

  _RadialProgress({
    required this.porcentaje, 
    required this.primaryColor, 
    required this.secondaryColor,
    required this.circleStrokeWidth,
    required this.arcStrokeWidth,
    this.gradiente
  });

  @override
  void paint(Canvas canvas, Size size) {
    // circulo

    final paint = Paint()
      ..strokeWidth = circleStrokeWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * .5, size.height * .5);
    final radius = min(size.width * .5, size.hashCode * .5);

    canvas.drawCircle(center, radius, paint);

    // arco

    final paintArco = Paint()
      ..strokeWidth = arcStrokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    
    // Gradiente o color uniforme
    // Si viene el gradient se coloca

    if(gradiente == null){
      paintArco.color = primaryColor;
    }else{
      final rect = Rect.fromCircle(
        center: center, 
        radius: radius
      );
      paintArco.shader = gradiente!.createShader(rect);
    }
    // Parte que se debera ir llenando

    double anguloArco = 2 * pi * (porcentaje / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        anguloArco, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
