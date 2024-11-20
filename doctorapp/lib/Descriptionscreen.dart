import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctorapp/CartScreen.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/sucral1.jpg',
      'assets/images/sucral2.jpg',
      'assets/images/sucral3.jpeg',
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
        actions: const [
          Icon(Icons.notification_important),
          SizedBox(width: 16),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.shopping_cart_checkout),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Title and Description
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sugar Free Gold Low Calories",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Verdana',
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Etiam mollis metus non purus",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Verdana',
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),

                // Image Carousel
                Container(
                  color: Colors.white,
                  child: CarouselSlider(
                    items: images.map((imageUrl) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.fill,
                          // width: MediaQuery.of(context).size.width,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 150,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Price and Add to Cart
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "RS. 99 ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              text: " RS. 55",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.add_box_outlined,
                                color: Colors.blue, size: 20),
                            SizedBox(width: 5),
                            Text(
                              "Add to Cart",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(color: Colors.grey, thickness: 1, height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Package Size",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Verdana',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 90,
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 220, 154),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.fromBorderSide(
                                  BorderSide(
                                    color: Color.fromARGB(255, 255, 205, 42),
                                    width: 3.0,
                                  ),
                                ),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rs. 106",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Verdana',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "50 pellets",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 90,
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 228, 226, 226),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rs. 166",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Verdana',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "110 pellets",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 90,
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 228, 226, 226),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rs. 252",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Verdana',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "300 pellets",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.grey, thickness: 1, height: 30),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Details",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Verdana',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Interdum et malesuada fames ac ante ipsum primis in faucibus. "
                        "Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, "
                        "pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus.",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Verdana',
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.justify,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.grey, thickness: 1, height: 30),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ingredients",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Verdana',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi."
                        "Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. "
                        "Etiam et nisi aliquet, accumsan nisi sit.",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Verdana',
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.justify,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Expiry Date:",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "\u00A0\u00A0\u00A0\u00A0",
                              style: TextStyle(fontSize: 14),
                            ),
                            TextSpan(
                              text: "25/12/2023",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Brand Name:",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "\u00A0\u00A0\u00A0\u00A0",
                              style: TextStyle(fontSize: 14),
                            ),
                            TextSpan(
                              text: "Something",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Average Rating Section
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Average Rating Number
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "4.4",
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16),
                          // Star Rating and Description
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Star Rating Row
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 24),
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 24),
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 24),
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 24),
                                  Icon(Icons.star_half,
                                      color: Colors.amber, size: 24),
                                ],
                              ),
                              SizedBox(height: 8),

                              Text(
                                "923 Ratings and 257 Reviews",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Column(
                        children: [
                          _buildRatingRow(5, 67),
                          _buildRatingRow(4, 20),
                          _buildRatingRow(3, 7),
                          _buildRatingRow(2, 0),
                          _buildRatingRow(1, 2),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.star,
                                        color: Colors.amber, size: 24),
                                  ),
                                  TextSpan(
                                    text: " 4.2",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "05-oct-2020",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Erric Hoffman",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Verdana',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi."
                              "Nunc risus massa, gravida id egestas ",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Verdana',
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.justify,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddtoCartView()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .blue, // Correct placement of backgroundColor
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 40,
                          ),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRatingRow(int star, int percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 4),
              Text(
                "$star",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
              minHeight: 8,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            "$percentage%",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
