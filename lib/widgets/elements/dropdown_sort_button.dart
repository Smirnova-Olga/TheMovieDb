import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

const List<String> list = <String>[
  'Онлайн',
  'По ТВ',
  'Напрокат',
  'В кинотеатрах'
];

class DropdownSortButton extends StatefulWidget {
  const DropdownSortButton({super.key});

  @override
  State<DropdownSortButton> createState() => _DropdownSortButtonState();
}

class _DropdownSortButtonState extends State<DropdownSortButton> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      underline: const SizedBox(),
      isExpanded: true,
      value: dropdownValue,
      buttonHeight: 40,
      buttonWidth: 160,
      autofocus: false,
      buttonDecoration: BoxDecoration(
        color: AppColors.mainDarkBlue,
        borderRadius: BorderRadius.circular(30.0),
      ),
      dropdownWidth: 180,
      dropdownPadding: EdgeInsets.zero,
      dropdownScrollPadding: EdgeInsets.zero,
      dropdownElevation: 0,
      itemPadding: EdgeInsets.zero,
      offset: const Offset(-2.1, 40.3),
      itemHeight: 40,
      focusColor: Colors.transparent,
      selectedItemHighlightColor: null,
      dropdownDecoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromARGB(255, 0, 238, 206),
              Color.fromARGB(255, 216, 255, 248)
            ]),
        borderRadius: BorderRadius.circular(26.0),
        border: Border.all(
          color: AppColors.mainDarkBlue,
          width: 1,
        ),
      ),
      icon: const SizedBox.shrink(),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String itemvalue) {
        if (itemvalue == dropdownValue) {
          return DropdownMenuItem(
            value: itemvalue,
            child: Container(
              width: double.infinity,
              height: 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.mainDarkBlue,
              ),
              child: Row(
                children: [
                  Text(
                    itemvalue,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        } else {
          return DropdownMenuItem(
            value: itemvalue,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                itemvalue,
                style: const TextStyle(color: AppColors.mainDarkBlue),
                textAlign: TextAlign.start,
              ),
            ),
          );
        }
      }).toList(),
    );
  }
}


// width: 180,
//               height: 40,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 color: AppColors.mainDarkBlue,