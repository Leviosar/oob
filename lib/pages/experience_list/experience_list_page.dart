import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:oob/widgets/structure/OobDrawer.dart';

import '../../blocs/ExperienceBloc.dart';
import '../../blocs/NavigationBloc.dart';
import '../../models/Experience.dart';
import '../../widgets/general/OobListTileTrailingBadge.dart';
import '../experience_display/experience_display_page.dart';

class ExperienceListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Experiências"),
      ),
      body: this.buildBody(context),
      drawer: OobDrawer(),
    );
  }

  Widget buildBody(BuildContext context) {
    return StreamBuilder(
        stream: BlocProvider.getBloc<ExperienceBloc>().experiences,
        builder: (BuildContext context,
                AsyncSnapshot<List<Experience>> experiences) =>
            experiences.hasData
                ? this.buildList(context, experiences.data)
                : this.buildEmptyList());
  }

  Widget buildEmptyList() {
    return ListView();
  }

  Widget buildList(BuildContext context, List<Experience> experiences) {
    return ListView.builder(
        itemCount: experiences.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(experiences[index].title),
            subtitle: Text(experiences[index].subtitle),
            trailing: OobListTileTrailingBadge(
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  experiences[index]
                      .subjects
                      .first
                      .name
                      .substring(0, 3)
                      .toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: experiences[index].subjects.first.color,
            ),
            onTap: () {
              BlocProvider.getBloc<NavigationBloc>()
                  .pushPage(context, ExperienceDisplayPage(experience: experiences[index]));
            },
          );
        });
  }
}
