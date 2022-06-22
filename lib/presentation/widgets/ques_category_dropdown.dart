import 'package:astrotak/data/models/question_category.dart';
import 'package:flutter/material.dart';

class QuesCategoryDropDown extends StatefulWidget {
  const QuesCategoryDropDown(
      {Key? key, required this.questionCategoryList, required this.callback})
      : super(key: key);

  final List<QuestionCategoryData> questionCategoryList;
  final Function(int value) callback;

  @override
  State<QuesCategoryDropDown> createState() => _QuesCategoryDropDownState();
}

class _QuesCategoryDropDownState extends State<QuesCategoryDropDown> {
  List<String> _quesCategories = [];
  int _selectedDropDownIndex = 0;

  List<DropdownMenuItem<String>>? getDropdownList() {
    List<DropdownMenuItem<String>>? dropDownList = [];

    // clearing the lists to prevent data redundancy.
    if (_quesCategories.isNotEmpty || dropDownList.isNotEmpty) {
      _quesCategories.clear();
      dropDownList.clear();
    }
    // creating a List<string> of all the Question Categories.
    for (var element in widget.questionCategoryList) {
      _quesCategories.add(element.name!);
    }
    for (var element in _quesCategories) {
      dropDownList.add(DropdownMenuItem(value: element, child: Text(element)));
    }
    return dropDownList;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        items: getDropdownList(),
        value: _quesCategories[_selectedDropDownIndex],
        onChanged: (String? selectedValue) {
          setState(() {
            _selectedDropDownIndex = _quesCategories.indexOf(selectedValue!);
          });
          widget.callback(_selectedDropDownIndex);
        });
  }
}
