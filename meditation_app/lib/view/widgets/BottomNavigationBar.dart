import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meditation_app/components/assets.dart';


class BottomAppBarScreen extends StatefulWidget {
  final List<Widget> screens;

  BottomAppBarScreen({required this.screens});

  @override
  _BottomAppBarScreenState createState() => _BottomAppBarScreenState();
}

class _BottomAppBarScreenState extends State<BottomAppBarScreen> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: widget.screens,
      ),
      floatingActionButton: ClipOval(
        child: InkWell(
          onTap: () {},
          child: Container(
              width: Get.width * 0.2,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff22113C), // Adjust the color as needed
              ),
              child: Image(image: AssetImage(AppImages.circlebtn))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        selectedItemColor: Color(0xffC870FE),
        unselectedItemColor: Color(0Xff7F4CD2),
        backgroundColor: Color(0xff22113C),
        currentIndex: _currentIndex,
        
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppImages.homeInActive)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppImages.diaryActive)),
            label: '',
          ),
         
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppImages.checkInActive)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppImages.userInActive)),
            label: '',
          )
        ],
      ),
    );
  }
}
