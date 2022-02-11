import 'package:flutter/material.dart';

class NotificationsBadge extends StatelessWidget {
  const NotificationsBadge({Key? key, required this.totalNoti})
      : super(key: key);

  final int totalNoti;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            '$totalNoti',
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
      height: 80,
      width: 80,
      decoration: const BoxDecoration(
        color: Colors.yellowAccent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(spreadRadius: 4, blurRadius: 6, color: Colors.grey),
        ],
      ),
    );
  }
}
