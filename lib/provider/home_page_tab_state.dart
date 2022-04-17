import 'package:flutter/material.dart';

class HomePageTabState extends ChangeNotifier{
  int homePageTabValue=1;
  void setHomePageTabBarValue(int value){
    homePageTabValue=value;
    notifyListeners();
  }

}

class TotalDealsTabState extends ChangeNotifier{
  int totalDealsTabValue=1;

  void setTotalDealsTabValue(int values){
    totalDealsTabValue=values;
    notifyListeners();
  }
}
class TotalProjectsTabState extends ChangeNotifier{
  int totalProjectsTabValue=1;

  void setTotalProjectsTabValue(int values){
    totalProjectsTabValue=values;
    notifyListeners();
  }
}

class ProductsSaleTabState extends ChangeNotifier{
  int productsSaleTabValue=1;

  void setProductsSaleTabValue(int values){
    productsSaleTabValue=values;
    notifyListeners();
  }
}

class CustomScafoldKey with ChangeNotifier{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}