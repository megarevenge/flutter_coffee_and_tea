import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee_and_tea/components/item_card.dart';
import 'package:liquid_glass_widgets/widgets/shared/glass_page.dart';

class HomeContentPage extends StatefulWidget {
  const HomeContentPage({super.key});

  @override
  State<HomeContentPage> createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage> {
  int _currentIndex = 0;

  final List<Map<String, String>> cardData = [
    {'title': 'Free Delivery', 'image': 'assets/poster_home_page/delivery.png'},
    {
      'title': 'New seasonal drink',
      'image': 'assets/poster_home_page/new_drink.png',
    },
    {
      'title': 'Get 20% cashback',
      'image': 'assets/poster_home_page/cashback.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Color(0xffF3E4C9), fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff8A5F41),
      ),
      backgroundColor: Colors.white,
      body: GlassPage(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  enlargeCenterPage: false, // Makes the center card pop out
                  autoPlay: true, // Enables automatic sliding
                  autoPlayAnimationDuration: const Duration(milliseconds: 100),
                  //autoPlayCurve: Curves.linear,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 3),
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardData.map((data) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          image: DecorationImage(
                            image: AssetImage(data['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap:
                      true, // Crucial: Tells GridView to only take needed space
                  physics:
                      const NeverScrollableScrollPhysics(), // Disables GridView's inner scrolling
                  itemCount: 10, // 2 columns x 5 rows = 10 items total
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 12, // Horizontal spacing between cards
                    mainAxisSpacing: 12, // Vertical spacing between cards
                    childAspectRatio: 0.75, // Adjust card height-to-width ratio
                  ),
                  itemBuilder: (context, index) {
                    return ItemCard(index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
