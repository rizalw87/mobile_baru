import 'package:coba_project/main/pages1.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCarSelected = true;

  final List<Map<String, String>> availableCars = [
    {
      'name': 'Toyota HiAce Premio 2019',
      'rating': '4.8',
      'price': 'Rp 1.000.000',
      'transmission': 'Automatic',
      'image': 'assets/suzuki1.jpg',
    },
    {
      'name': 'N-Max',
      'rating': '4.8',
      'price': 'Rp 350.000',
      'transmission': 'Automatic',
      'image': 'assets/n-max.jpg',
    },
  ];

  Widget buildAvailableVehicleList(bool isCar) {
    final list = availableCars; // nanti bisa dibedain kalau motor juga ada
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isCar ? "Available Car" : "Available Motorbikes",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E5A72),
            ),
          ),
          SizedBox(height: 12),
          ...list.map((vehicle) => buildVehicleCard(vehicle)).toList(),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF6A442),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: Text(
                "See All",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildVehicleCard(Map<String, String> vehicle) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height:
          140, // beri tinggi tetap agar Stack bisa menempatkan Positioned dengan tepat
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF2E5A72)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vehicle['name'] ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF2E5A72),
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.star_border, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            "${vehicle['rating']} Ratings",
                            style: TextStyle(
                                color: Color(0xFF2E5A72),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined,
                              size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            "${vehicle['price']} /day",
                            style: TextStyle(
                                color: Color(0xFF2E5A72),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    vehicle['image'] ?? '',
                    width: 100,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          // Ini dia! Transmission label di pojok kiri bawah
          SizedBox(
            height: 8,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFF2E5A72),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Text(
                vehicle['transmission'] ?? '',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(width: 10),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8),
          //   child: Image.asset(
          //     vehicle['image'] ?? '',
          //     width: 100,
          //     height: 70,
          //     fit: BoxFit.cover,
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF2D6A78),
        title: Text("RENTAL BANG"),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // HEADER
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                color: Color(0xFF2D6A78), // warna biru tua
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, color: Colors.white, size: 28),
                    RichText(
                      text: TextSpan(
                        text: 'Hai, ',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        children: [
                          TextSpan(
                            text: 'Aloy!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Icon(Icons.search, color: Colors.white),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // BANNER GAMBAR
              Container(
                margin: EdgeInsets.all(16),
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/adventure1.jpg'), // ganti sesuai file kamu
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Adventure Awaits!",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // SEARCH CARD
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF4F7F8D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFF7E9BA5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.directions_car, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  "Suzuki XL-7",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFF7E9BA5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_today,
                                    color: Colors.white, size: 18),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "3/17/2025 - 11:00 AM",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Start your best car search here!",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Pages1(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF6A442),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "Check Availability",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_forward, size: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // TAB BUTTON + Most Popular Text
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isCarSelected = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isCarSelected
                                  ? Color(0xFFE0ECF4)
                                  : Colors.white,
                              foregroundColor: Color(0xFF2E5A72),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                            child: Text(
                              "Car",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isCarSelected
                                    ? Color(0xFF2E5A72)
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isCarSelected = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: !isCarSelected
                                  ? Color(0xFFE0ECF4)
                                  : Colors.white,
                              foregroundColor: Colors.black,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                            child: Text(
                              "Motorbikes",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: !isCarSelected
                                    ? Color(0xFF2E5A72)
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      isCarSelected
                          ? "Most Popular Car"
                          : "Most Popular Motorbikes",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E5A72),
                      ),
                    ),
                  ],
                ),
              ),

              // MOST POPULAR SECTION
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    isCarSelected ? popularCarCard() : popularMotorbikeCard(),
                  ],
                ),
              ),
              buildAvailableVehicleList(isCarSelected),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget popularCarCard() {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xFF4F7F8D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/suzuki1.jpg',
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Suzuki XL-7 Hybrid",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  "3/20/2025 – 12:00 PM",
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star_border, color: Colors.white),
                    SizedBox(width: 4),
                    Text("4.9 Ratings", style: TextStyle(color: Colors.white)),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFF6A442),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.arrow_forward, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget popularMotorbikeCard() {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xFF4F7F8D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/suzuki1.jpg',
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yamaha NMAX",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  "3/22/2025 – 10:00 AM",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star_border, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      "4.8 Ratings",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFF6A442),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.arrow_forward, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
