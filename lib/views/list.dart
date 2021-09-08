import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uve_nto/models/populurEvent.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  String path = 'lib/assets/images/';
  Map<String, String> dateList = Map();
  Map<String, String> eventList = Map();
  List<PopularEvent> popularEventList = [];

  var activeIndex = 0;
  var activeIndexAppBar = 0;

  @override
  void initState() {
    super.initState();

    dateList['10'] = 'Sun';
    dateList['11'] = 'Mon';
    dateList['12'] = 'Tue';
    dateList['13'] = 'Wen';
    dateList['14'] = 'Thu';
    dateList['15'] = 'Fri';
    dateList['16'] = 'Sat';

    eventList['concert.svg'] = 'Concert';
    eventList['sports.svg'] = 'Sports';
    eventList['education.svg'] = 'Education';

    popularEventList.add(
      PopularEvent(
        'Sports Meet in Galaxy Field',
        'Jan 12, 2019',
        'Greenfields, Sector 42, Faridabad',
        path + 'image1.png',
      ),
    );
    popularEventList.add(
      PopularEvent(
        'Art & Meet in Street Plaza',
        'Jan 12, 2019',
        'Galaxyfields, Sector 22, Faridabad',
        path + 'image2.png',
      ),
    );
    popularEventList.add(
      PopularEvent(
        'Youth Music in Galleria',
        'Jan 12, 2019',
        'Greenfields, Sector 42, Faridabad',
        path + 'image3.png',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff102733),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appBar(),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, Hussein',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                                Text(
                                  'Let\'s explore what’s happening nearby',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(path + 'user.png'),
                                ),
                                border: Border.all(
                                    color: Color(0xffFFA700), width: 3),
                                color: Color(0xffF2DF90),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          height: 90,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      activeIndex = index;
                                    });
                                  },
                                  child: dateView(
                                      dateList.keys.elementAt(index),
                                      dateList.values.elementAt(index),
                                      activeIndex == index),
                                ),
                              );
                            },
                            itemCount: dateList.length,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'All Events',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: eventView(
                                    path + eventList.keys.elementAt(index),
                                    eventList.values.elementAt(index),
                                  ),
                                );
                              },
                              itemCount: eventList.keys.length,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pupular Events',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                      Container(
                        height: size.height * 0.35,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: popularEventView(
                                  popularEventList.elementAt(index)),
                            );
                          },
                          itemCount: popularEventList.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            height: size.height * 0.1,
            width: size.width,
            color: Color(0xFF152F3E),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: appBarItem(Icons.home, 'Home', activeIndexAppBar == 0),
                  onTap: () {
                    setState(() {
                      activeIndexAppBar = 0;
                    });
                  },
                ),
                GestureDetector(
                  child: appBarItem(
                      Icons.search, 'Search', activeIndexAppBar == 1),
                  onTap: () {
                    setState(() {
                      activeIndexAppBar = 1;
                    });
                  },
                ),
                GestureDetector(
                  child: appBarItem(
                      Icons.star_border, 'Favorate', activeIndexAppBar == 2),
                  onTap: () {
                    setState(() {
                      activeIndexAppBar = 2;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appBarItem(IconData icon, String title, bool isActive) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: isActive ? Color(0xFF102733) : Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isActive
                    ? activeAppItem(icon, title)
                    : Icon(
                        icon,
                        color: Colors.white,
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget activeAppItem(IconData icon, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Color(0xFFFFA700),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
            color: Color(0xFFFFA700),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget popularEventView(PopularEvent popularEvent) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Color(0xff707070).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  popularEvent.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      path + 'date.svg',
                      width: 20,
                      height: 20,
                      //color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      popularEvent.date,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      path + 'location.svg',
                      width: 20,
                      height: 20,
                      //color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      popularEvent.location,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 120,
            width: 107,
            margin: EdgeInsets.only(right: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Image.asset(
                popularEvent.icon,
                // width: 50,
                height: 97,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget eventView(String icon, String title) {
    return Container(
      width: 129,
      height: 102,
      decoration: BoxDecoration(
        color: Color(0xff707070).withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            '$icon',
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$title',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget dateView(String number, String day, bool isActive) {
    return Container(
      width: 47,
      height: 67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isActive ? Color(0xffFCCD00) : Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Text(
              number,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.black : Colors.white,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              day,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isActive ? Colors.black : Colors.white,
                  fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              path + 'miniLogo.svg',
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'UVE',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20),
            ),
            Text(
              'NTO',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFFA700),
                  fontSize: 20),
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(path + 'notification_none.svg'),
            SizedBox(
              width: 20,
            ),
            SvgPicture.asset(path + 'menu.svg'),
            SizedBox(
              width: 10,
            )
          ],
        )
      ],
    );
  }
}
