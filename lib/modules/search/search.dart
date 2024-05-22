import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/componenets.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

// ignore: must_be_immutable
class Search extends StatelessWidget {
  Search({super.key});

  var searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var search = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: defaultformfield(
                  onchange: (value) {
                    NewsCubit.get(context).getsearch(value);
                  },
                  controller: searchcontroller,
                  label: 'search',
                  prefix: Icons.search,
                  type: TextInputType.text,
                  validatee: (String? value) {
                    if (value!.isEmpty) {
                      return 'search must not be empty';
                    }
                    return null;
                  }),
            ),
            Expanded(child: builder(search,search:true)),
          ]),
        );
      },
    );
  }
}
