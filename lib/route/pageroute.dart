import 'package:calculator_getx/main.dart';
import 'package:calculator_getx/route/nameroute.dart';
import 'package:get/get.dart';

class PageRoutes{
  static final pages = [
    GetPage(
        name: NameRoute.calculator,
        page: ()=>Calculator())
  ];
}