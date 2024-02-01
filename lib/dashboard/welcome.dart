import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_panda_app/components/restaurent.dart';
import 'package:my_panda_app/constant/color.dart';
import 'package:my_panda_app/constant/constant.dart';
import 'package:my_panda_app/dashboard/home_screen.dart';
import 'package:my_panda_app/model/panda_pick_model/pandaPickHelper.dart';
import 'package:my_panda_app/model/panda_pick_model/pandaPickItemModel.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 191, 185, 188),
        title: Center(
            child: Text(
          'Phnom Penh',
          style: TextStyle(fontFamily: Bold, fontSize: 20.0, color: Colors.white),
        )),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                //search
                Expanded(
                    child: CupertinoTextField(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                  placeholder: 'Search for shop and restaurants',
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Icon(
                      Icons.search,
                      color: Color(0xff7b7b7b),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xfff7f7f7),
                      borderRadius: BorderRadius.circular(50.0)),
                )),
              ],
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.shopping_bag_outlined, color: Colors.white,),
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.primaryColor,
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(
                  'https://pics.craiyon.com/2023-05-30/eaab7f873e324b3e8f41f5aba2c2aeb2.webp'),
            ),
          ),
          ListTile(
            title: Text(
              'Setting',
              style: TextStyle(fontFamily: Medium, color: Colors.black),
            ),
            leading: Icon(Icons.settings),
          ),
          ListTile(
            title: Text(
              'Help center',
              style: TextStyle(fontFamily: Medium, color: Colors.black),
            ),
            leading: Icon(Icons.help_center),
          ),
          ListTile(
            title: Text(
              'More',
              style: TextStyle(fontFamily: Medium, color: Colors.black),
            ),
            leading: Icon(Icons.more_horiz),
          ),
          ListTile(
            title: Text(
              'Sign up or Login ',
              style: TextStyle(fontFamily: Medium, color: Colors.black),
            ),
            leading: Icon(Icons.login_outlined),
          ),
        ],
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Container(
                    height: height * .18,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3WKGpINb8ewf_03JBmFZUyA1FZ9cwO6mwxz_lApIxAgRisDqlS1L4paOL66dbIUbkk2g&usqp=CAU'),
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Food delivery',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Text(
                                'Order from your favirate\n restaurants and home chefs',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                    fontFamily: Medium,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: height * .25,
                      decoration: BoxDecoration(
                          color: Color(0xfffed271),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:
                            Stack(alignment: Alignment.center, children: const [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/pandamart.jpg'),
                          ),
                          Positioned(
                              bottom: 15,
                              left: 0,
                              child: Text(
                                'pandamart',
                                style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              child: Text(
                                'panda20 for 20 %of',
                                style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: Medium,
                                    fontSize: 14),
                              ))
                        ]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: height * .15,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Color(0xffef9fc4),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/food.jpg'),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pick-Up',
                                  style: TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  'Upto 50% 0ff',
                                  style: TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Medium,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: height * .1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffef9fc4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shops',
                                  style: TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  'Everyday assentials',
                                  style: TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Medium,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              Text(
                'Your daily deal',
                style: TextStyle(
                    color: blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: height * .278,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        PandaPickItemModel mode =
                            PandaPickHelper.getStatusItem(index);
                        return RestaurrentScreen(
                            name: mode.name,
                            image: mode.image,
                            remainingTime: mode.remaingTime,
                            totalRating: mode.totalRating,
                            subTitle: mode.subTitle,
                            rating: mode.ratting,
                            deliveryTime: mode.remaingTime,
                            deliveryPrice: mode.deliveryPrice);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
