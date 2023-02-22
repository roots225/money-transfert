import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/app_colors.dart';

class AuthenticationCard extends StatelessWidget {
  final String title;
  final double titleHeight;
  final Widget child;
  final bool centerContent;

  const AuthenticationCard({
    super.key,
    required this.title,
    this.titleHeight = 170,
    required this.child,
    this.centerContent = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: titleHeight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title.toUpperCase(),
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 100,
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 30),
                          SizedBox(
                            width: 2,
                            child: Divider(
                              color: Colors.white,
                              thickness: 2,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: centerContent
                      ? Center(
                          child: SingleChildScrollView(
                            child: child,
                          ),
                        )
                      : SingleChildScrollView(
                          child: child,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
