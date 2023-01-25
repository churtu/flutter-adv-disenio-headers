import 'package:adv_disenios/src/widgets/widgets.dart';
import 'package:adv_disenios/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraficasCircularesPage extends StatefulWidget {
   
  const GraficasCircularesPage({Key? key}) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100){
              porcentaje = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomRadialProgress(porcentaje: porcentaje*.5, color: Colors.red),
              _CustomRadialProgress(porcentaje: porcentaje, color: Colors.black),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomRadialProgress(porcentaje: porcentaje*1.5, color: Colors.deepPurple,),
              _CustomRadialProgress(porcentaje: porcentaje*2, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomRadialProgress extends StatelessWidget {
  final Color color;
  const _CustomRadialProgress({
    required this.porcentaje,
    required this.color
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    return SizedBox(
      width: 150,
      height: 150,
      child: RadialProgress(
       porcentaje: porcentaje,
       primaryColor: color,
       secondaryColor: appTheme.currentTheme.textTheme.bodyText1!.color!,
       circleStrokeWidth: 4,
       arcStrokeWidth: 8,
       gradiente: LinearGradient(
        colors: [
          color,
          Colors.deepOrange,
          Colors.blue
        ]
       ),
     ),
    );
  }
}