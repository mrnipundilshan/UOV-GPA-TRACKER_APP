import 'package:dropdown_button2/dropdown_button2.dart';

import 'background/bg.dart';
import 'package:flutter/material.dart';

class FacSelectionPage extends StatefulWidget {
  const FacSelectionPage({super.key});

  @override
  State<FacSelectionPage> createState() => _FacSelectionPageState();
}

class _FacSelectionPageState extends State<FacSelectionPage> {
  final List<String> faculties = <String>['FAS', 'Tech', 'Bussiness Studies'];
  String? selectedFac;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: DropdownButton2<String>(
                underline: SizedBox.shrink(),
                hint: Text(
                  'Select Faculty',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),

                items:
                    faculties
                        .map(
                          (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                value: selectedFac,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFac = newValue!;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 45, 100, 107),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 60,
                  elevation: 1,
                ),

                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.arrow_forward_ios_outlined),
                  iconSize: 14,
                  iconDisabledColor: Colors.white,
                  iconEnabledColor: Colors.white,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color.fromARGB(255, 48, 131, 151),
                  ),
                  offset: const Offset(0, 0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
