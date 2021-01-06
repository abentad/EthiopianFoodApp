import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodApp/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Category> categories = [
    Category(foodName: "Pizza", imageName: "pizza.svg"),
    Category(foodName: "Burger", imageName: "burger.svg"),
    Category(foodName: "Salad", imageName: "salad.svg"),
    Category(foodName: "Smoothie", imageName: "smoothie.svg"),
    Category(foodName: "Steak", imageName: "steak.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    //size
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Color(0xFF7A7A7A),
      //builds appbar
      appBar: buildAppBar(),
      //main background
      body: SingleChildScrollView(
        child: Container(
          height: height + 200,
          width: width,
          decoration: BoxDecoration(
            //gradient
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
                //the top card
                Container(
                  height: 180.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(1, 9),
                        blurRadius: 10.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage("assets/cardBg.jpg"),
                      fit: BoxFit.fill,
                    ),
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
                buildCategories(categories),
                ksizedBoxHeight,
                //Popular Now title row
                buildCategory("Popular Now"),
                ksizedBoxHeight,
                Expanded(
                  child: buildPopulars(
                    foodName: "Primavera Pizza",
                    imageName: "pizza1.jpg",
                    price: "140",
                    weight: "540",
                  ),
                ),
                Expanded(
                  child: buildPopulars(
                    foodName: "Meat Lover Pizza",
                    imageName: "pizza2.jpg",
                    price: "120",
                    weight: "400",
                  ),
                ),
                Expanded(
                  child: buildPopulars(
                    foodName: "Margarita Pizza",
                    imageName: "pizza3.jpg",
                    price: "100",
                    weight: "380",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPopulars(
      {String imageName, String foodName, String weight, String price}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.only(left: 10.0),
      height: 130,
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
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100.0,
                width: 110.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                    image: AssetImage("assets/$imageName"),
                    fit: BoxFit.cover,
                    // height: 30.0,
                  ),
                ),
              ),
              SizedBox(width: 30.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: ktitleTextStyle.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Weight $weight gr',
                    style: ktitleTextStyle.copyWith(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Price: ${price}Br',
                    style: ktitleTextStyle.copyWith(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: korangeColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: kwhiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategories(List<Category> category) {
    return Container(
      height: 200,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              selectedIndex = index;
              setState(() {});
            },
            child: Container(
              margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
              width: 150,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(1, 5),
                    blurRadius: 10.0,
                  ),
                ],
                gradient: index == selectedIndex
                    ? LinearGradient(
                        colors: [
                          Colors.orange,
                          korangeColor,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )
                    : LinearGradient(
                        colors: [
                          kwhiteColor,
                          kwhiteColor,
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(1, 6),
                          blurRadius: 10.0,
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: kgreyBackground,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/${categories[index].imageName}",
                        height: 40.0,
                      ),
                    ),
                  ),
                  Text(
                    categories[index].foodName.toString(),
                    style: ktitleTextStyle.copyWith(
                      color:
                          index == selectedIndex ? Colors.white : Colors.black,
                    ),
                  ),
                  Container(
                    height: 45.0,
                    width: 45.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kgreyBackground,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: Offset(1, 9),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: korangeColor,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LosAngeles',
            style: TextStyle(color: Colors.black),
          ),
          ksizedBoxWidth,
          Icon(
            Icons.arrow_downward_outlined,
            color: korangeColor,
          )
        ],
      ),
      centerTitle: true,
      backgroundColor: kwhiteColor,
      elevation: 0.0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

class Category {
  String foodName;
  String imageName;
  Category({this.foodName, this.imageName});
}
