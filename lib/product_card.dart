import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
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
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // **Trending Tag**
          if (widget.isTrending)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.brown.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Trending',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown),
              ),
            ),

          const SizedBox(height: 5),

          // **Product Image**
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:
                Image.asset(widget.imagePath, height: 100, fit: BoxFit.contain),
          ),

          const SizedBox(height: 5),

          // **Rating & Discount Badge**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // **Black Stars**
              Row(
                children: List.generate(
                  widget.rating,
                  (index) =>
                      const Icon(Icons.star, color: Colors.black, size: 14),
                ),
              ),
              // **Discount Badge**
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  widget.discount,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          // **Product Title & Subtitle**
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),

          const SizedBox(height: 5),

          // **Price**
          Row(
            children: [
              Text(
                'KWD ${widget.price}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              Text(
                'KWD ${widget.oldPrice}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // **Add to Cart Button OR Quantity Selector**
          quantity == 0
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      quantity = 1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
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
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (quantity > 1) {
                              quantity--;
                            } else {
                              quantity = 0;
                            }
                          });
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
                          setState(() {
                            quantity++;
                          });
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
