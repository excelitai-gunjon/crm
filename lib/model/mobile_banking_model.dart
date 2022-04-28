import 'package:flutter/cupertino.dart';

class MobileBanking with ChangeNotifier{
  String? imageUrl;
  String? name;
  bool? checked;

  MobileBanking({this.name,this.imageUrl,this.checked});

  static List<MobileBanking> mobileBankingList=[
    MobileBanking(
      name: "Rocket",
      imageUrl: "image/rocketlogo.png",
      checked: false,
    ),
    MobileBanking(
      name: "bKash",
      imageUrl: "image/bkashlogo.png",
      checked: false,
    ),
    MobileBanking(
      name: "Nagad",
      imageUrl: "image/nogod.png",
      checked: false,
    ),
    MobileBanking(
      name: "Rocket",
      imageUrl: "image/rocketlogo.png",
      checked: false,
    ),
    MobileBanking(
      name: "bKash",
      imageUrl: "image/bkashlogo.png",
      checked: false,
    ),
    MobileBanking(
      name: "Nagad",
      imageUrl: "image/nogod.png",
      checked: false,
    ),
  ];
  setCheckedValue(int index){
    if(index==0){
      mobileBankingList[index].checked=true;
      mobileBankingList[1].checked=false;
      mobileBankingList[2].checked=false;
      mobileBankingList[3].checked=false;
      mobileBankingList[4].checked=false;
      mobileBankingList[5].checked=false;
      notifyListeners();
    }
    if(index==1){
      mobileBankingList[0].checked=false;
      mobileBankingList[1].checked=true;
      mobileBankingList[2].checked=false;
      mobileBankingList[3].checked=false;
      mobileBankingList[4].checked=false;
      mobileBankingList[5].checked=false;
      notifyListeners();
    }
    if(index==2){
      mobileBankingList[0].checked=false;
      mobileBankingList[1].checked=false;
      mobileBankingList[2].checked=true;
      mobileBankingList[3].checked=false;
      mobileBankingList[4].checked=false;
      mobileBankingList[5].checked=false;
      notifyListeners();
    }
    if(index==3){
      mobileBankingList[0].checked=false;
      mobileBankingList[1].checked=false;
      mobileBankingList[2].checked=false;
      mobileBankingList[3].checked=true;
      mobileBankingList[4].checked=false;
      mobileBankingList[5].checked=false;
      notifyListeners();
    }
    if(index==4){
      mobileBankingList[0].checked=false;
      mobileBankingList[1].checked=false;
      mobileBankingList[2].checked=false;
      mobileBankingList[3].checked=false;
      mobileBankingList[4].checked=true;
      mobileBankingList[5].checked=false;
      notifyListeners();
    }
    if(index==5){
      mobileBankingList[0].checked=false;
      mobileBankingList[1].checked=false;
      mobileBankingList[2].checked=false;
      mobileBankingList[3].checked=false;
      mobileBankingList[4].checked=false;
      mobileBankingList[5].checked=true;
      notifyListeners();
    }
  }
}