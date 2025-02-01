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

  List<ProductCard> productList1 = const [
    ProductCard(
      imagePath: 'lib/icons/rect1.png',
      title: 'Majesty',
      subtitle: 'EDT',
      rating: 4,
      price: '128',
      oldPrice: '160',
      discount: '20% OFF',
      isTrending: true,
    ),
    ProductCard(
      imagePath: 'lib/icons/rect2.png',
      title: 'Bakhoor Set',
      subtitle: 'Oud Burner',
      rating: 4,
      price: '200',   
      oldPrice: '240',
      discount: '20% OFF',
      isTrending: false,
    ),
    ProductCard(
      imagePath: 'lib/icons/rect1.png',
      title: 'Majesty',
      subtitle: 'EDT',
      rating: 4,
      price: '128',
      oldPrice: '160',
      discount: '20% OFF',
      isTrending: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 65,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FilterPage()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'lib/icons/Vector.png',
              height: 30,
              color: Colors.black,
            ),
          ),
        ),
        title: Image.asset(
          'lib/icons/mid.png',
          height: 45,
          width: 200,
          color: Colors.black,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Bigger Carousel with Title & Subtitle
              CarouselSlider(
                items: bannerImages.map((banner) {
                  return Stack(
                    children: [
                      // Background Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          banner['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                      // Gradient Overlay for Better Text Visibility
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
                      // Title & Subtitle Text
                      Positioned(
                        bottom: 20,
                        left: 20,
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
                  viewportFraction: 1.0,
                  autoPlayCurve: Curves.easeInOut,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              // Category List (Circular Image + Text)
              SizedBox(
                height: 120,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1),
                            image: DecorationImage(
                              image:
                                  AssetImage(categories[index]['image'] ?? ''),
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
                        // Category Name
                        Text(
                          categories[index]['name']!,
                          style:
                              const TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 20);
                  },
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            const   Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                   alignment: Alignment.centerLeft,
                  child:  Text(
                    'New Arrivals',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              ProductBox(),
              ProductBox(),

              const Padding(
                padding: EdgeInsets.all(20.0),
                child: NotesList(),
              ),

            const  SizedBox(height: 20),
            const  PerfumeCard(),
            const  SizedBox(height: 20),
            const  NewPerfumeCollectionBanner(),
            const  SizedBox(height: 20),
             const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                   alignment: Alignment.centerLeft,
                  child:  Text(
                    'Home Fragrance',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ProductBox(),
              ProductBox(),
              LastBanner(),
            const  SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  SizedBox ProductBox() {
    return SizedBox(
              height: 290,
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final product = productList1[index];
                    return ProductCard(
                      imagePath: product.imagePath,
                      title: product.title,
                      subtitle: product.subtitle,
                      rating: product.rating,
                      price: product.price,
                      oldPrice: product.oldPrice,
                      discount: product.discount,
                      isTrending: product.isTrending,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 20);
                  },
                  itemCount: productList1.length),
            );
  }
}

class LastBanner extends StatelessWidget {
   LastBanner({
    super.key,
  });

  final List<String> image =[
        'lib/icons/ll1.png',
        'lib/icons/ll2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(image[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 15);
          },
          itemCount: 2),
    );
  }
}
