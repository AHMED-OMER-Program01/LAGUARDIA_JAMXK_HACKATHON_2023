import 'package:flutter/material.dart';
import 'package:jamxk/%20common/assets.dart';
import 'package:jamxk/%20common/magic_numbers.dart';
import 'package:jamxk/objects/carbonModel.dart';
import 'package:velocity_x/velocity_x.dart';

class CarbonScreen extends StatefulWidget {
  const CarbonScreen({super.key});

  @override
  State<CarbonScreen> createState() => _CarbonScreenState();
}

class _CarbonScreenState extends State<CarbonScreen> {
  final _formKey = GlobalKey();
  final _carbon = Carbon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carbon Add')),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [purple, deepBlue],
            transform: GradientRotation(gradientRotation),
          ),
        ),
        child: Builder(
            builder: (context) => Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Carbon Type:'),
                        validator: (value) {
                          if (value.isEmptyOrNull) {
                            return 'Please enter carbon type';
                          }
                        },
                        onSaved: (value) =>
                            setState(() => _carbon.name = value!),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
