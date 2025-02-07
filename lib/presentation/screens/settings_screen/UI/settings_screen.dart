import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/settings_bloc.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(LoadSettingsEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("Settings")),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is SettingsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SettingsLoadedState) {
              return ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.dark_mode),
                    title: Text("Dark Mode"),
                    trailing: Switch(
                      value: state.settings.darkMode,
                      onChanged: (value) {
                        context.read<SettingsBloc>().add(ToggleDarkModeEvent());
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text("Language"),
                    subtitle: Text(state.settings.language),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                    onTap: () {
                      context.read<SettingsBloc>().add(LogoutEvent());
                    },
                  ),
                ],
              );
            } else if (state is SettingsErrorState) {
              return Center(child: Text("Error: ${state.message}"));
            } else if (state is SettingsLoggedOutState) {
              return Center(child: Text("You have been logged out"));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
