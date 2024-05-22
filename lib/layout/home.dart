import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/search.dart';
import 'package:news_app/modules/settings/settings.dart';
import 'package:news_app/shared/components/componenets.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, NewsStates state) {},
        builder: (context, NewsStates state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Settings();
                  }));
                },
                child: Text(
                  'NewsApp',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                     navigateto(context, Search());
                    },
                    icon: Icon(
                      Icons.search,
                      weight: 500,
                    )),
               IconButton(
              onPressed: () {
                NewsCubit.get(context).changeappmode(context);
                print(NewsCubit.get(context).isdark);
              },
              icon: Icon(
                NewsCubit.get(context).isdark == true
                    ? Icons.brightness_4_outlined
                    : Icons.dark_mode,
                weight: 500,
              )),
              ],
            ),
            body: cubit.Screens[cubit.CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.CurrentIndex,
              items: cubit.Bottoms,
              onTap: (index) {
                cubit.ChangeScreens(index);
              },
            ),
          );
        });
  }
}
