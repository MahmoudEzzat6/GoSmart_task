import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../data/models/home_model/home_model.dart';
import '../../features/main_screens/home/home_screen/calender_screen.dart';
import '../../features/main_screens/home/home_screen/cart_screen.dart';
import '../../features/main_screens/home/home_screen/home_screen.dart';
import '../../features/main_screens/home/home_screen/livery_screen.dart';
import '../../features/main_screens/home/home_screen/maps_screen.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates()) {
    fetchData();
  }
  static HomeCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  List<Widget> navBar = [
    HomeScreen(),
    CalenderScreen(),
    MapsScreen(),
    LiveryScreen(),
    CartScreen()
  ];
  void onChangePage(index) {
    currentIndex = index;
    emit(OnChangeStates());
  }
  LessonModel? model;

  Future<void> fetchData() async {

    try {
      emit(HomeLoadingStates());

      final uri = Uri.parse('http://equinaapis.ordarawy.com/lessons_list/1');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        model = LessonModel.fromJson(data);

        if (model?.lessons != null && model!.lessons!.isNotEmpty) {
          print("First Lesson Name: ${model!.lessons![0].name}");
        } else {
          print("No lessons found.");
        }

        emit(HomeSuccessStates());
      } else {
        print("Error: Failed to fetch data. Status Code: ${response.statusCode}");
        emit(HomeErrorStates());
      }
    } on SocketException {
      print("No Internet Connection.");
      emit(HomeErrorStates());
    } catch (e, stackTrace) {
      print("Error: $e\nStackTrace: $stackTrace");
      emit(HomeErrorStates());
    }
  }




}
