import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myairplane/cubit/auth_cubit.dart';
import 'package:myairplane/shared/theme.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQr extends StatefulWidget {
  const MyQr({super.key});

  @override
  State<MyQr> createState() => _MyQrState();
}

class _MyQrState extends State<MyQr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 120),
                child: Text(
                  'Show this QR code to your friend so they can send you money easily!',
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, left: 15, right: 15),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: kUnvailableSeat,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthSucces) {
                          final data = state.user.id;
                          return Column(
                            children: [
                              SizedBox(
                                width: 200,
                                height: 200,
                                child: QrImageView(data: data),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                state.user.name,
                                style: purpleTextStyle.copyWith(
                                  fontWeight: semiBold,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      margin: const EdgeInsets.only(
                                        bottom: 8,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: kUnvailableSeat,
                                          border: Border.all(
                                            color: kBlackColor,
                                            width: 2,
                                          )),
                                      child: Center(
                                        child: Image.asset(
                                          'assets/iconDownload.png',
                                          width: 36,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Download Qr',
                                      style: blackTextStyle.copyWith(
                                        fontWeight: medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      margin: const EdgeInsets.only(
                                        bottom: 8,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: kUnvailableSeat,
                                          border: Border.all(
                                            color: kBlackColor,
                                            width: 2,
                                          )),
                                      child: Center(
                                        child: Image.asset(
                                          'assets/iconShare.png',
                                          width: 36,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Share Qr',
                                      style: blackTextStyle.copyWith(
                                        fontWeight: medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]));
  }
}
