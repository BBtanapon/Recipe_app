import 'package:flutter/material.dart';
//swiper
import 'package:flutter_swiper/flutter_swiper.dart';

class swiperPopular extends StatelessWidget {
  final controller = PageController(initialPage: 1, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250.0,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return PageView(
              controller: controller,
              children: <Widget>[
                _tarjeta(),
                _tarjeta(),
                _tarjeta(),
                _tarjeta(),
                _tarjeta()
              ],
            );
          },
          itemCount: 2,
          layout: SwiperLayout.DEFAULT,
        ));
  }
}

Widget _tarjeta() {
  return Container(
    margin: EdgeInsets.only(left: 30.0),
    alignment: AlignmentDirectional.centerEnd,
    child: Image(
      image: AssetImage('assets/recipe-slider1.png'),
      fit: BoxFit.fill,
    ),
  );
}
