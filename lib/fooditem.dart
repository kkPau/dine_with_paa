import 'package:flutter/material.dart';

class FoodItem extends StatefulWidget {
  final String name;
  final String? side;
  final List prices;
  final String image;
  final String category;
  const FoodItem({
    required this.name,
    required this.side,
    required this.image,
    required this.prices,
    required this.category,
    super.key,
  });

  @override
  State<FoodItem> createState() => _FoodItemState();
}

int quantity = 0;

int totalprice = 0;

String selectedSize = "Regular";
int selected = 0;

class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    final phoneWidth = MediaQuery.of(context).size.width;
    final phoneHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(
      //   title: const FittedBox(
      //       fit: BoxFit.scaleDown,
      //       child: Text(
      //         "Place Order",
      //         style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
      //       )),
      //   centerTitle: true,
      //   toolbarHeight: phoneHeight * 0.2,
      // ),
      body: Container(
        height: phoneHeight,
        width: phoneWidth,
        child: Stack(
          children: [
            Container(
              height: phoneHeight * 0.6,
              width: phoneWidth,
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: phoneHeight * 0.55,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.05),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                height: phoneHeight * 0.45,
                width: phoneWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: phoneHeight * 0.05),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w900),
                      ),
                    ),
                    SizedBox(height: phoneHeight * 0.007),
                    widget.side != ""
                        ? FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.side!,
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                          )
                        : Container(),
                    SizedBox(height: phoneHeight * 0.03),
                    const Text(
                      "Sizes",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: phoneHeight * 0.01),
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = "Regular";
                              selected = 0;
                            });
                          },
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: phoneHeight * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: selectedSize == "Regular"
                                          ? const Color.fromRGBO(211, 47, 47, 1)
                                          : Colors.black)),
                              alignment: Alignment.center,
                              child: Text(
                                "Regular",
                                style: TextStyle(
                                    color: selectedSize == "Regular"
                                        ? Colors.red[700]
                                        : Colors.black),
                              )),
                        )),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = "Jumbo";
                              selected = 1;
                            });
                          },
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.symmetric(
                                  vertical: phoneHeight * 0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: selectedSize == "Jumbo"
                                          ? const Color.fromRGBO(211, 47, 47, 1)
                                          : Colors.black)),
                              alignment: Alignment.center,
                              child: Text(
                                "Jumbo",
                                style: TextStyle(
                                    color: selectedSize == "Jumbo"
                                        ? Colors.red[700]
                                        : Colors.black),
                              )),
                        )),
                      ],
                    ),
                    SizedBox(height: phoneHeight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Price:",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          children: [
                            const Text(
                              "₵",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: phoneWidth * 0.007),
                            Text(
                              selectedSize == "Regular"
                                  ? widget.prices[0].toString()
                                  : widget.prices[1].toString(),
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w900),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: phoneHeight * 0.03),
                    Container(
                      alignment: Alignment.center,
                      width: phoneWidth,
                      padding:
                          EdgeInsets.symmetric(vertical: phoneHeight * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red[700],
                      ),
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Add to Cart ( ₵ ${totalprice.toString()} )",
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: phoneHeight * 0.52,
              left: phoneWidth * 0.3,
              child: Container(
                height: phoneHeight * 0.05,
                width: phoneWidth * 0.4,
                decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantity > 1) {
                                quantity--;
                                totalprice -= widget.prices[selected] as int;
                              }
                            });
                            print(widget.prices[selected]);
                            // if (quantity > 0) {
                            //   totalprice -= int.parse(widget.prices[selected]);
                            // }
                          },
                          child: const Icon(Icons.remove, color: Colors.white)),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity++;
                              totalprice += widget.prices[selected] as int;
                            });
                            print(widget.prices[selected]);
                          },
                          child: const Icon(Icons.add, color: Colors.white))
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
