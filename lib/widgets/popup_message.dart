import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GenericError extends Error {
  final String message;

  GenericError({required this.message});

  @override
  String toString() {
    return message;
  }
}

Future<void> showMessage({required String title, required String message}) =>
    Get.dialog(
      MessagePopup(title: title, message: message),
    );

class MessagePopup extends StatelessWidget {
  final String title;
  final String message;

  const MessagePopup({Key? key, required this.title, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Card(
        color: theme.secondaryHeaderColor,
        margin: EdgeInsets.all(16.sp),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 16.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.sp),
              Text(message, style: theme.textTheme.bodyMedium),
              SizedBox(height: 10.sp),
              ElevatedButton(
                  onPressed: () => Get.back(), child: const Text("OK"))
            ],
          ),
        ),
      ),
    );
  }
}
