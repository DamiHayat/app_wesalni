import 'package:flutter/cupertino.dart';

import '../../../core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        AppImageAsset.logoAuth,
      height: 170,
    );
  }
}
