
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsTop;
  final Color primaryColor;
  final Color secondaryColor;
  final double bulletPrimarySize;
  final double bulletSecondarySize;

  const SlideShow({
    super.key,
    required this.slides,
    this.dotsTop = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.bulletPrimarySize = 12,
    this.bulletSecondarySize = 12
    });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderProvider(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (context) {
              final sliderProvider = Provider.of<_SliderProvider>(context);
              sliderProvider.primaryColor = primaryColor;
              sliderProvider.secondaryColor = secondaryColor;
              sliderProvider.bulletPrimarySize = bulletPrimarySize;
              sliderProvider.bulletSecondarySize = bulletSecondarySize;
              return Column(
                   children: [
                    if(dotsTop) _Indicators(slides.length),
                     Expanded(
                      child: _Slides(slides)
                    ),
                    if(!dotsTop) _Indicators(slides.length),
                   ],
                 );
            }
          ),
        ),
      ),
    );
  }
}


class _Indicators extends StatelessWidget {
  final int length;
  const _Indicators(this.length);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<_SliderProvider>(context);
    late double size;
    late Color color;
    final isCurrentIndex = (sliderProvider.currentPageIndex >= index - .5 && sliderProvider.currentPageIndex < index + .5);

    if( isCurrentIndex ){
      size = sliderProvider.bulletPrimarySize;
      color = sliderProvider.primaryColor;
    }else{
      size = sliderProvider.bulletSecondarySize;
      color = sliderProvider.secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50)
      ),
    );
  }
}


class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  late PageController pageViewController;
  late _SliderProvider sliderProvider;

  @override
  void initState() {
    sliderProvider = Provider.of<_SliderProvider>(context, listen: false);
    pageViewController = PageController();
    pageViewController.addListener(() { 
      sliderProvider.currentPageIndex = pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
        children: widget.slides.map(
          (slide) => _Slide(slide)
        ).toList(),
      );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SliderProvider with ChangeNotifier{
  double _currentPageIndex = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _bulletPrimarySize = 12;
  double _bulletSecondarySize = 12;

  double get currentPageIndex => _currentPageIndex;
  Color get primaryColor => _primaryColor;
  Color get secondaryColor => _secondaryColor;
  double get bulletPrimarySize => _bulletPrimarySize;
  double get bulletSecondarySize => _bulletSecondarySize;

  set currentPageIndex(double currentPageIndex) {
    _currentPageIndex = currentPageIndex;
    notifyListeners();
  }

  set primaryColor(Color primaryColor){
    _primaryColor = primaryColor;
  }

  set secondaryColor(Color secondaryColor){
    _secondaryColor = secondaryColor;
  }

  set bulletPrimarySize(double bulletPrimarySize){
    _bulletPrimarySize = bulletPrimarySize;
  }
  
  set bulletSecondarySize(double bulletSecondarySize){
    _bulletSecondarySize = bulletSecondarySize;
  }
}