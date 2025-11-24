import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  const AppButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return
        // body: Center(
        Column(
      children: [
        SizedBox(
          width: 450,
          height: 60,
          child: ElevatedButton(
            onPressed: () => print('hello'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Color(0xFFdedaff),
                  width: 4,
                ),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF7c7c7c),
                    fontFamily: 'Spoof',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.upload_sharp,
                  color: Color(0xFF7c7c7c),
                  size: 20,
                )
              ],
            ),
          ),
        )
      ],
    );
    // ),
  }
}
