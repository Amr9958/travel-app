import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app__/cubits/app_cupit.dart';
import 'package:note_app__/cubits/cupit_states.dart';
import 'package:note_app__/misc/colors.dart';
import 'package:note_app__/widgets/circleTab_indicator.dart';
import 'package:note_app__/widgets/mytext.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin //f0r tab view
{
  var buttonimages = {
    "snorkling.png": "snorkling",
    "kayaking.png": "kayaking",
    "hiking.png": "hiking",
    "balloning.png": "balloning"
  };
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController tabcontroler = TabController(length: 3, vsync: this);
    return Scaffold(
        // appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Home'),
                selected: _selectedIndex == 0,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(0);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Business'),
                selected: _selectedIndex == 1,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(1);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('School'),
                selected: _selectedIndex == 2,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(2);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 70, left: 20),
                child: Row(
                  children: [
                    Builder(builder: (context) {
                      return IconButton(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.menu, size: 32),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    }),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 12),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.mainTextColor,
                          borderRadius: BorderRadius.circular(5)),
                    )
                  ],
                ),
              ),
              //discover text
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: mylargetext('Discover'),
              ),
              //tabbar
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TabBar(
                  indicator:
                      CircleIndicator(color: AppColors.mainColor, radius: 4),
                  labelPadding: EdgeInsets.only(left: 20, right: 20),
                  isScrollable: true,
                  controller: tabcontroler,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(child: mytext('places')),
                    Tab(child: mytext('inspiration')), // Middle tab
                    Tab(child: mytext('emotions')),
                  ],
                ),
              ),
              Container(
                  width: double.maxFinite,
                  height: 300,
                  child: TabBarView(controller: tabcontroler, children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<app_cupit>(context).detailedpage();
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(
                                      'img/mountain.jpeg',
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      },
                    ),
                    Text('data'),
                    Text('data')
                  ])),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mylargetext(
                      "Explore more",
                      size: 20,
                      color: Colors.black87,
                    ),
                    mytext(
                      "see all",
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: buttonimages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('img/' +
                                        buttonimages.keys.elementAt(index))),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            mytext(
                              '${(buttonimages.values.elementAt(index).toString())}',
                              color: Colors.black54,
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
