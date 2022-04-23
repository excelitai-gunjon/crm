
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shahid_mahamum_sir/example/custom_drop_down_button.dart';
import 'package:shahid_mahamum_sir/example/package_flutter_share_me.dart';
import 'package:shahid_mahamum_sir/provider/home_page_tab_state.dart';
import 'package:shahid_mahamum_sir/ui/pages/home_page/homepage.dart';

import 'example/file_picker_example.dart';

void main(){
  runApp(const MyApp());
  //runApp(const MyAppTextValidation());
  ///runApp(const MyAppWhatsApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TotalDealsTabState()),
        ChangeNotifierProvider.value(value: HomePageTabState()),
        ChangeNotifierProvider.value(value: ProductsSaleTabState()),
        ChangeNotifierProvider.value(value: TotalProjectsTabState()),
        ChangeNotifierProvider.value(value: CustomScafoldKey()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          builder: (context, widget){
            ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          //theme: ThemeData(fontFamily: 'Raleway'),
          theme: ThemeData(
              fontFamily: 'Roboto',
            //primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
          //home: MyAppFlutterShareMe(),
        ),
      ),
    );
  }
}