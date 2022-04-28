import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shahid_mahamum_sir/model/mobile_banking_model.dart';

class CustomMobileBankingListView extends StatelessWidget {
  const CustomMobileBankingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mobileBankingDataProvider=Provider.of<MobileBanking>(context);
    return Container(
      height: ScreenUtil().setHeight(320),
      width: ScreenUtil().setWidth(300),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text("Mobile Banking",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(20)
              ),),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: MobileBanking.mobileBankingList.length,
              itemBuilder: (BuildContext context, index) {
                final item = MobileBanking.mobileBankingList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      mobileBankingDataProvider.setCheckedValue(index);
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(60),
                      width: ScreenUtil().screenWidth,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.indigo)
                      ),
                      child: ListTile(
                        leading: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Colors.indigo,
                            ),
                          ),
                          child: Icon(Icons.check,size: 12,color: item.checked!?Colors.indigo:Colors.white,),
                        ),
                        title: SizedBox(
                            height: ScreenUtil().setHeight(50),
                            width: ScreenUtil().screenWidth,
                            child: Image.asset(
                              item.imageUrl.toString(),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
