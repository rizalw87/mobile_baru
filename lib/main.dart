import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CarListPage(),
    );
  }
}

class CarListPage extends StatefulWidget {
  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  final List<Map<String, dynamic>> dummyCars = [
    {
      'name': 'Suzuki XL-7 Hybrid',
      'seats': '7-8 Seat',
      'rating': 4.9,
      'price': 'Rp 550.000',
      'image': '',
      'transmission': 'Automatic',
      'isAvailable': true,
    },
    {
      'name': 'Toyota Avanza',
      'seats': '7 Seat',
      'rating': 4.7,
      'price': 'Rp 450.000',
      'image': 'https://via.placeholder.com/150',
      'transmission': 'Manual',
      'isAvailable': true,
    },
    {
      'name': 'Honda Civic',
      'seats': '5 Seat',
      'rating': 4.5,
      'price': 'Rp 600.000',
      'image': 'https://via.placeholder.com/150',
      'transmission': 'Automatic',
      'isAvailable': false,
    },
    {
      'name': 'Inova Reborn',
      'seats': '6 Seat',
      'rating': 5.0,
      'price': 'Rp 550.000',
      'image': 'https://via.placeholder.com/150',
      'transmission': 'Automatic',
      'isAvailable': false,
    },
  ];

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final TextEditingController carNameController = TextEditingController();
  String availabilityMessage = '';
  List<Map<String, dynamic>> filteredCars = [];

  void _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime ?? TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDate = pickedDate;
          selectedTime = pickedTime;
        });
      }
    }
  }

  void _searchCar() {
    final inputName = carNameController.text.trim().toLowerCase();
    setState(() {
      filteredCars = dummyCars
          .where((car) =>
              car['name'].toString().toLowerCase().contains(inputName))
          .toList();

      if (filteredCars.isNotEmpty) {
        final car = filteredCars[0];
        if (car['isAvailable']) {
          availabilityMessage = 'The car is available! Book now!';
        } else {
          availabilityMessage =
              'Sorry, this car is unavailable. Check other options!';
        }
      } else {
        availabilityMessage =
            'Sorry, this car is unavailable. Check other options!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = 'Date & Time';
    if (selectedDate != null && selectedTime != null) {
      final dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTime!.hour,
        selectedTime!.minute,
      );
      formattedDate = DateFormat('M/d/yyyy – hh:mm a').format(dateTime);
    }

    final isSearching = carNameController.text.isNotEmpty;

    final displayCars = isSearching
        ? filteredCars
        : dummyCars.where((car) => car['isAvailable'] == true).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Car List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF316783),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDateTime(context),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: Color(0xFF9DAFB9),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date & Time",
                                style: TextStyle(color: Colors.white70)),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                formattedDate,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: Color(0xFF9DAFB9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Search car",
                              style: TextStyle(color: Colors.white70)),
                          TextField(
                            controller: carNameController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Type car name',
                              hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            onChanged: (text) {
                              _searchCar();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: _searchCar,
                  ),
                ],
              ),
            ),
          ),
          if (availabilityMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  availabilityMessage,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF316783),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: displayCars.length,
              itemBuilder: (context, index) {
                final car = displayCars[index];

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFF316783), width: 2),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      car['name'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF316783),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(Icons.event_seat, size: 16),
                                        SizedBox(width: 4),
                                        Text(car['seats'],
                                            style: TextStyle(
                                                color: Color(0xFF316783))),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star_border, size: 16),
                                        SizedBox(width: 4),
                                        Text('${car['rating']} Ratings',
                                            style: TextStyle(
                                                color: Color(0xFF316783))),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.credit_card, size: 16),
                                        SizedBox(width: 4),
                                        Text(car['price'],
                                            style:
                                                TextStyle(color: Colors.orange)),
                                        SizedBox(width: 4),
                                        Text('/day',
                                            style: TextStyle(
                                                color: Color(0xFF316783))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                constraints:
                                    BoxConstraints(maxWidth: 100, minHeight: 30),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    car['transmission'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            child: Image.network(
                              car['image'],
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.car_rental, size: 60),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
