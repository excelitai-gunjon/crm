import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'mobile_banking_page.dart';


class PayNowPage extends StatefulWidget {
  const PayNowPage({Key? key}) : super(key: key);

  @override
  State<PayNowPage> createState() => _PayNowPageState();
}

class _PayNowPageState extends State<PayNowPage> {
  bool mobileBanking=false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: mobileBanking?const CustomMobileBankingListView():Container(
          height: ScreenUtil().setHeight(320),
          width: ScreenUtil().setWidth(300),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Pay',
                      style: TextStyle(
                          color: Colors.black, fontSize: ScreenUtil().setSp(25),fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(text: 'Now',
                            style: const TextStyle(
                                color: Colors.indigo, fontSize: 18),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              }
                        )
                      ]
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    mobileBanking=true;
                  });
                },
                child: Container(
                  height: ScreenUtil().setHeight(80),
                  width: ScreenUtil().setWidth(250),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xffAE91D5),
                  ),
                  child: const Center(
                    child:  ListTile(
                      leading: Icon(Icons.phone_android_outlined,color: Colors.indigo,),
                      title: Text("Mobile Banking",style: TextStyle(
                        color: Colors.indigo
                      ),),
                    ),
                  ),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(80),
                width: ScreenUtil().setWidth(250),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffAE91D5),
                ),
                child: const Center(
                  child:  ListTile(
                    leading: Icon(Icons.network_cell,color: Colors.indigo,),
                    title: Text("Net Banking",style: TextStyle(
                        color: Colors.indigo
                    ),),
                  ),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(80),
                width: ScreenUtil().setWidth(250),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xffAE91D5),
                ),
                child: const Center(
                  child:  ListTile(
                    leading: Icon(Icons.credit_card,color: Colors.indigo),
                    title: Text("Cards",style: TextStyle(
                        color: Colors.indigo
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
