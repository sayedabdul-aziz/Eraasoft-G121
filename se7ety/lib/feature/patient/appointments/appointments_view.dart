import 'package:flutter/material.dart';
import 'package:se7ety/feature/patient/appointments/appointments_list.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({super.key});

  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'مواعيد الحجز',
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: MyAppointmentList(),
      ),
    );
  }
}
