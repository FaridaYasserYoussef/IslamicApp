import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/app_images.dart';
import '../../models/hadeeth_model.dart';

class HadeethScreen extends StatefulWidget {
  static const routeName = "hadeethDetailsScreen";

  @override
  State<HadeethScreen> createState() => _HadeethScreenState();
}

class _HadeethScreenState extends State<HadeethScreen> {

  @override
  Widget build(BuildContext context) {

    HadeethModel hadeethModel = ModalRoute.of(context)!.settings.arguments as HadeethModel;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Theme.of(context).brightness == Brightness.light? AppImages.lightBackgroundImage: AppImages.darkBackgroundImage),
            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("إسلامي",
              style: Theme.of(context).textTheme.headlineMedium
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height *(75/873),
              horizontal: MediaQuery.of(context).size.width *(30/412)
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: Text(hadeethModel.name, style: Theme.of(context).textTheme.titleLarge,),
                  ),
                  Divider(
                    indent: MediaQuery.of(context).size.width *(50/412),
                    endIndent: MediaQuery.of(context).size.width *(50/412),
                  ),
                   Expanded(child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView.builder(itemCount: hadeethModel.content.length, itemBuilder: (context, index){
                      return Center(child: Text(hadeethModel.content[index]));
                    } ),
                  ))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
