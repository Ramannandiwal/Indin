import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<String> items = [
    // Add your image URLs or widget builders for carousel items here
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
    'https://example.com/image3.jpg',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center( // Center the text
          child: Text(
            "Indian",
            style: TextStyle(color: Colors.white),
          ),
        ),
        elevation: 0, // Remove default shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
        ),
        backgroundColor: Color(0xFF614a38), // Set the background color
        // Add padding for margin
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: CarouselSlider(
              items: items.map((item) => Container(
                child: Center(
                  child: Image.network(
                    item,
                    fit: BoxFit.cover, // Adjust image fitting as needed
                  ),
                ),
              )).toList(),
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
              // Optional callback function
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'E-commerce',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: Colors.transparent,),
                label: 'E-commerce',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: 'More',
              ),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            // Set the background color to your primary color (assuming it's defined in your ThemeData)
            backgroundColor: Color(0xFF614a38),
          ),
          // Positioned for the central floating action button (AI icon)
          Positioned(
            top: -30, // Position the circle above the BottomNavigationBar
            left: MediaQuery.of(context).size.width / 2 - 30, // Center the circle
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.smart_toy_rounded),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            ),
          ),
        ],
      ),
    );
  }
}