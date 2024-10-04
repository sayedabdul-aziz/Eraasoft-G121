import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:se7ety/core/functions/navigation.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/core/widgets/alert_dialog.dart';
import 'package:se7ety/core/widgets/custom_button.dart';
import 'package:se7ety/core/widgets/doctor_card.dart';
import 'package:se7ety/feature/auth/data/models/doctor_model.dart';
import 'package:se7ety/feature/patient/booking/data/available_appointments.dart';
import 'package:se7ety/feature/patient/nav_bar.dart';

class BookingView extends StatefulWidget {
  final DoctorModel doctor;

  const BookingView({
    super.key,
    required this.doctor,
  });

  @override
  _BookingViewState createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  TimeOfDay currentTime = TimeOfDay.now();
  String? dateUTC;
  String? booking_hour;

  int selectedIndex = -1;

  User? user;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
  }

  // هتشيل المةاعيد بتاعت اليوم اللي هنحدده
  List<int> times = [];
  getAvailableTimes(selectedDate) async {
    times = getAvailableAppointments(selectedDate,
        widget.doctor.openHour ?? "0", widget.doctor.closeHour ?? "0");
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.white,
            )),
        elevation: 0,
        title: const Text(
          'احجز مع دكتورك',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              DoctorCard(
                doctor: widget.doctor,
                isClickable: false,
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      '-- ادخل بيانات الحجز --',
                      style: getTitleStyle(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'اسم المريض',
                            style: getbodyStyle(color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) return 'من فضلك ادخل اسم المريض';
                        return null;
                      },
                      style: getbodyStyle(),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'رقم الهاتف',
                            style: getbodyStyle(color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      style: getbodyStyle(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل رقم الهاتف';
                        } else if (value.length < 10) {
                          return 'يرجي ادخال رقم هاتف صحيح';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'وصف الحاله',
                            style: getbodyStyle(color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      style: getbodyStyle(),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'تاريخ الحجز',
                            style: getbodyStyle(color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      onTap: () {
                        selectDate(context);
                      },
                      controller: _dateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل تاريخ الحجز';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      style: getbodyStyle(),
                      decoration: const InputDecoration(
                        hintText: 'ادخل تاريخ الحجز',
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundColor: AppColors.color1,
                            radius: 18,
                            child: Icon(
                              Icons.date_range_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'وقت الحجز',
                            style: getbodyStyle(color: AppColors.black),
                          )
                        ],
                      ),
                    ),
                    Wrap(
                        spacing: 8.0,
                        children: times.map((hour) {
                          return ChoiceChip(
                            backgroundColor: AppColors.accentColor,
                            // showCheckmark: false,
                            checkmarkColor: AppColors.white,
                            // avatar: const Icon(Icons.abc),
                            selectedColor: AppColors.color1,
                            label: Text(
                              '${(hour < 10) ? '0' : ''}${hour.toString()}:00',
                              style: TextStyle(
                                color: hour == selectedIndex
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            selected: hour == selectedIndex,
                            onSelected: (selected) {
                              setState(() {
                                selectedIndex = hour;
                                booking_hour =
                                    '${(hour < 10) ? '0' : ''}${hour.toString()}:00';
                              });
                            },
                          );
                        }).toList()),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: CustomButton(
          text: 'تأكيد الحجز',
          onPressed: () {
            if (_formKey.currentState!.validate() && selectedIndex != -1) {
              _createAppointment();
              showAlertDialog(
                context,
                title: 'تم تسجيل الحجز !',
                ok: 'اضغط للانتقال',
                onTap: () {
                  pushAndRemoveUntil(context, const PatientNavBarWidget());
                },
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _createAppointment() async {
    FirebaseFirestore.instance
        .collection('appointments')
        .doc('appointments')
        .collection('pending')
        .doc()
        .set({
      'patientID': user!.email,
      'doctorID': widget.doctor.email,
      'name': _nameController.text,
      'phone': _phoneController.text,
      'description': _descriptionController.text,
      'doctor': widget.doctor.name,
      'location': widget.doctor.address,
      'date': DateTime.parse(
          '${dateUTC!} ${booking_hour!}:00'), // yyyy-MM-dd HH:mm:ss
      'isComplete': false,
      'rating': null
    }, SetOptions(merge: true));

    FirebaseFirestore.instance
        .collection('appointments')
        .doc('appointments')
        .collection('all')
        .doc()
        .set({
      'patientID': user!.email,
      'doctorID': widget.doctor.email,
      'name': _nameController.text,
      'phone': _phoneController.text,
      'description': _descriptionController.text,
      'doctor': widget.doctor.name,
      'location': widget.doctor.address,
      'date': DateTime.parse('${dateUTC!} ${booking_hour!}:00'),
      'isComplete': false,
      'rating': null
    }, SetOptions(merge: true));
  }

  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then(
      (date) {
        if (date != null) {
          setState(
            () {
              _dateController.text =
                  DateFormat('dd-MM-yyyy').format(date); // to display the date
              dateUTC = DateFormat('yyyy-MM-dd')
                  .format(date); // to send the date to firebase
              getAvailableTimes(date); // to get available times
            },
          );
        }
      },
    );
  }
}
