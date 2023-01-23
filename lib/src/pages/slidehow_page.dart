import 'package:adv_disenios/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideShowPage extends StatelessWidget {
   
  const SlideShowPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _SlideShow1()),
          Expanded( child:  _SlideShow2())
        ],
      ),
    );
  }
}

class _SlideShow1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      primaryColor: const Color(0xffff5a7e),
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


class _SlideShow2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      primaryColor: const Color(0xffff5a7e),
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