class Doctor {
  final String name;
  final String specialist;
  final String review;
  final String about;
  final String workingHours;
  final String patients;
  final String experience;
  final String certifications;
  final String image;
  final String headerImage;
  Doctor({
    this.about,
    this.certifications,
    this.experience,
    this.headerImage,
    this.image,
    this.name,
    this.patients,
    this.review,
    this.specialist,
    this.workingHours,
  });
}

List<Doctor> doctorList = [
  Doctor(
    name: "Dr Jessica Veranda",
    specialist: "Dental surgeon",
    review: "2520",
    workingHours: "Mon - Fri 08:00 - 16:00",
    certifications: "10",
    experience: "15",
    patients: "392",
    image: "assets/doctor6.png",
    headerImage: "assets/doctor3.jpg",
    about:
        "Dr Jessica Veranda is a very beautiful dentist. he will heal your toothache in a moment with his smile",
  ),
  Doctor(
    name: "Dr Kyla",
    specialist: "General practitioner",
    review: "2420",
    workingHours: "Mon - Fri 08:00 - 16:00",
    certifications: "10",
    experience: "15",
    patients: "392",
    image: "assets/doctor5.png",
    headerImage: "assets/doctor3.jpg",
    about:
        "Dr Jessica Veranda is a very beautiful dentist. he will heal your toothache in a moment with his smile",
  ),
  Doctor(
    name: "Dr Puti Indira",
    specialist: "General practitioner",
    review: "1223",
    workingHours: "Mon - Fri 08:00 - 16:00",
    certifications: "10",
    experience: "15",
    patients: "392",
    image: "assets/doctor1.png",
    headerImage: "assets/doctor3.jpg",
    about:
        "Dr Jessica Veranda is a very beautiful dentist. he will heal your toothache in a moment with his smile",
  ),
];
