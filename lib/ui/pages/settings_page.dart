import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/cubit/page_cubit.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:myairplane/ui/pages/login_page.dart';
import 'package:myairplane/ui/widgets/custom_widget_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Widget signOutButton(context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 120, top: 120),
      child: Column(
        children: [
          CustomWidgetButton(
            title: "Sign Out",
            onPressed: () {
              context.read<AuthCubit>().signOut();
            },
            width: 220,
          ),
        ],
      ),
    );
  }

  Widget detailUser() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 100),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/image_profile.png'),
                    ),
                  ),
                ),
                const SizedBox(
                    height: 30), // Add some spacing between the image and text
                Text(
                  state.user.name,
                  style: purpleTextStyle.copyWith(
                      fontSize: 30, fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  state.user.email,
                  style: blackTextStyle.copyWith(
                    fontSize: 21,
                    fontWeight: medium,
                  ),
                )
              ],
            );
          }
          return Text('false');
        },
      ),
    );
  }

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
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: defaultRadius,
              vertical: defaultRadius,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [detailUser(), signOutButton(context)],
            ),
          );
        },
      ),
    );
  }
}
