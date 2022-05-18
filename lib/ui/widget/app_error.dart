import 'package:flutter/material.dart';
import 'package:nikki_shop/common/exeption.dart';

class AppError extends StatelessWidget {
  const AppError({Key? key, required this.appException, required this.onTap})
      : super(key: key);
  final AppException appException;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            appException.message.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ElevatedButton(onPressed: onTap, child: const Text("تلاش دوباره"))
        ],
      ),
    );
  }
}
