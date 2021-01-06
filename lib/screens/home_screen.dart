import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodApp/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kwhiteColor,
              kgreyBackground,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(1, 9),
                      blurRadius: 10.0,
                    ),
                  ],
                  color: korangeColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text('top'),
                ),
              ),
              ksizedBoxHeight,
              //category title row
              buildCategory("Categories"),
              ksizedBoxHeight,
              //categories
              buildCategories(),
              ksizedBoxHeight,
              //Popular Now title row
              buildCategory("Popular Now"),
              ksizedBoxHeight,
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kwhiteColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: Offset(1, 9),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildCategories() {
    return Container(
      height: 200,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 150,
            decoration: BoxDecoration(
              // color: korangeColor,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.4),
              //     offset: Offset(1, 9),
              //     blurRadius: 20.0,
              //   ),
              // ],
              gradient: LinearGradient(
                colors: [
                  Colors.orange,
                  korangeColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70.0,
                  width: 70.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kwhiteColor,
                  ),
                ),
                Text(
                  "Pizza",
                  style: ktitleTextStyle.copyWith(color: Colors.white),
                ),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kwhiteColor,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: korangeColor,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Row buildCategory(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: ktitleTextStyle,
        ),
        Row(
          children: [
            Text(
              "View All",
              style: korangeTextStyle,
            ),
            ksizedBoxWidth,
            Container(
              height: 25.0,
              width: 25.0,
              decoration: BoxDecoration(
                color: korangeColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: kwhiteColor,
                    size: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'LosAngeles',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: kwhiteColor,
      elevation: 0.0,
      leading: Icon(
        Icons.menu_open_rounded,
        color: Colors.black,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: SvgPicture.asset(
            'assets/search.svg',
            height: 30.0,
          ),
        ),
      ],
    );
  }
}
