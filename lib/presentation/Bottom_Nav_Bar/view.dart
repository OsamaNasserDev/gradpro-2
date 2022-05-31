import 'package:flutter/material.dart';
import 'package:gradpro/presentation/main/view.dart';
import 'package:gradpro/presentation/my_team/my_team.dart';
import 'package:gradpro/presentation/profile/profile.dart';
import 'package:gradpro/presentation/requests/requests.dart';
import 'package:gradpro/presentation/resources/color_manager.dart';


class BottomNavBarScreen extends StatefulWidget {
  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int currentBottomIndex = 0;

  List currentPage = [
    MainScreen(),
    RequestsScreen(),
    MyTeamScreen(),
    ProfileScreen(),
  ];

  ChangeBottomNavBarIndex(index) {
    currentBottomIndex = index;
    setState(() {

    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: currentPage[currentBottomIndex]
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(left: 10 ,right: 10 ,bottom: 14),
        child: Container(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(18.0), bottomRight: Radius.circular(18.0),topLeft:Radius.circular(8.0),topRight: Radius.circular(8.0)  ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
                backgroundColor: ColorManager.darkPrimary,
              selectedIconTheme: IconThemeData(color: Colors.white),
              unselectedIconTheme:  IconThemeData(color: Colors.white70),
              selectedItemColor:  Colors.white ,
              unselectedItemColor:  Colors.white70,
              currentIndex: currentBottomIndex,
              onTap: (index) {
                ChangeBottomNavBarIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.request_page_outlined ),
                  label: 'Requests',
                ),

                BottomNavigationBarItem(
                  icon: Icon(Icons.plagiarism_rounded ),
                  label: 'Team',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person ),
                  label: 'Profile',
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
