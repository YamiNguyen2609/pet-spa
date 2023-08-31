import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_spa/src/theme/Metrics.dart';

import '../theme/Color.dart';

class Launcher extends StatefulWidget {
  const Launcher({super.key});

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  double _processValue = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // do something
      Timer.periodic(const Duration(milliseconds: 500), (Timer timer) {
        if (_processValue < 1) {
          setState(() {
            _processValue += 0.1;
          });
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: padding_regular,
              child: Image.asset('assets/logo.png'),
            ),
            Container(
              margin: padding_regular,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.white,
                      width: 5.0,
                      style: BorderStyle.solid),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  )),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(35)),
                child: LinearProgressIndicator(
                    minHeight: 25,
                    color: color_primary,
                    backgroundColor: Colors.white,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(color_primary),
                    value: _processValue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
