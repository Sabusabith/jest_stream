// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:get/get.dart';

// import 'package:zee_tv_app/Controllers/SelectedItemController.dart';
// import 'package:zee_tv_app/Screens/Categories/Categories.dart';

// import 'package:zee_tv_app/Screens/Favrities/FavoritesHome.dart';

// import 'package:zee_tv_app/Screens/Home/Home1.dart';
// import 'package:zee_tv_app/Screens/Movies/Movies.dart';
// import 'package:zee_tv_app/Screens/Search/Search.dart';
// import 'package:zee_tv_app/Screens/Shows/Shows.dart';
// import 'package:zee_tv_app/Screens/Splash/Splash.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     RawKeyEvent? event;
//     bool value;
//     SelectedItemController selectedItemController =
//         Get.put(SelectedItemController());
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         backgroundColor: Color(0xff202428),
//         body: SizedBox(
//             width: size.width,
//             height: size.height,
//             child: Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
//                 child: NestedScrollView(
//                   headerSliverBuilder: (context, innerBoxIsScrolled) => [
//                     SliverAppBar(
//                       backgroundColor: Color(0xff202428),
//                       leading: SizedBox(),
//                       leadingWidth: 0,
//                       title: Row(
//                         children: [
//                           InkWell(
//                             autofocus: true,
//                             focusColor: Colors.white,
//                             child: CircleAvatar(
//                               radius: 18,
//                               backgroundImage:
//                                   AssetImage("Assets/Images/pic.png"),
//                             ),
//                           ),
//                           Expanded(
//                             child: RawKeyboardListener(
//                                 focusNode: FocusNode(),
//                                 onKey: (RawKeyEvent event) {
//                                   // Handle TV remote key events
//                                   if (event.logicalKey ==
//                                       LogicalKeyboardKey.arrowLeft) {
//                                     if (selectedItemController
//                                             .tabController!.index >=
//                                         0) {
//                                       selectedItemController.tabController!
//                                           .animateTo(selectedItemController
//                                                   .tabController!.index -
//                                               1);
//                                     }
//                                   } else if (event.logicalKey ==
//                                       LogicalKeyboardKey.arrowRight) {
//                                     if (selectedItemController
//                                             .tabController!.index <=
//                                         selectedItemController
//                                                 .tabController!.length -
//                                             1) {
//                                       selectedItemController.tabController!
//                                           .animateTo(selectedItemController
//                                                   .tabController!.index +
//                                               1);
//                                     }
//                                   }
//                                 },
//                                 child: TabBar(
//                                     overlayColor:
//                                         MaterialStatePropertyAll(Colors.red),
//                                     controller:
//                                         selectedItemController.tabController,
//                                     splashFactory: NoSplash.splashFactory,
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 36),
//                                     indicatorPadding: EdgeInsets.symmetric(
//                                         vertical: 10, horizontal: 10),
//                                     unselectedLabelColor: Colors.grey.shade300,
//                                     labelColor: Colors.black,
//                                     labelStyle: TextStyle(fontSize: 12),
//                                     indicatorSize: TabBarIndicatorSize.tab,
//                                     indicator: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(5),
//                                         color: Colors.white),
//                                     tabs: [
//                                       Focus(
//                                         autofocus: true,
//                                         focusNode: FocusNode(),
//                                         onFocusChange: (value) {},
//                                         child: Tab(
//                                           child: Container(
//                                             child: Align(
//                                               alignment: Alignment.center,
//                                               child: Text("Home"),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Focus(
//                                         autofocus: true,
//                                         focusNode: FocusNode(),
//                                         onFocusChange: (value) {
//                                           selectedItemController.changeTab(1);
//                                         },
//                                         child: Tab(
//                                           child: Container(
//                                             child: Align(
//                                               alignment: Alignment.center,
//                                               child: Text("Categories"),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Focus(
//                                         autofocus: true,
//                                         focusNode: FocusNode(),
//                                         onFocusChange: (value) {
//                                           selectedItemController.changeTab(2);
//                                         },
//                                         child: Tab(
//                                           child: Container(
//                                             child: Align(
//                                               alignment: Alignment.center,
//                                               child: Text("Movies"),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Focus(
//                                         autofocus: true,
//                                         focusNode: FocusNode(),
//                                         onFocusChange: (value) {
//                                           selectedItemController.changeTab(3);
//                                         },
//                                         child: Tab(
//                                           child: Container(
//                                             child: Align(
//                                               alignment: Alignment.center,
//                                               child: Text("Shows"),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Focus(
//                                         autofocus: true,
//                                         focusNode: FocusNode(),
//                                         onFocusChange: (value) {
//                                           selectedItemController.changeTab(4);
//                                         },
//                                         child: Tab(
//                                           child: Container(
//                                             child: Align(
//                                               alignment: Alignment.center,
//                                               child: Text("Favorites"),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       Focus(
//                                         autofocus: true,
//                                         focusNode: FocusNode(),
//                                         onFocusChange: (value) {
//                                           selectedItemController.changeTab(5);
//                                         },
//                                         child: Tab(
//                                           child: Container(
//                                             child: Align(
//                                               alignment: Alignment.center,
//                                               child: Icon(
//                                                 CupertinoIcons.search,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ])),
//                           ),
//                           SizedBox(
//                             width: 100,
//                           ),
//                           SizedBox(
//                               width: 150,
//                               height: 40,
//                               child:
//                                   SvgPicture.asset("Assets/Images/Logo2.svg")),
//                         ],
//                       ),
//                     )
//                   ],
//                   body: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 7,
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Expanded(
//                             child: TabBarView(
//                                 dragStartBehavior: DragStartBehavior.start,
//                                 controller:
//                                     selectedItemController.tabController,
//                                 children: [
//                               Home1(),
//                               Categories(),
//                               Movies(),
//                               Shows(),
//                               FavMoviesHome(),
//                               Search()
//                             ]))
//                       ],
//                     ),
//                   ),
//                 ))));
//   }

//   void _moveDown() {
//     FocusManager.instance.primaryFocus!
//         .focusInDirection(TraversalDirection.down);
//   }
// }
