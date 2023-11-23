//import 'package:teston17/view/Log_in/login_screen.dart';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> mycolorList = [
    Colors.yellow,
    Color.fromARGB(255, 20, 60, 20),
  ];

  List<int> selecteddataList = [];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => StatefulBuilder(
                    builder: (context, insetState) {
                      return Container(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  selectedIndex = index;
                                  selecteddataList.add(selectedIndex);
                                  print(selecteddataList);
                                  insetState(() {});
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: mycolorList[index],
                                        border: selectedIndex == index
                                            ? Border.all(
                                                color: mycolorList[index],
                                                width: 5)
                                            : null),
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: Text("Save")),
                          ],
                        ),
                      );
                    },
                  ));
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: 50,
                            width: 200,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Search",
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1000,
              child: ListView.builder(
                  itemCount: selecteddataList.length,
                  itemBuilder: (context, index) => Container(
                        height: 50,
                        width: 100,
                        color: mycolorList[selecteddataList[index]],
                      )),
            ),
          )
        ],
      ),
    );
  }
}
