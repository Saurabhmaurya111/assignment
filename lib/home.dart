import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_assignment/feature.dart';
import 'package:flutter_assignment/filter_screen.dart';
import 'package:flutter_assignment/perfume_banner.dart';
import 'package:flutter_assignment/perfume_card.dart';
import 'package:flutter_assignment/product_card.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Map<String, String>> bannerImages = [
    {
      'image': 'lib/icons/Rectangle 165362.png',
      'title': 'New Perfume \nCollection 2024',
      'subtitle': 'Discover the best scents of the year'
    },
    {
      'image': 'lib/icons/Rectangle 165362.png',
      'title': 'Choose Your \nPerfect Scent',
      'subtitle': 'Find the fragrance that suits you'
    }
  ];

  final List<Map<String, String>> categories = [
    {'image': 'lib/icons/1.png', 'name': '   Home \nFregrances'},
    {'image': 'lib/icons/2.png', 'name': '  Oud & \nBukhour'},
    {'image': 'lib/icons/3.png', 'name': 'Hair \nMust'},
    {'image': 'lib/icons/4.png', 'name': 'Mamoul'},
    {'image': 'lib/icons/5.png', 'name': 'Bukhour'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // **Top Navigation Bar**
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FilterPage()),
                        );
                      },
                      child: Image.asset(
                        'lib/icons/Vector.png',
                        height: 30,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(
                      'lib/icons/mid.png',
                      height: 45,
                      width: 200,
                      color: Colors.black,
                    ),
                    const Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                    ),
                  ],
                ),
              ),

              // **Bigger Carousel with Title & Subtitle**
              CarouselSlider(
                items: bannerImages.map((banner) {
                  return Stack(
                    children: [
                      // **Background Image**
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          banner['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                      // **Gradient Overlay for Better Text Visibility**
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.5),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                      // **Title & Subtitle Text**
                      Positioned(
                        bottom: 40,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              banner['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 8,
                                    color: Colors.black54,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              banner['subtitle']!,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  autoPlayCurve: Curves.easeInOut,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              // **Category List (Circular Image + Text)**
              SizedBox(
                height: 120,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((category) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            // **Circular Image**
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                image: DecorationImage(
                                  image: AssetImage(category['image']!),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            // **Category Name**
                            Text(
                              category['name']!,
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'New Arrivals',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),

              ProductdetailCard(),
              ProductdetailCard(),

              const Padding(
                padding: EdgeInsets.all(16.0),
                child: NotesList(),
              ),

              const SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    PerfumeCard(),
                    SizedBox(height: 20),
                    NewPerfumeCollectionBanner(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: const Text(
                      'Home Fragrance',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              ProductdetailCard(),
              ProductdetailCard(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('lib/icons/ll1.png'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('lib/icons/ll2.png'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding ProductdetailCard() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: ProductCard(
                imagePath: 'lib/icons/rect1.png',
                title: 'Majesty',
                subtitle: 'EDT',
                rating: 4,
                price: '128',
                oldPrice: '160',
                discount: '20% OFF',
                isTrending: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: ProductCard(
                imagePath: 'lib/icons/rect2.png',
                title: 'Bakhoor Set',
                subtitle: 'Oud Burner',
                rating: 5,
                price: '200',
                oldPrice: '240',
                discount: '20% OFF',
                isTrending: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: ProductCard(
                imagePath: 'lib/icons/rect1.png',
                title: 'Majesty',
                subtitle: 'EDT',
                rating: 4,
                price: '128',
                oldPrice: '160',
                discount: '20% OFF',
                isTrending: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildImageContainer(String imagePath, double height, double width) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 4,
          offset: Offset(2, 2),
        ),
      ],
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.contain,
      ),
    ),
  );
}
