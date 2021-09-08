import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path = 'lib/assets/images/';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            path + 'bg1.svg',
            fit: BoxFit.fill,
            //height: size.height,
            width: size.width,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(path + 'logo.svg'),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      'UVE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                    ),
                    Text(
                      'NTO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFA700),
                          fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'There\'s a lot happening around you! Our\n mission is to provide what\'s happening\n near you!',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Get Started!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(path + 'arrow.svg')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
