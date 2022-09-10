import 'package:flutter/material.dart';
import 'package:weather_app/core/shared/constants.dart';
import 'package:weather_app/core/widgets/default_text_button.dart';

class ReportPage extends StatelessWidget {
  ReportPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darkBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkBackgroundColor,
        elevation: 0.0,
        title: const Text(
          'Report Wrong Location',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email can\'t be empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: descriptionController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Description can\'t be empty';
                    } else {
                      return null;
                    }
                  },
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                DefaultTextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showSnackBar(context, 'Report sent successfully');
                      Navigator.of(context).pop();
                    }
                  },
                  text: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
