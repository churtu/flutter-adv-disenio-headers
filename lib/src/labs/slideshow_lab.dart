

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:adv_disenios/src/models/models.dart';
import 'package:provider/provider.dart';

class SlideShowPageLab extends StatelessWidget {
   
  const SlideShowPageLab({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
           child: Column(
             children: [
               Expanded(
                child: _Slides()
              ),
              _Indicators()
             ],
           )
        ),
      ),
    );
  }
}

class _Indicators extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _Dot(0),
          _Dot(1),
          _Dot(2)
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final sliderModel = Provider.of<SliderModel>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: (sliderModel.currentPageIndex >= index - .5 && sliderModel.currentPageIndex < index + .5)
          ? Colors.blue 
          : Colors.grey,
        borderRadius: BorderRadius.circular(50)
      ),
    );
  }
}


class _Slides extends StatefulWidget {
 
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  late PageController pageViewController;
  late SliderModel sliderModel;

  @override
  void initState() {
    sliderModel = Provider.of<SliderModel>(context, listen: false);
    pageViewController = PageController();
    pageViewController.addListener(() { 
      sliderModel.currentPageIndex = pageViewController.page!;
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
        children: const [
          _Slide(svg: 'assets/slides/slide_1.svg'),
          _Slide(svg: 'assets/slides/slide_2.svg'),
          _Slide(svg: 'assets/slides/slide_3.svg')
        ],
      );
  }
}

class _Slide extends StatelessWidget {
  final String svg;

  const _Slide({required this.svg});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg),
    );
  }
}