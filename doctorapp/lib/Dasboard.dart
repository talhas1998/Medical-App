import 'package:doctorapp/Descriptionscreen.dart';
import 'package:doctorapp/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String? userName = "Guest";
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('RegisterUsers')
            .doc(user.uid)
            .get();

        print(snapshot);
        if (snapshot.exists) {
          setState(() {
            userName = snapshot['name'] ?? "Guest";
          });
        } else {
          print("User document does not exist!");
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  void _onItemTapped(int index) {
    if (index == 4) {
      // Profile tab index
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyProfileView()),
      );
    } else {
      setState(() {
        _selectedIndex = index; // Update selected index for other tabs
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 210,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: Icon(
                              size: 30,
                              Icons.add,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hi, $userName',
                        style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'Arial',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Welcome to Quick Medical Store',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Arial',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(1.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText:
                                  'Search Medicines & Health Care Products',
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.grey),
                              border:
                                  InputBorder.none, // Remove default outline
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Top Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customCircularAvatar(Colors.pinkAccent, 25, 'Dental'),
                        customCircularAvatar(
                            Colors.greenAccent, 25, 'Wellness'),
                        customCircularAvatar(Colors.blueAccent, 25, 'Homeo'),
                        customCircularAvatar(Colors.black, 25, 'Eye Care'),
                        customCircularAvatar(
                            Colors.greenAccent, 25, 'Skincare'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  child: Container(
                    height: screenheight * 0.25,
                    width: screenwidth * 1,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 125, 170, 248),
                      image: const DecorationImage(
                          image:
                              AssetImage('assets/images/pharmacy_image.jpeg'),
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Deals of the Day',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'More',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: screenheight * 0.5 * 0.5,
              width: screenwidth * 2 * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'New Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

Widget customCircularAvatar(Color backgroundColor, double radius, String text) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: backgroundColor,
        radius: radius,
      ),
      const SizedBox(
        height: 5,
      ),
      Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Arial',
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    ],
  );
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/pills_bottle_mockup.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Product title
            const Text(
              'Accu-check Active',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            // Product subtitle
            const Text(
              'Test Strip',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            // Product price
            const Text(
              'Rs.112',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            // const Spacer(),
            // Star and rating at the bottom
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DescriptionScreen()),
                        );
                      },
                      icon: (const Icon(
                        Icons.add,
                        color: Colors.black,
                      )),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
