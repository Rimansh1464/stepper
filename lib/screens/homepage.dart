import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initialStepperIndex = 0;
  dynamic radioGrpval = "Gender";
  final ImagePicker _picker = ImagePicker();
  File? image;
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(),
        ),
        title: const Text("Edit Your Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: _height,
          child: Form(
            key: profileFormKey,
            child: Stepper(
              currentStep: initialStepperIndex,
              onStepContinue: () {
                setState(() {
                  if (initialStepperIndex < 10) {
                    initialStepperIndex++;
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (initialStepperIndex > 0) {
                    initialStepperIndex--;
                  }
                });
              },
              onStepTapped: (val) {
                setState(() {
                  initialStepperIndex = val;
                });
              },
              steps: <Step>[
                Step(

                  title: const Text(
                    "Profile Picture",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Add profile photo",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              InkWell(
                                onTap: () async {
                                  XFile? pickedFile = await _picker.pickImage(
                                      source: ImageSource.camera);
                                  setState(() {
                                    Navigator.of(context).pop();
                                    image = File(pickedFile!.path);
                                  });
                                },
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey.shade400,
                                  backgroundImage: (image != null)
                                      ? FileImage(image!)
                                      : null,
                                  child: (image != null)
                                      ? const Text("")
                                      : const Text(
                                          "ADD",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                Step(
                  isActive: initialStepperIndex >= 1,
                  state: initialStepperIndex >= 2
                      ? StepState.complete
                      : StepState.disabled,
                  title: const Text(
                    "NAME",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter name",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          border: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hintText: "name",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Step(
                  isActive: initialStepperIndex >= 2,
                  state: initialStepperIndex >= 3
                      ? StepState.complete
                      : StepState.disabled,
                  title: const Text(
                    "Phone",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter Phone Number",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.call),
                          border: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hintText: "",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Step(
                  isActive: initialStepperIndex >= 3,
                  state: initialStepperIndex >= 4
                      ? StepState.complete
                      : StepState.disabled,
                  title: const Text(
                    "Email",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter Email",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.email),
                          border: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hintText: "",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Step(
                  isActive: initialStepperIndex >= 4,
                  state: initialStepperIndex >= 5
                      ? StepState.complete
                      : StepState.disabled,
                  title: const Text(
                    "DOB",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter Date Of Birth",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.date_range),
                          border: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hintText: "DD/MM/YYYY",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Step(
                  isActive: initialStepperIndex >= 5,
                  state: initialStepperIndex >= 6
                      ? StepState.complete
                      : StepState.disabled,
                  title: const Text(
                    "Gender",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: "Male",
                            groupValue: radioGrpval,
                            onChanged: (val) {
                              setState(() {
                                radioGrpval = val;
                              });
                            },
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 17,
                              color: (radioGrpval == "Male")
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: "Female",
                            groupValue: radioGrpval,
                            onChanged: (val) {
                              setState(() {
                                radioGrpval = val;
                              });
                            },
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                              fontSize: 17,
                              color: (radioGrpval == "Female")
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Step(
                  isActive: initialStepperIndex >= 6,
                  state: initialStepperIndex >= 7
                      ? StepState.complete
                      : StepState.disabled,
                  title: const Text(
                    "Current location",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter current location ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.location_on),
                          border: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hintText: "",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Step(
                  isActive: initialStepperIndex >= 7,
                  state: initialStepperIndex >= 8
                      ? StepState.complete
                      : StepState.disabled,
                  title: const Text(
                    "Nationality",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter Nationality",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.flag),
                          border: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hintText: "Indian",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Step(
                  isActive: initialStepperIndex >= 8,
                  state: initialStepperIndex >= 9
                      ? StepState.complete
                      : StepState.disabled,
                  title: const Text(
                    "Religion",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter religion",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.front_hand_outlined),
                          border: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hintText: "hindu",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Step(
                  isActive: initialStepperIndex >= 9,
                  state: initialStepperIndex >= 10
                      ? StepState.complete
                      : StepState.disabled,
                  title: const Text(
                    "Language(s)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter language",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          border: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hintText: "Gujarati",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Step(
                  isActive: initialStepperIndex >= 10,
                  state: initialStepperIndex >= 11
                      ? StepState.complete
                      : StepState.disabled,
                  title: const Text(
                    "Biography",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter biography",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.details_outlined),
                          border: UnderlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          hintText: "None",
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
