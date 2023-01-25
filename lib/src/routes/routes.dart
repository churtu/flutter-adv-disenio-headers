

import 'package:adv_disenios/src/pages/pages.dart';
import 'package:adv_disenios/src/reto/cuadrado_animado_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppRoute{
  final IconData icon;
  final String titulo;
  final Widget page;

  AppRoute({
    required this.icon, 
    required this.titulo, 
    required this.page
  });
}

class AppRouter {
  static const String initialRoute = 'launcher';

  static final List<AppRoute> appRoutes = [
    AppRoute(icon: FontAwesomeIcons.slideshare, titulo: 'Slideshow', page: const SlideShowPage()),
    AppRoute(icon: FontAwesomeIcons.truckMedical, titulo: 'Emergencia', page: const EmergencyPage()),
    AppRoute(icon: FontAwesomeIcons.heading, titulo: 'Encabezados', page: const HeadersPage()),
    AppRoute(icon: FontAwesomeIcons.peopleCarryBox, titulo: 'Cuadro animado', page: const CuadradoAnimadoPage()),
    AppRoute(icon: FontAwesomeIcons.circleNotch, titulo: 'Barra progreso', page: const GraficasCircularesPage()),
    AppRoute(icon: FontAwesomeIcons.pinterest, titulo: 'Pinterest', page: const PinterestPage()),
    AppRoute(icon: FontAwesomeIcons.mobile, titulo: 'Slivers', page: const SliverListPage())
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    final Map<String, Widget Function(BuildContext)> routes = {};

    for (final route in appRoutes) {
      routes.addAll(
        { route.titulo:(_) => route.page }
      );
    }
    routes.addAll(
      { 'launcher': (_) => const LauncherPage()}
    );
    return routes;
  }
}

