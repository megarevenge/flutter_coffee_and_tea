import 'package:flutter/material.dart';
import 'package:flutter_coffee_and_tea/pages/page_controller/home_content_page.dart';
import 'package:flutter_coffee_and_tea/pages/page_controller/orders_page.dart';
import 'package:flutter_coffee_and_tea/pages/page_controller/profile.dart';
import 'package:flutter_coffee_and_tea/pages/page_controller/search.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: GlassPage(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          //physics: ClampingScrollPhysics(),
          children: [
            HomeContentPage(),
            SearchPage(),
            OrdersPage(),
            ProfilePage(),
          ],
        ),
      ),

      bottomNavigationBar: GlassBottomBar(
        selectedIconColor: Color(0xff8A5F41),
        unselectedIconColor: Color(0xffA77F60),
        selectedIndex: _selectedIndex,
        onTabSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          // Triggers the slide animation to the respective file widget
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
          );
        },
        quality: GlassQuality.premium,
        tabs: [
          GlassBottomBarTab(
            label: 'Home',
            icon: const Icon(Icons.home_rounded),
          ),
          GlassBottomBarTab(
            label: 'Search',
            icon: const Icon(Icons.search_rounded),
          ),
          GlassBottomBarTab(
            label: 'Orders',
            icon: const Icon(Icons.receipt_rounded),
          ),
          GlassBottomBarTab(
            label: 'Profile',
            icon: const Icon(Icons.person_rounded),
          ),
        ],
      ),
    );
  }
}
