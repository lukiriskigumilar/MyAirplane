import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/cubit/page_cubit.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/login_page.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ));
          } else if (state is AuthInitial) {
            // menambahkan nilai set page 0 atau homescreen
            context.read<PageCubit>().setPage(0);

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
              (Route<dynamic> route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomWidgetButton(
            title: "Sign Out",
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
            width: 220,
          );
        },
      ),
    );
  }
}
