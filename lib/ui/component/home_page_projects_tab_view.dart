import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shahid_mahamum_sir/model/projects_menu_model_class.dart';
import 'package:shahid_mahamum_sir/ui/component/home_page_custom_total_deals_container.dart';
import 'package:shahid_mahamum_sir/ui/component/home_page_total_projects_view.dart';

class ProjectsTabView extends StatelessWidget {
  ProjectsTabView({Key? key,this.size}) : super(key: key);

  Size? size;
  @override
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * .7, //255,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            //topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          )),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 2, top: 2),
            child: Scrollbar(
              hoverThickness: 2,
              radius: const Radius.circular(15),
              isAlwaysShown: true,
              thickness: 12,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 15),
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width,
                    width: double.infinity,
                    child: GridView.builder(
                      physics:
                      const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        //childAspectRatio: 3/2,
                      ),
                      itemCount: ProjectsMenuModel.list.length,
                      itemBuilder: (context, i) {
                        ProjectsMenuModel item =
                        ProjectsMenuModel.list[i];
                        return Container(
                          height:
                          MediaQuery.of(context).size.height *
                              .3,
                          width:
                          MediaQuery.of(context).size.height *
                              .3,
                          //color: Colors.green,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              style: BorderStyle.solid,
                              width: 1.0,
                            ),
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    color: item.color!,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      item.icons!,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets
                                        .symmetric(vertical: 4),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(item.title!
                                            .toString()),
                                        Text(
                                          item.departmentName!
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment:
                                    Alignment.centerLeft,
                                    child: LinearPercentIndicator(
                                      width: 100,
                                      lineHeight: 5.5,
                                      percent: item.progress!,
                                      center: Text(
                                        (item.progress! * 100)
                                            .toString() +
                                            "%",
                                        style: const TextStyle(
                                            fontSize: 5),
                                      ),
                                      trailing: Text(
                                        item.taskDone!
                                            .toString() +
                                            "/" +
                                            item.totalTask!
                                                .toString(),
                                      ),
                                      linearStrokeCap:
                                      LinearStrokeCap
                                          .roundAll,
                                      backgroundColor:
                                      Colors.grey,
                                      progressColor: item.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  TotalProjectsView(size: size,),
                  const SizedBox(height: 20,),
                  //CustomProductSalesContainer(size: size,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
