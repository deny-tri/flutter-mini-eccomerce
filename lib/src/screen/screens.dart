import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mini_eccommerce/src/blocs/blocs.dart';
import 'package:flutter_mini_eccommerce/src/blocs/category_product/category_product_bloc.dart';
import 'package:flutter_mini_eccommerce/src/service/services.dart';
import 'package:flutter_mini_eccommerce/src/utilities/utilities.dart';
import 'package:flutter_mini_eccommerce/src/widget/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slide_countdown/slide_countdown.dart';

part 'splash_screens.dart';
part 'login/login_screens.dart';
part 'home_screens.dart';
part 'profile_screens.dart';
part 'product_screens.dart';
part 'detail_product_screens.dart';
