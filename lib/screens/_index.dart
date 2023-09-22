library bc_screens;

import 'dart:io';

import 'package:breast_cancer/model/_index.dart';
import 'package:breast_cancer/utils/_index.dart';
import 'package:breast_cancer/widgets/_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:breast_cancer/providers/_index.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

part 'loader.dart';
part 'home.dart';
part 'upload.dart';
part 'result.dart';
part 'prediction.dart';
part 'analytics.dart';

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: CustomTextTheme.customTextTheme(context).textTheme.labelSmall,
      ),
      backgroundColor: AppTheme.appTheme(context).primaryColor,
    ),
  );
}
