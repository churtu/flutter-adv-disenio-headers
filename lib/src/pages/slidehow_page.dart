import 'package:adv_disenios/src/widgets/slideshow.dart';
import 'package:adv_disenios/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
   
  const SlideShowPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _SlideShow()),
          Expanded( child:  _SlideShow())
        ],
      ),
    );
  }
}

class _SlideShow extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;
    return SlideShow(
      primaryColor: appTheme.isDarkTheme ? accentColor : const Color(0xffff5a7e),
      bulletPrimarySize: 15,
      bulletSecondarySize: 10,
      dotsTop: true,
      slides: [
        SvgPicture.asset('assets/slides/slide_1.svg'),
        SvgPicture.asset('assets/slides/slide_2.svg'),
        SvgPicture.asset('assets/slides/slide_3.svg'),
        SvgPicture.asset('assets/slides/slide_4.svg'),
        const Image(
          image: NetworkImage('https://picsum.photos/500'),
        ),
        const Image(
          image: NetworkImage('https://picsum.photos/600'),
        ),
      ],
    );
  }
}
