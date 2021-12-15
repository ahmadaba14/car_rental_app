import 'package:car_rental_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({Key? key}) : super(key: key);

  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  final _formKey = GlobalKey<FormState>();

  final carManufacturerController = new TextEditingController();
  final carModelController = new TextEditingController();
  final modelYearController = new TextEditingController();
  final seatingCapacityController = new TextEditingController();
  final carTypeController = new TextEditingController();
  final carMileageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final carManufacturerField = TextFormField(
      controller: carManufacturerController,
      decoration: InputDecoration(labelText: 'Car Manufacturer'),
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Car Manufacturer is Required';
        }
        return null;
      },
      onSaved: (value) {
        carManufacturerController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    final carModelField = TextFormField(
      controller: carModelController,
      decoration: InputDecoration(labelText: 'Car Model'),
      maxLength: 20,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Car Model is Required';
        }
        return null;
      },
      onSaved: (value) {
        carModelController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    final modelYearField = TextFormField(
      controller: modelYearController,
      decoration: InputDecoration(labelText: 'Model Year'),
      keyboardType: TextInputType.number,
      maxLength: 4,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Model Year is Required';
        }
        return null;
      },
      onSaved: (value) {
        modelYearController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    final seatingCapacityField = TextFormField(
      controller: seatingCapacityController,
      decoration: InputDecoration(labelText: 'Seating Capacity'),
      keyboardType: TextInputType.number,
      maxLength: 1,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Seating Capacity is Required';
        }
        return null;
      },
      onSaved: (value) {
        seatingCapacityController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    final carTypeField = TextFormField(
      controller: seatingCapacityController,
      decoration: InputDecoration(labelText: 'Car Type'),
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Car Type is Required';
        }
        return null;
      },
      onSaved: (value) {
        carTypeController.text = value!;
      },
      textInputAction: TextInputAction.next,
    );

    final carMileageField = TextFormField(
      controller: carMileageController,
      decoration: InputDecoration(labelText: 'Car Mileage'),
      keyboardType: TextInputType.number,
      maxLength: 6,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Car Type is Required';
        }
        return null;
      },
      onSaved: (value) {
        carMileageController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );

    final AddCarButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: Text(
          "Add Car",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomText(
                  text: "Add Car for Rent",
                  alignment: Alignment.topCenter,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 20),
                carManufacturerField,
                carModelField,
                modelYearField,
                seatingCapacityField,
                carTypeField,
                carMileageField,
                SizedBox(height: 20),
                AddCarButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
