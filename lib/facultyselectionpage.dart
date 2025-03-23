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
  final Map<String, List<String>> courses = {
    'FAS': ['IT', 'BIO', 'AMC', 'CS'],
    'Tech': ['Engineering', 'Computer Science', 'Electronics'],
    'Bussiness Studies': ['Marketing', 'Finance', 'Management'],
  };

  String? selectedFac;
  String? selectedCourse;
  List<String> availableCourses = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: height * 0.05),
            Column(
              children: [
                DropdownButton2<String>(
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
                      selectedCourse = null; // Reset course selection
                      availableCourses =
                          courses[selectedFac] ??
                          []; // Update available courses
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 45, 100, 107),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: height * 0.07,
                    width: width * 0.5,
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

                SizedBox(height: height * 0.05),

                DropdownButton2<String>(
                  underline: SizedBox.shrink(),
                  hint: Text(
                    'Select Course',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),

                  items:
                      availableCourses
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
                  value: selectedCourse,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCourse = newValue!;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 45, 100, 107),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    height: height * 0.07,
                    width: width * 0.5,
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
              ],
            ),

            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
