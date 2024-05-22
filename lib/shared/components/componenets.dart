import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webview/webview.dart';

Widget itembuilder(item, context) {
  return InkWell(
    onTap: () {
      navigateto(context,WebViewer(url: item['url'],) );
    },
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('${item['urlToImage']}'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${item['title']} ',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${item['publishedAt']}',
                    style: TextStyle(
                        color: Color.fromARGB(255, 158, 119, 0), fontSize: 18),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget builder(list,{bool search=false}) {
  return ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: ((context, index) {
            return itembuilder(list[index], context);
          }),
          separatorBuilder: (context, index) =>
              Container(color: Colors.grey, width: double.infinity, height: 1),
          itemCount: list.length),

      fallback: (context) =>search?Container(): Center(child: CircularProgressIndicator()));
}

Widget defaultformfield({
  required TextEditingController controller,
  required String? Function(String?) validatee,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onchange,
  required String label,
  required IconData prefix,
  VoidCallback? ontap,
  bool isclick = true,
}) =>
    TextFormField(
      enabled: isclick,
      validator: validatee,
      onTap: ontap,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onchange,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(),
      ),
    );

void navigateto(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
