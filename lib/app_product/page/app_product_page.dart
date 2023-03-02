import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/custom_text_field.dart';

class AppProductPage extends StatelessWidget {
  const AppProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _title = TextEditingController();
    final _desc = TextEditingController();
    final _datetime = TextEditingController();
    final _phone = TextEditingController();
    final _userName = TextEditingController();
    final _adress = TextEditingController();
    final _price = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppProductPage'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        children: [
          CustomTextField(
            controller: _title,
            hintText: 'Title',
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: _desc,
            hintText: 'Descripsion',
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: _datetime,
            hintText: 'Date Time',
            focusNode: FocusNode(),
            onTap: () async {
              // iosDatePicker(BuildContext context) {
              showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext builder) {
                    return Container(
                      height:
                          MediaQuery.of(context).copyWith().size.height * 0.25,
                      color: Colors.white,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) {
                          _datetime.text = value.toString();
                        },
                        initialDateTime: DateTime.now(),
                        minimumYear: 2000,
                        maximumYear: 3000,
                      ),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: _phone,
            hintText: 'Phone Number',
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: _userName,
            hintText: 'User Name',
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: _adress,
            hintText: 'Adress',
          ),
          const SizedBox(
            height: 12,
          ),
          CustomTextField(
            controller: _price,
            hintText: 'Price',
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.publish),
            label: const Text('Add to FireStore'),
          ),
        ],
      ),
    );
  }
}
