import 'package:flutter/material.dart';
import 'package:motivator/components/templates/app_page_template.dart';
import 'package:motivator/models/team.dart';

const TITLE = 'Teams Page';

class TeamsPage extends StatelessWidget {
  final List<Team> teams;

  const TeamsPage({Key key, @required this.teams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      title: TITLE,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return _buildList(context);
  }

  _buildList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: teams.map((team) => _buildListItem(context, team)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Team team) {
    return Padding(
      key: ValueKey(team.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(team.name),
          trailing: Text(team.name),
          onTap: () => print(team),
        ),
      ),
    );
  }
}
