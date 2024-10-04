class DoctorModel {
  String? name;
  String? image;
  String? specialization;
  int? rating;
  String? email;
  String? phone1;
  String? phone2;
  String? bio;
  String? openHour;
  String? closeHour;
  String? address;
  String? uid;

  DoctorModel({
    this.name,
    this.image,
    this.specialization,
    this.rating,
    this.email,
    this.phone1,
    this.phone2,
    this.bio,
    this.openHour,
    this.closeHour,
    this.address,
    this.uid,
  });

  DoctorModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    specialization = json['specialization'];
    rating = json['rating'];
    email = json['email'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    bio = json['bio'];
    openHour = json['openHour'];
    closeHour = json['closeHour'];
    address = json['address'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['specialization'] = specialization;
    data['rating'] = rating;
    data['email'] = email;
    data['phone1'] = phone1;
    data['phone2'] = phone2;
    data['bio'] = bio;
    data['openHour'] = openHour;
    data['closeHour'] = closeHour;
    data['address'] = address;
    data['uid'] = uid;
    return data;
  }
}
