import 'package:car_rental_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const List<String> categories = <String>[
    'SUV',
    'Sedan',
    'Pickup',
    'Micro',
    'Coupe',
    'Minivan'
  ];

  static const List<String> cars = <String>[
    'Honda Civic',
    'Toyota Corolla',
    'Honda City',
    'Toyota Aqua',
  ];

  static const List<String> city = <String>[
    'Islamabad',
    'Karachi',
    'Lahore',
    'Peshawar',
  ];

  static const List<int> prices = <int>[
    5000,
    4000,
    6000,
    7000,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  _searchTextFormField(),
                  SizedBox(width: 5),
                  _searchFilterButton(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: "Car Types",
              ),
              SizedBox(
                height: 20,
              ),
              _listViewCategory(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "You Might Like",
                  ),
                  CustomText(
                    text: "Browse all",
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              _listViewProducts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchTextFormField() {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 10),
          hintText: "Search Car",
          fillColor: Colors.grey.shade200,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  Widget _searchFilterButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.filter_alt_outlined, color: Colors.blueAccent),
      ),
    );
  }

  Widget _listViewCategory() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade100,
                ),
                height: 60,
                width: 60,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("images/icons/SUV.png")),
              ),
              SizedBox(
                height: 10,
              ),
              Text("${categories[index]}"),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return Container(
      height: 350,
      child: ListView.separated(
        itemCount: cars.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100,
                    ),
                    child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Image.asset(
                          "images/Car.jpg",
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "${cars[index]}",
                    alignment: Alignment.bottomLeft,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: "${city[index]}",
                    color: Colors.grey,
                    alignment: Alignment.bottomLeft,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: "Rs. ${prices[index].toString()}/d",
                    color: Colors.purple,
                    alignment: Alignment.bottomLeft,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }
}
