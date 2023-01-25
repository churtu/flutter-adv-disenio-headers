import 'package:adv_disenios/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  const SliverListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          _BtnNewList()
        ],
      ),
    );
  }
}

class _BtnNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<AppTheme>(context);
    return Positioned(
      bottom: 0,
      right: 0,
      child: ButtonTheme(
        minWidth: size.width*.9,
        height: 100,
        child: MaterialButton(
          onPressed: () {  
            
          },
          color: appTheme.isDarkTheme ? appTheme.currentTheme.colorScheme.secondary : const Color(0xffed6762),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50)
            )
          ),
          child: Text(
            'CREATE NEW LIST',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: appTheme.isDarkTheme ? appTheme.currentTheme.scaffoldBackgroundColor : Colors.white,
              letterSpacing: 3
            ),
          ),
        )
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = const [
    _TodoItem( 'Orange', Color(0xffF08F66) ),
    _TodoItem( 'Family', Color(0xffF2A38A) ),
    _TodoItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TodoItem( 'Books', Color(0xffFCEBAF) ),
    _TodoItem( 'Orange', Color(0xffF08F66) ),
    _TodoItem( 'Family', Color(0xffF2A38A) ),
    _TodoItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TodoItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    return CustomScrollView(
      
      slivers: [
        // const SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text('Hola'),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustonHeaderDelegate(
            minHeight: 170,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.isDarkTheme ? appTheme.currentTheme.scaffoldBackgroundColor : Colors.white,
              child: _Titulo())
          )
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(height: 100)
          ])
        )
      ],
    );
  }
}

class _SliverCustonHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minHeight;
  final double maxHeight;
  final Widget child; 

  _SliverCustonHeaderDelegate({
    required this.minHeight, 
    required this.maxHeight, 
    required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustonHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
           minHeight != oldDelegate.minHeight ||
           child     != oldDelegate.child;
  }

}

class _Titulo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(color: appTheme.isDarkTheme ? Colors.grey : Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                decoration: BoxDecoration(color: appTheme.isDarkTheme ? Colors.grey : const Color(0xfff7cdd5)),
              ),
            ),
            const Text(
              'List',
              style: TextStyle(
                  color: Color(0xffd93a30),
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
          ],
        )
      ],
    );
  }
}

class _TodoList extends StatelessWidget {
    final items = const [
    _TodoItem( 'Orange', Color(0xffF08F66) ),
    _TodoItem( 'Family', Color(0xffF2A38A) ),
    _TodoItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TodoItem( 'Books', Color(0xffFCEBAF) ),
    _TodoItem( 'Orange', Color(0xffF08F66) ),
    _TodoItem( 'Family', Color(0xffF2A38A) ),
    _TodoItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _TodoItem( 'Books', Color(0xffFCEBAF) ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length , itemBuilder: (context, index) => items[index]);
  }
}

class _TodoItem extends StatelessWidget {
  final String text;
  final Color color;

  const _TodoItem(this.text, this.color);
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    return Container(
      padding: const EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(10),
      width: 70,
      height: 130,
      decoration: BoxDecoration(
          color: appTheme.isDarkTheme ? Colors.grey : color, borderRadius: BorderRadius.circular(30)),
      child: Text(text,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}
