import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';
import 'package:flutter_ngirit/presentation/misc/app_sizes.dart';
import 'package:flutter_ngirit/presentation/misc/app_styles.dart';
import 'package:flutter_ngirit/presentation/pages/main/main_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late MainController _controller;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _controller = MainController();
    _tabController = TabController(vsync: this, length: 4);
  }

  Widget _tabItem(IconData child, String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: const Border(
                top: BorderSide(width: 2, color: lightBlue),
              ),
              color: lightBlue.withOpacity(0.2),
            ),
      padding: const EdgeInsets.symmetric(vertical: AppSize.dimen8),
      child: isSelected
          ? Column(
              children: [
                Icon(child,
                    color: isSelected
                        ? colorNavBarIconActive
                        : colorNavBarIconInActive),
                if (isSelected) ...[
                  Text(
                    label,
                    style: textStyleW400S10.copyWith(
                      color: isSelected
                          ? colorNavBarIconActive
                          : colorNavBarIconInActive,
                    ),
                  ),
                ]
              ],
            )
          : Icon(child, color: colorNavBarIconInActive),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _controller.bodyView.elementAt(_controller.selectedNavBar),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 7,
              spreadRadius: -10,
            ),
          ],
        ),
        height: 100,
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.white,
            child: TabBar(
                onTap: (index) {
                  setState(() {
                    _controller.changeSelectedNavBar(index);
                  });
                },
                labelColor: Colors.white,
                unselectedLabelColor: Colors.blueGrey,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide.none,
                ),
                tabs: [
                  for (int i = 0; i < _controller.icons.length; i++)
                    _tabItem(
                      _controller.icons[i],
                      _controller.bottomNavlabels[i],
                      isSelected: i == _controller.selectedNavBar,
                    ),
                ],
                controller: _tabController),
          ),
        ),
      ),

      // this is option, just show to them.
      //     BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Beranda",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.assignment),
      //       label: "Tambah",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.mail),
      //       label: "Dompet",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: "Profil",
      //     ),
      //   ],
      //   currentIndex: _controller.selectedNavBar,
      //   selectedItemColor: lightBlue,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: false,
      //   onTap: (index) {
      //     setState(() {
      //       _controller.changeSelectedNavBar(index);
      //     });
      //   },
      // ),
    );
  }
}
