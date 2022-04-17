import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shahid_mahamum_sir/provider/home_page_tab_state.dart';
import 'package:shahid_mahamum_sir/ui/component/home_page_custom_deals_tab_bar_view.dart';
import 'package:shahid_mahamum_sir/ui/component/home_page_projects_tab_view.dart';

class HomePageTab extends StatelessWidget {
  HomePageTab({Key? key,this.size}) : super(key: key);

  Size? size;
  @override
  Widget build(BuildContext context) {
    final homePageTabState = Provider.of<HomePageTabState>(context);
    if (homePageTabState.homePageTabValue == 1) {
      return buildDealsTab(context);
    } else if (homePageTabState.homePageTabValue == 2) {
      return buildProjectsTab(context);
    } else {
      return buildLeadsTab(context);
    }
  }

  Widget buildDealsTab(BuildContext context){
    return CustomDealsTabBarView(size: size,);
  }

  Widget buildProjectsTab(BuildContext context){
    return ProjectsTabView(size: size,);
  }

  Widget buildLeadsTab(BuildContext context){
    return CustomDealsTabBarView(size: size,);
  }

}
