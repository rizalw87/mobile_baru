import 'package:flutter/material.dart';

// Enum status order
enum OrderStatus { booking, ongoing, completed, canceled }

// Model data order
class OrderData {
  final OrderStatus status;
  final String carName;
  final String location;
  final String dateRange;
  final String price;

  OrderData({
    required this.status,
    required this.carName,
    required this.location,
    required this.dateRange,
    required this.price,
  });
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Widget _buildOrderList() {
    List<OrderData> filteredOrders =
        orders.where((order) => order.status == selectedStatus).toList();

    return Column(
      children: filteredOrders.map((order) => _buildOrderCard(order)).toList(),
    );
  }

  Widget _buildOrderCard(OrderData order) {
    String buttonText = "";
    Color buttonColor = Color(0xFF2E5A72);

    switch (order.status) {
      case OrderStatus.booking:
        buttonText = "View Details";
        buttonColor = Color(0xFF2E5A72);
        break;
      case OrderStatus.ongoing:
        buttonText = "Rental Info";
        buttonColor = Color(0xFF2E5A72);
        break;
      case OrderStatus.completed:
        buttonText = "View Receipt";
        buttonColor = Color(0xFF2E5A72);
        break;
      case OrderStatus.canceled:
        buttonText = "Canceled";
        buttonColor = Colors.red;
        break;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF2E5A72), width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            // Isi teks
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.directions_car,
                      color: Colors.grey[500],
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Car Rental - With Driver",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E5A72),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  order.carName,
                  style: TextStyle(
                    color: Color(0xFF2E5A72),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "${order.location} - ${order.dateRange}",
                  style: TextStyle(
                    color: Color(0xFF2E5A72),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Total",
                  style: TextStyle(color: Color(0xFF2E5A72)),
                ),
                SizedBox(height: 2),
                Text(
                  order.price,
                  style: TextStyle(color: Colors.yellow[700]),
                ),
                SizedBox(height: 20), // Tambahan ruang untuk tombol kanan bawah
              ],
            ),

            // Tombol pojok kanan bawah dengan animasi
            Positioned(
              bottom: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  onTap: () {
                    // Logika klik tombol
                    switch (order.status) {
                      case OrderStatus.booking:
                        print("View Details diklik");
                        break;
                      case OrderStatus.ongoing:
                        print("Rental Info diklik");
                        break;
                      case OrderStatus.completed:
                        print("View Receipt diklik");
                        break;
                      case OrderStatus.canceled:
                        print("Pesanan dibatalkan, tidak ada action");
                        break;
                    }
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusButton(String text, OrderStatus status) {
    bool isSelected = selectedStatus == status;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? Color(0xFF2F6C8D) : Colors.blueGrey.shade100,
        foregroundColor: isSelected ? Colors.white : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          selectedStatus = status;
        });
      },
      child: Text(text),
    );
  }

  OrderStatus selectedStatus = OrderStatus.booking; // Default tampil ongoing

  List<OrderData> orders = [
    OrderData(
      status: OrderStatus.booking,
      carName: 'Suzuki XL-7 Hybrid',
      location: 'Perum ABC blok u17, Lumajang',
      dateRange: '17 March 2025 - 20 March 2025',
      price: 'Rp 2.025.000',
    ),
    OrderData(
      status: OrderStatus.ongoing,
      carName: 'Suzuki XL-7 Hybrid',
      location: 'Perum ABC blok u17, Lumajang',
      dateRange: '17 March 2025 - 20 March 2025',
      price: 'Rp 2.025.000',
    ),
    OrderData(
      status: OrderStatus.completed,
      carName: 'Suzuki XL-7 Hybrid',
      location: 'Perum ABC blok u17, Lumajang',
      dateRange: '17 March 2025 - 20 March 2025',
      price: 'Rp 2.025.000',
    ),
    OrderData(
      status: OrderStatus.canceled,
      carName: 'Suzuki XL-7 Hybrid',
      location: 'Perum ABC blok u17, Lumajang',
      dateRange: '17 March 2025 - 20 March 2025',
      price: 'Rp 2.025.000',
    ),
  ];

  int selectedTab = 0;

  final List<String> tabs = ["Booking", "Ongoing", "Completed", "Canceled"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'My Order',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF2E5A72),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Tab Bar
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Color(0xFF2E5A72),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      tabs.length,
                      (index) {
                        bool IsSelected = selectedTab == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = index;
                              // Update selectedStatus juga biar filter jalan
                              selectedStatus = OrderStatus.values[index];
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: IsSelected
                                  ? Colors.grey.withOpacity(0.8)
                                  : Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                color: IsSelected
                                    ? Colors.white
                                    : Colors.grey.shade400,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Card pesanan
                SizedBox(height: 20),
                _buildOrderList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
