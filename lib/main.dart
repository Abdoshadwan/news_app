import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/observer.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/local/cache_helper.dart';
import 'package:news_app/shared/network/dio.dart';
import 'package:news_app/shared/styles/themes.dart';

void main() async {
  //all methods here finished and run app
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  // bool? isDark = CacheHelper.getdata(key:'isdark');

  runApp(Myapp(
      // newisdark: isDark!,
      ));
}

class Myapp extends StatelessWidget {
  // Myapp({required this.newisdark});
  // final bool newisdark;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(InitialState())
        // ..changeappmode(context, fromshared: newisdark)
        ..getbusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: darktheme,
            theme: lighttheme,
            themeMode: NewsCubit.get(context).isdark == true
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Directionality(
              child: Home(),
              textDirection: TextDirection.ltr,
            ),
          );
        },
      ),
    );
  }
}
