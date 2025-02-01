import 'package:flutter/material.dart';
import 'package:flutter_assignment/cart_provider.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final int rating;
  final String price;
  final String oldPrice;
  final String discount;
  final bool isTrending;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.isTrending,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final quantity = cartProvider.getQuantity(title);

    return Container(
      width: 160,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFF5F5F5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(imagePath,
                          height: 100, width: 100, fit: BoxFit.fill),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isTrending)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Color(0xFFF8C6B8),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Trending',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    Spacer(),
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.black54,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                  rating,
                  (index) =>
                      const Icon(Icons.star, color: Colors.black, size: 14),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  discount,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF902044)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Row(
            children: [
              Text(
                'KWD $price',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Text(
                'KWD $oldPrice',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          quantity == 0
              ? GestureDetector(
                  onTap: () {
                    cartProvider.addItem(title);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart,
                            color: Colors.white, size: 16),
                        SizedBox(width: 5),
                        Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          cartProvider.removeItem(title);
                        },
                        child: const Icon(Icons.remove,
                            size: 18, color: Colors.black),
                      ),
                      Text(
                        '$quantity',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          cartProvider.addItem(title);
                        },
                        child: const Icon(Icons.add,
                            size: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
