
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function() onPressed;
  final IconData icon;

  PinterestButton({
    required this.onPressed, 
    required this.icon
  });
}

class PinterestMenu extends StatelessWidget {

  final bool show;
  final Color primaryColor;
  final Color backgroundColor;
  final Color secondaryColor;
  final List<PinterestButton> items;

  const PinterestMenu({
    super.key, 
    required this.items,
    this.show = true,
    this.primaryColor = Colors.black,
    this.secondaryColor = Colors.blueGrey,
    this.backgroundColor = Colors.white,
  });


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuProvider(),
      child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: show ? 1 : 0,
          child: Builder(
            builder: (context) {
              Provider.of<_MenuProvider>(context)
                ..backgroundColor = backgroundColor
                ..primaryColor = primaryColor
                ..secondaryColor = secondaryColor;
              return _PinterestMenuContainer(
                child: _MenuItems(items)
              );
            }
          )
        )
    );
  }
}




class _PinterestMenuContainer extends StatelessWidget {
  final Widget child;

  const _PinterestMenuContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<_MenuProvider>(context);
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: menuProvider.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ],
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;

  const _MenuItems(this.items);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(items.length, (index) => _PinterestMenuItem(index, items[index])),
    );
  }
}

class _PinterestMenuItem extends StatelessWidget {
  final int index;
  final PinterestButton pinterestButton;

  const _PinterestMenuItem(
    this.index, 
    this.pinterestButton
  );
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<_MenuProvider>(context);
    return GestureDetector(
      onTap: () {
        menuProvider.currentItemSelected = index;
        pinterestButton.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        child: Icon(
          pinterestButton.icon,
          color: menuProvider.currentItemSelected == index ? menuProvider.primaryColor : menuProvider.secondaryColor,
          size: menuProvider.currentItemSelected == index ? 35 : 25,
        ),
      ),
    );
  }
}

class _MenuProvider with ChangeNotifier {
  int _currentItemSelected = 0;
  Color primaryColor = Colors.black;
  Color backgroundColor = Colors.white;
  Color secondaryColor = Colors.blueGrey;

  int get currentItemSelected => _currentItemSelected;

  set currentItemSelected(int currentItemSelected){
    _currentItemSelected = currentItemSelected;
    notifyListeners();
  }
}