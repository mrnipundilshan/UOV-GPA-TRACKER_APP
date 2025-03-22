import 'package:dropdown_button2/dropdown_button2.dart';

import 'background/bg.dart';
import 'package:flutter/material.dart';

class FacSelectionPage extends StatelessWidget {
  const FacSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final List<String> Faculties = ['FAS', 'Tech', 'Bussiness Studies'];

    String? selectedValue;

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Background(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                  // the menu padding when button's width is not specified.
                  contentPadding: const EdgeInsets.symmetric(vertical: 25),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  maintainHintHeight: true,
                ),

                hint: Text(
                  'Select Your Faculty',
                  style: TextStyle(fontSize: width * 0.07),
                ),
                items:
                    Faculties.map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item, style: const TextStyle(fontSize: 14)),
                      ),
                    ).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select Faculty.';
                  }
                  return null;
                },
                onChanged: (value) {
                  //Do something when selected item is changed.
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 10),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
