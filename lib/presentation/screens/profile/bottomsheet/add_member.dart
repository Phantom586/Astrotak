import 'package:astrotak/logic/bloc/relatives_bloc.dart';
import 'package:astrotak/presentation/theme/astro_colors.dart';
import 'package:astrotak/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMember extends StatefulWidget {
  const AddMember({Key? key}) : super(key: key);

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController,
      _dateController,
      _monthController,
      _yearController,
      _hourController,
      _minuteController,
      _placeOfBirthController;
  int _meridian = 1;
  String? _genderDropdownValue, _relationDropdownValue;

  @override
  void initState() {
    _nameController = TextEditingController();
    _dateController = TextEditingController();
    _monthController = TextEditingController();
    _yearController = TextEditingController();
    _hourController = TextEditingController();
    _minuteController = TextEditingController();
    _placeOfBirthController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    _hourController.dispose();
    _minuteController.dispose();
    _placeOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bottomSheetBgColor,
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 24.0,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                'Add New Profile',
                style: h2_heading.copyWith(fontWeight: FontWeight.normal),
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name',
                  style: p1_paragraph,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter valid Name';
                    } else {
                      return null;
                    }
                  },
                  style: p1_paragraph,
                  decoration: InputDecoration(
                      filled: false,
                      errorStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12, color: Colors.red),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Date Of Birth',
                  style: p1_paragraph,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _dateController,
                        maxLength: 2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalid DD';
                          } else {
                            return null;
                          }
                        },
                        style: p1_paragraph,
                        decoration: InputDecoration(
                            filled: false,
                            hintText: 'DD',
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 12, color: Colors.red),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _monthController,
                        maxLength: 2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalid MM';
                          } else {
                            return null;
                          }
                        },
                        style: p1_paragraph,
                        decoration: InputDecoration(
                            filled: false,
                            hintText: 'MM',
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 12, color: Colors.red),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _yearController,
                        maxLength: 4,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalid YYYY';
                          } else {
                            return null;
                          }
                        },
                        style: p1_paragraph,
                        decoration: InputDecoration(
                            filled: false,
                            hintText: 'YYYY',
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 12, color: Colors.red),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Time Of Birth',
                  style: p1_paragraph,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _hourController,
                        maxLength: 2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalid HH';
                          } else {
                            return null;
                          }
                        },
                        style: p1_paragraph,
                        decoration: InputDecoration(
                            filled: false,
                            hintText: 'HH',
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 12, color: Colors.red),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _minuteController,
                        maxLength: 2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalid MM';
                          } else {
                            return null;
                          }
                        },
                        style: p1_paragraph,
                        decoration: InputDecoration(
                            filled: false,
                            hintText: 'MM',
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 12, color: Colors.red),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _meridian = 1;
                            });
                          },
                          child: Card(
                            color: _meridian == 1 ? primaryColor : Colors.white,
                            elevation: 2.0,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                'AM',
                                style: p1_paragraph.copyWith(
                                    color: _meridian == 1
                                        ? Colors.white
                                        : Colors.black54),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _meridian = 2;
                            });
                          },
                          child: Card(
                            color: _meridian == 2 ? primaryColor : Colors.white,
                            elevation: 2.0,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                'PM',
                                style: p1_paragraph.copyWith(
                                    color: _meridian == 2
                                        ? Colors.white
                                        : Colors.black54),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Place Of Birth',
                  style: p1_paragraph,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _placeOfBirthController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select a city';
                    } else {
                      return null;
                    }
                  },
                  style: p1_paragraph,
                  decoration: InputDecoration(
                      filled: false,
                      errorStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12, color: Colors.red),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Gender',
                            style: p1_paragraph,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder()),
                              isExpanded: true,
                              value: _genderDropdownValue,
                              items: const [
                                DropdownMenuItem(
                                  value: 'MALE',
                                  child: Text('Male'),
                                ),
                                DropdownMenuItem(
                                  value: 'FEMALE',
                                  child: Text('Female'),
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  _genderDropdownValue = newValue;
                                });
                              })
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Relation',
                            style: p1_paragraph,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder()),
                              isExpanded: true,
                              value: _relationDropdownValue,
                              items: const [
                                DropdownMenuItem(
                                  value: 'Brother',
                                  child: Text('Brother'),
                                ),
                                DropdownMenuItem(
                                  value: 'Sister',
                                  child: Text('Sister'),
                                ),
                                DropdownMenuItem(
                                  value: 'Father',
                                  child: Text('Father'),
                                ),
                                DropdownMenuItem(
                                  value: 'Mother',
                                  child: Text('Mother'),
                                ),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  _relationDropdownValue = newValue;
                                });
                              })
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: secondaryColor),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final memberInfo = {
                            "birthDetails": {
                              "dobDay": _dateController.text,
                              "dobMonth": _monthController.text,
                              "dobYear": _yearController.text,
                              "tobHour": _hourController.text,
                              "tobMin": _minuteController.text,
                              "meridiem": _meridian == 1 ? "AM" : "PM"
                            },
                            "birthPlace": const {
                              "placeName": "Kanpur, India",
                              "placeId": "ChIJwTa3v_6nkjkRC_b2yajUF_M"
                            },
                            "firstName": _nameController.text,
                            "lastName": "Kumar",
                            "relationId": 3,
                            "gender": _genderDropdownValue
                          };
                          context
                              .read<RelativesBloc>()
                              .add(AddRelative(data: memberInfo));
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        'Save Changes',
                        style: p2_paragraph.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
