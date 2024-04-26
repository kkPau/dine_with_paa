// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dine_with_paa/fooditem.dart';
import 'package:dine_with_paa/auth/loginpage.dart';
import 'package:dine_with_paa/pages/cartpage.dart';
import 'package:dine_with_paa/pages/orderpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List categories = [
  "ALL",
  "MAIN",
  "EXTRAS",
  "STEWS",
];

final List<Map<String, dynamic>> food = [
  {
    'name': "Jollof Rice And Chicken",
    'image': "assets/Dine with Paa/IMG_9011.JPG",
    'side': "With Kelewele",
    'price': [35, 40],
    'category': "Main",
  },
  {
    'name': "Fried Rice And Chicken",
    'image': "assets/Dine with Paa/IMG_0495.JPG",
    'side': "With Kelewele",
    'price': [35, 40],
    'category': "Main",
  },
  {
    'name': "Spicy Indomie with egg and sausages",
    'image': "assets/indomie.jpeg",
    'side': "With Chicken",
    'price': [35, 45],
    'category': "Main",
  },
  {
    'name': "Kelewele",
    'image': "assets/kelewele.jpg",
    'side': "",
    'price': [10, 15],
    'category': "Extra",
  },
  {
    'name': "Chicken",
    'image': "assets/chicken.jpeg",
    'side': "",
    'price': [10, 15],
    'category': "Extra",
  },
  {
    'name': "Tomato Stew",
    'image': "assets/tomato.jpeg",
    'side': "With Chicken",
    'price': [50, 80],
    'category': "Stew",
  },
  {
    'name': "Kontomire Stew",
    'image': "assets/kontomire.jpeg",
    'side': "With Tuna",
    'price': [50, 80],
    'category': "Stew",
  }
];

int selectedcat = 0;

Widget catDisplay(double width, double height) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        itemCount: food.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: height * 0.30),
        itemBuilder: (context, index) {
          if (food.isNotEmpty) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FoodItem(
                  name: food[index]['name'],
                  side: food[index]['side'],
                  image: food[index]['image'],
                  prices: food[index]['price'],
                  category: food[index]['category'],
                ),
              )),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: height,
                      width: width,
                      child: Image.asset(
                        food[index]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.08,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black54,
                    ),
                    width: width,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(food[index]['name'],
                              style: const TextStyle(color: Colors.white)),
                          Text(food[index]['side'],
                              style: TextStyle(color: Colors.grey[400]))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return CircularProgressIndicator(color: Colors.red[700]);
        },
      ),
    ),
  );
}

Widget mainDisplay(double width, double height) {
  final List foods =
      food.where((element) => element["category"] == "Main").toList();
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        itemCount: foods.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: height * 0.30),
        itemBuilder: (context, index) {
          if (food.isNotEmpty) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FoodItem(
                    name: foods[index]['name'],
                    side: foods[index]['side'],
                    image: foods[index]['image'],
                    prices: foods[index]['price'],
                    category: foods[index]['category']),
              )),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: height,
                      width: width,
                      child: Image.asset(
                        foods[index]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.08,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black54,
                    ),
                    width: width,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(foods[index]['name'],
                              style: const TextStyle(color: Colors.white)),
                          Text(foods[index]['side'],
                              style: TextStyle(color: Colors.grey[400]))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return CircularProgressIndicator(color: Colors.red[700]);
        },
      ),
    ),
  );
}

Widget extraDisplay(double width, double height) {
  final List foods =
      food.where((element) => element["category"] == "Extra").toList();
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        itemCount: foods.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: height * 0.30),
        itemBuilder: (context, index) {
          if (food.isNotEmpty) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FoodItem(
                    name: foods[index]['name'],
                    side: foods[index]['side'],
                    image: foods[index]['image'],
                    prices: foods[index]['price'],
                    category: foods[index]['category']),
              )),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: height,
                      width: width,
                      child: Image.asset(
                        foods[index]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.08,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black54,
                    ),
                    width: width,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(foods[index]['name'],
                              style: const TextStyle(color: Colors.white)),
                          Text(foods[index]['side'],
                              style: TextStyle(color: Colors.grey[400]))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return CircularProgressIndicator(color: Colors.red[700]);
        },
      ),
    ),
  );
}

Widget stewDisplay(double width, double height) {
  final List foods =
      food.where((element) => element["category"] == "Stew").toList();
  return Expanded(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        itemCount: foods.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: height * 0.30),
        itemBuilder: (context, index) {
          if (food.isNotEmpty) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FoodItem(
                    name: foods[index]['name'],
                    side: foods[index]['side'],
                    image: foods[index]['image'],
                    prices: foods[index]['price'],
                    category: foods[index]['category']),
              )),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: height,
                      width: width,
                      child: Image.asset(
                        foods[index]['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.08,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black54,
                    ),
                    width: width,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(foods[index]['name'],
                              style: const TextStyle(color: Colors.white)),
                          Text(foods[index]['side'],
                              style: TextStyle(color: Colors.grey[400]))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return CircularProgressIndicator(color: Colors.red[700]);
        },
      ),
    ),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: phoneHeight * 0.2,
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            Container(
              height: phoneHeight * 0.3,
              width: phoneWidth * 0.3,
              child: Image.asset("assets/Dine with Paa/IMG_5057.JPG"),
            ),
            // SizedBox(width: phoneWidth * 0.01),
            const Text("Dine with Paa"),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Container(
            width: phoneWidth,
            height: phoneHeight,
            child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Hello",
                          style: TextStyle(
                              fontSize: 45, fontWeight: FontWeight.w900),
                        ),
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("Users")
                            .doc(user?.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final userData = snapshot.data!.data();
                            return Text(
                              userData!["name"],
                              style: TextStyle(fontSize: 20),
                            );
                          }
                          return CircularProgressIndicator(
                            color: Colors.red[700],
                          );
                        },
                      ),
                      SizedBox(height: phoneHeight * 0.2),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: phoneWidth,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CartPage(),
                            ));
                          },
                          child: const Text(
                            "Cart",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: phoneWidth,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const OrderPage(),
                            ));
                          },
                          child: const Text(
                            "Orders",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(height: phoneHeight * 0.3),
                      Container(
                        width: phoneWidth,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              builder: (context) => AlertDialog(
                                content: const Text(
                                    "Are you sure you want to logout?"),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text("Cancel")),
                                  TextButton(
                                      onPressed: () async {
                                        await FirebaseAuth.instance.signOut();
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage(),
                                                ),
                                                (route) => false);
                                      },
                                      child: const Text("Yes")),
                                ],
                              ),
                              context: context,
                            );
                          },
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container(
                    width: phoneWidth,
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
      body: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: phoneHeight * 0.03),
            Container(
              height: phoneHeight * 0.07,
              width: phoneWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: phoneWidth * 0.13),
                    child: GestureDetector(
                      onTap: () => setState(() {
                        selectedcat = index;
                      }),
                      child: Column(
                        children: [
                          Text(
                            categories[index],
                            style: TextStyle(
                                color: selectedcat == index
                                    ? Colors.red[700]
                                    : Colors.black),
                          ),
                          SizedBox(height: phoneHeight * 0.01),
                          selectedcat == index
                              ? Icon(Icons.circle,
                                  size: 20, color: Colors.red[700])
                              : Container(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: phoneHeight * 0.03),
            selectedcat == 0
                ? catDisplay(phoneWidth, phoneHeight)
                : Container(),
            selectedcat == 1
                ? mainDisplay(phoneWidth, phoneHeight)
                : Container(),
            selectedcat == 2
                ? extraDisplay(phoneWidth, phoneHeight)
                : Container(),
            selectedcat == 3
                ? stewDisplay(phoneWidth, phoneHeight)
                : Container(),
          ],
        ),
      ),
    );
  }
}
