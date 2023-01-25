import 'package:adv_disenios/src/widgets/widgets.dart';
import 'package:adv_disenios/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    return ChangeNotifierProvider(
      create: (_) => _MenuProvider(),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            _PinterestGrid(),
            Builder(builder: (context) {
              final menuProvider = Provider.of<_MenuProvider>(context);
              return Positioned(
                  bottom: 30,
                  child: PinterestMenu(
                    backgroundColor: appTheme.currentTheme.scaffoldBackgroundColor,
                    primaryColor: appTheme.currentTheme.colorScheme.secondary,
                    show: menuProvider.show,
                    items: [
                      PinterestButton(
                          onPressed: () {
                          },
                          icon: Icons.pie_chart),
                      PinterestButton(
                          onPressed: () {
                          },
                          icon: Icons.search),
                      PinterestButton(
                          onPressed: () {
                          },
                          icon: Icons.notifications),
                      PinterestButton(
                          onPressed: () {
                          },
                          icon: Icons.supervised_user_circle),
                    ],
                  ));
            }),
          ],
        ),
      ),
    );
  }
}

class _PinterestGrid extends StatefulWidget {
  @override
  State<_PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<_PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  final ScrollController _scrollController = ScrollController();
  late _MenuProvider menuProvider;
  double _scrollAnterior = 0;

  @override
  void initState() {
    menuProvider = Provider.of<_MenuProvider>(context, listen: false);
    _scrollController.addListener(() {
      if (_scrollController.offset > _scrollAnterior &&
          _scrollController.offset > 200) {
        menuProvider.show = false;
      } else {
        menuProvider.show = true;
      }
      _scrollAnterior = _scrollController.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      physics: const BouncingScrollPhysics(),
      controller: _scrollController,
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _PinterestItem(index);
      },
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: (index % 6 + 1) * 100,
      height: (index % 6 + 1) * 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.blue),
      child: Center(
        child:
            CircleAvatar(backgroundColor: Colors.white, child: Text('$index')),
      ),
    );
  }
}

class _MenuProvider with ChangeNotifier {
  bool _show = true;

  bool get show => _show;

  set show(bool show) {
    _show = show;
    notifyListeners();
  }
}
