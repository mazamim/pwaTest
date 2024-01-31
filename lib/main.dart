// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, depend_on_referenced_packages, avoid_print, unnecessary_null_comparison
import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';
import 'package:adaptalift_dynamic_form/widgets/dynamic_form_container.dart';
import 'package:adaptalift_dynamic_form/providers/dynamic_form_provider.dart';
import 'static_form_data.dart';
import 'package:provider/provider.dart';

void main() async {
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DynamicFormProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter PWA',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TakeFive(),
      ),
    );
  }
}

class TakeFive extends StatefulWidget {
  @override
  _TakeFiveState createState() => _TakeFiveState();
}

class _TakeFiveState extends State<TakeFive> {
  bool isCompleted = false;
  double progress = 0.0;
  dynamic formData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFormData();
  }

  void fetchFormData() async {
    await Future.delayed(Duration(seconds: 2));

    try {
      var decodedJson = json.decode(staticFormData);

      if (decodedJson != null &&
          decodedJson.containsKey('data') &&
          decodedJson['data'].containsKey('dynamicForms')) {
        formData = decodedJson['data'] as Map<String, dynamic>?;
      } else {
        print("dynamicForms key not found in response");
        formData = null;
      }
    } catch (e) {
      print("Error decoding JSON: $e");
      formData = null;
    }

    // Update the state
    setState(() {
      isLoading = false;
    });
  }

  void onAnswerChanged(dynamic answerData) {
    setState(() {
      isCompleted = answerData.isFormValid ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PWA Question Generator"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : DynamicFormContainer(
              formData: formData,
              relatedEntityId: '123',
              customStyles: customStyles,
            ),
    );
  }
}
