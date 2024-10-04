List<int> getAvailableAppointments(
    DateTime selectedDate, String start, String end) {
  int startHour = int.parse(start);
  int endHour = int.parse(end);

  // List<DateTime> availableAppointments = [];

  List<int> availableHours = [];
  for (int i = startHour; i < endHour; i++) {
    DateTime configuredDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    int diffInDays = selectedDate.difference(configuredDate).inDays;
    if (diffInDays != 0) {
      availableHours.add(i);
    } else {
      // we are today
      if (i > DateTime.now().hour) {
        availableHours.add(i);
      }
    }
  }

  return availableHours;

  // DateTime candidateTime =
  //     DateTime(selectedDate.year, selectedDate.month, selectedDate.day, i);

  // // check if booking day is today (if today check if hour is greater than now)
  // if (candidateTime.hour > DateTime.now().hour &&
  //     candidateTime.day == DateTime.now().day &&
  //     candidateTime.month == DateTime.now().month) {
  //   availableAppointments.add(candidateTime);
  // }
  // if (candidateTime.day != DateTime.now().day) {
  //   availableAppointments.add(candidateTime);
  // }

  // return availableAppointments;
}
