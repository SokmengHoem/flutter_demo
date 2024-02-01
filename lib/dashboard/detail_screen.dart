import 'package:flutter/material.dart';
//import 'package:my_panda_app/constant/color.dart';
//import 'package:my_panda_app/constant/constant.dart';

import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Scrollable List Tab Scroller',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Scrollable List Tab Scroller'),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final data = {
    "Category A": [
      "Item 1 (A)",
      "Item 2 (A)",
      "Item 3 (A)",
      "Item 4 (A)",
    ],
    "Category B": [
      "Item 1 (B)",
      "Item 2 (B)",
    ],
    "Category C": [
      "Item 1 (C)",
      "Item 2 (C)",
      "Item 3 (C)",
      "Item 4 (C)",
      "Item 5 (C)",
    ],
    "Category D": [
      "Item 1 (D)",
      "Item 2 (D)",
      "Item 3 (D)",
      "Item 4 (D)",
      "Item 5 (D)",
      "Item 6 (D)",
      "Item 7 (D)",
      "Item 8 (D)",
      "Item 9 (D)",
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScrollableListTabScroller(
        itemCount: data.length,
        tabBuilder: (BuildContext context, int index, bool active) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            data.keys.elementAt(index),
            style: !active
                ? null
                : TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
        itemBuilder: (BuildContext context, int index) => Column(
          children: [
            Text(
              data.keys.elementAt(index),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ...data.values
                .elementAt(index)
                .asMap()
                .map(
                  (index, value) => MapEntry(
                    index,
                    ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        alignment: Alignment.center,
                        child: Text(index.toString()),
                      ),
                      title: Text(value),
                    ),
                  ),
                )
                .values
          ],
        ),
      ),
    );
  }
}
// class DetailScreen extends StatefulWidget {
//   final String name, image;
//   const DetailScreen({Key? key ,  required this.name , required this.image,}) : super(key: key);

//   @override
//   _DetailScreenState createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin {

//   late TabController controller;
//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(length: 3, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 pinned: true,
//                 floating: false,
//                 snap: false,
//                 flexibleSpace: FlexibleSpaceBar(
//                   collapseMode: CollapseMode.pin,
//                   stretchModes: [
//                     StretchMode.blurBackground
//                   ],
//                   title:  Text(
//                     widget.name,
//                     style: TextStyle(color: MyColors.primaryColor),
//                     textAlign: TextAlign.left,
//                   ),
//                   background: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Container(
//                         height: 200.0,
//                         width: double.infinity,
//                         color: Colors.grey,
//                         child: Image(
//                             fit: BoxFit.cover,
//                             image: AssetImage(widget.image)),
//                       ),
//                       // Padding(
//                       //   padding: const EdgeInsets.all(10.0),
//                       //   child: Text(
//                       //     widget.name,
//                       //     style: TextStyle(fontSize: 25.0),
//                       //     textAlign: TextAlign.left,
//                       //   ),
//                       // ),

//                     ],
//                   ),
//                 ),
//                 expandedHeight: 250.0,

//               ),
//             ];
//           },
//           // body: ScrollableListTabView(
//             body: ScrollableListTabView,
//             tabHeight: 50,
//             bodyAnimationDuration: const Duration(milliseconds: 800),
//             tabAnimationCurve: Curves.ease,
//             tabAnimationDuration: const Duration(milliseconds: 150),
//             style: TextStyle(color: Colors.green , fontFamily: Bold , fontSize: 25),
//             tabs: [
//               ScrollableListTab(
//                 tab: const ListTab(

//                   label: Text('Popular' , style: TextStyle(fontFamily: Bold),),
//                   borderRadius: BorderRadius.all( Radius.circular(20.0)),
//                   activeBackgroundColor: MyColors.navy,
//                   borderColor: MyColors.navy
//                 ),
//                 body: ListView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: 10,
//                   itemBuilder: (_, index) => Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ListTile(
//                         title: Text('Chicken Tike Pizz' , style: const TextStyle(fontFamily: Bold),),
//                         subtitle: Text("Onion, capsicum, tomat & olive"),
//                         trailing: Container(
//                         height: 80,
//                         width: 80,
//                         alignment: Alignment.center,
//                         child: Image(image: AssetImage('assets/pizza.jpg')),
//                       ),
//                       ),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 20),
//                             child: Text("RS. 120.00"),
//                           ),
//                           Container(
//                             width: 90,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Color(0xffeab676).withOpacity(0.5)),
//                             child: Center(
//                               child: Text('🔥 Popular' , style: TextStyle( fontSize: 14,color: blackColor , fontFamily: Medium),),
//                             ),
//                           )
//                         ],
//                       ),
//                       Divider()
//                     ],
//                   ),
//                 ),
//               ),
//               ScrollableListTab(
//                 tab: const ListTab(
//                     label: Text('Favourite'),
//                     borderRadius: BorderRadius.all( Radius.circular(20.0)),
//                     activeBackgroundColor: MyColors.navy,
//                     borderColor: MyColors.navy,
//                   inactiveBackgroundColor: Colors.white,
//                 ),
//                 body: GridView.builder(
//                   shrinkWrap: true,
//                   gridDelegate:
//                   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: 10,
//                   itemBuilder: (_, index) => Card(
//                     child: Stack(
//                       fit: StackFit.passthrough,
//                       children: [
//                         Image(
//                           fit: BoxFit.fitHeight,
//                           image: AssetImage('assets/cake.jpg'),),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text('Favoruite Deal 1' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w900, fontSize: 18, fontFamily: Bold),),
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           right: 10 ,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 10),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Color(0xfffffcff),
//                                   borderRadius: BorderRadius.circular(20.0)
//                               ),
//                               child:  Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                                 child: Text('Rs. 180.00' , style: TextStyle(color: blackColor , fontSize: 12, fontFamily: Bold),),
//                               ),

//                             ),
//                           ),
//                         ),


//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
