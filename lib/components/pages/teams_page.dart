import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivator/blocs/teams/teams.dart';
import 'package:motivator/components/templates/app_page_template.dart';
import 'package:motivator/models/team.dart';

const TITLE = 'Teams Page';

class TeamsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPageTemplate(
      title: TITLE,
      body: BlocListener<TeamsBloc, TeamsState>(
        listener: (context, state) {
          if (state is TeamsLoadedFailure) {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cannot fetch teams: ${state.errorMessage}'),
                      Icon(Icons.error),
                    ],
                  ),
                  backgroundColor: Colors.red,
                ),
              );
          }
        },
        child: _createBody(context),
      ),
    );
  }

  Widget _createBody(BuildContext context) {
    return BlocBuilder<TeamsBloc, TeamsState> (
      builder: (context, state) {
        var teams = state is TeamsLoadedSuccess ? state.teams : [];
        return ListView(
          padding: const EdgeInsets.only(top: 20.0),
          children: teams.map((team) => _createListItem(context, team)).toList(),
        );
      },
    );
  }

  Widget _createListItem(BuildContext context, Team team) {
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
