import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/Business.dart';
import 'package:news_app/modules/science/Science.dart';
import 'package:news_app/modules/sports/Sports.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/local/cache_helper.dart';
import 'package:news_app/shared/network/dio.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit(super.initialState);

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> Screens = [
    Business(),
    Sports(),
    Science(),
  ];

  int CurrentIndex = 0;

  List<BottomNavigationBarItem> Bottoms = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_soccer),
      label: 'Sports',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  void ChangeScreens(int index) {
    CurrentIndex = index;
    if (index == 1) {
      getSports();
    }
    if (CurrentIndex == 2) {
      getScience();
    }

    emit(navigationscreens());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  void getbusiness() {
    emit(BusinessLoadingState());

    DioHelper.getdata(url: 'v2/top-headlines', query: {
      'country': 'us',
      'categor': 'business',
      'apikey': '86b7291641904f238b9e67c3f68a9913'
    }).then((value) {
      // print(value?.data['articles'][0]['title']);

      business = value?.data['articles'];
      print(business[0]['title']);

      emit(BusinessNews());
    }).catchError((error) {
      print('error occure get data : ${error.toString()}');
      emit(BusinessNewsError(error));
    });
  }

  void getSports() {
    emit(SportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getdata(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apikey': '86b7291641904f238b9e67c3f68a9913'
      }).then((value) {
        // print(value?.data['articles'][0]['title']);

        sports = value?.data['articles'];
        print(business[0]['title']);

        emit(SportsNews());
      }).catchError((error) {
        print('error occure get data : ${error.toString()}');
        emit(SportsNewsError(error));
      });
    } else {
      emit(SportsNews());
    }
  }

  void getScience() {
    emit(ScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getdata(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apikey': '86b7291641904f238b9e67c3f68a9913'
      }).then((value) {
        // print(value?.data['articles'][0]['title']);
        science = value?.data['articles'];
        print(business[0]['title']);
        emit(ScienceNews());
      }).catchError((error) {
        print('error occure get data : ${error.toString()}');
        emit(ScienceNewsError(error));
      });
    } else {
      emit(ScienceNews());
    }
  }

  List<dynamic> search = [];
  void getsearch(String value) {
    emit(SearchLoadingState());
    search = [];

    DioHelper.getdata(url: 'v2/everything', query: {
     
      'q': '$value',
      'apikey': '86b7291641904f238b9e67c3f68a9913'
    }).then((value) {
      // print(value?.data['articles'][0]['title']);

      search = value?.data['articles'];
      print(search[0]['title']);

      emit(SearchNews());
    }).catchError((error) {
      print('error occure get data : ${error.toString()}');
      emit(SearchNewsError(error));
    });
  }

  bool isdark = false;
  
  void changeappmode(context, {bool? fromshared}) {
    if (fromshared != null) {
      isdark = fromshared;
      emit(changemodestate());
    } else {
      isdark = !isdark;

      CacheHelper.putdata(key: 'isdark', value: isdark).then((value) {
        emit(changemodestate());
      });
    }
  }
}
