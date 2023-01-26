import 'package:adv_disenios/src/models/models.dart';
import 'package:adv_disenios/src/routes/routes.dart';
import 'package:adv_disenios/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
   
  const LauncherTabletPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.currentTheme.colorScheme.secondary,
        title: const Text('Diseños avanzados - Tablet')
      ),
      body: Row(
        children: [
          SizedBox(
            width: 300,
            height: double.infinity,
            child: _ListaOpciones(),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: appTheme.isDarkTheme ? Colors.grey : appTheme.currentTheme.colorScheme.secondary,
          ),
          Expanded(
            child: layoutModel.currentPage,
          )
        ],
      ),
      drawer: _MenuPrincipal(),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: accentColor,
                maxRadius: 100,
                child: const Text(
                  'CU',
                  style: TextStyle(
                    fontSize: 50
                  ),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones()
            ),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: accentColor,
              ),
              title: const Text('Dark mode'),
              trailing: Switch.adaptive(
                value: appTheme.isDarkTheme, 
                activeColor: accentColor,
                onChanged: (value) => appTheme.isDarkTheme = value
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.add_to_home_screen,
                color: accentColor,
              ),
              title: const Text('Custom theme'),
              trailing: Switch.adaptive(
                activeColor: accentColor,
                value: appTheme.isCustomTheme, 
                onChanged: (value) => appTheme.isCustomTheme = value
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final layoutModel = Provider.of<LayoutModel>(context);
    final appTheme = Provider.of<AppTheme>(context);
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: AppRouter.appRoutes.length,
      separatorBuilder: (context, index) => Divider(color: appTheme.currentTheme.primaryColorLight),
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          AppRouter.appRoutes[index].icon,
          color: appTheme.currentTheme.colorScheme.secondary
        ),
        title: Text(AppRouter.appRoutes[index].titulo),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.currentTheme.colorScheme.secondary,
        ),
        onTap: () {
          layoutModel.currentPage = AppRouter.appRoutes[index].page;
        },
      ),
    );
  }
}