import 'package:flutter/material.dart';
import 'package:health_app/constants.dart';
import 'package:health_app/models/doctor.dart';
import 'package:health_app/widgets/rating_icon.dart';

class DoctorDetail extends StatelessWidget {
  final Doctor doctor;
  DoctorDetail({this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(doctor.headerImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 30.0,
                    left: 20.0,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: kGrey2Color,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${doctor.name}\n",
                              style: kTitleStyle,
                            ),
                            TextSpan(
                              text: doctor.specialist,
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      ButtonAction(
                        color: kYellowColor,
                        icon: Icons.mail,
                      ),
                      SizedBox(width: 14.0),
                      ButtonAction(
                        color: kGreen2Color,
                        icon: Icons.phone,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      RatingIcon(),
                      SizedBox(width: 12.0),
                      Text("(${doctor.review} reviews)", style: kRatingStyle),
                      Spacer(),
                      Text(
                        "See all reviews",
                        style: kSubtitle2Style.copyWith(color: kBlue1Color),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Divider(color: kGrey2Color),
                  SizedBox(height: 20.0),
                  Text("About", style: kTitleStyle),
                  SizedBox(height: 20.0),
                  Text(doctor.about, style: kSubtitle2Style),
                  SizedBox(height: 20.0),
                  Text("Working hourse", style: kTitleStyle),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(doctor.workingHours, style: kSubtitle2Style),
                      SizedBox(width: 20.0),
                      SizedBox(
                        width: 70.0,
                        height: 35.0,
                        child: RaisedButton(
                          onPressed: () {},
                          color: kGreenColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: Text(
                            "Open",
                            style: kButtonStyle.copyWith(color: kGreen2Color),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text("Stats", style: kTitleStyle),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Stats(name: "Patients", total: doctor.patients),
                        Spacer(),
                        StatsExperience(
                            name: "Experience", total: doctor.experience),
                        Spacer(),
                        Stats(
                            name: "Certifications",
                            total: doctor.certifications)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SizedBox(
                width: double.infinity,
                height: 55.0,
                child: RaisedButton(
                  onPressed: () {},
                  elevation: 0.0,
                  color: kBlue1Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Center(
                    child: Text(
                      "Make an appointment",
                      style: kButtonStyle,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class StatsExperience extends StatelessWidget {
  final String total;
  final String name;
  StatsExperience({this.total, this.name});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: "$total",
          style: kTitleStyle,
        ),
        TextSpan(
          text: " years\n",
          style: kSubtitleStyle.copyWith(fontSize: 12.0),
        ),
        TextSpan(
          text: "$name",
          style: kSubtitleStyle.copyWith(fontSize: 14.0),
        ),
      ]),
    );
  }
}

class Stats extends StatelessWidget {
  final String total;
  final String name;
  Stats({this.total, this.name});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: "$total\n",
          style: kTitleStyle,
        ),
        TextSpan(
          text: "$name",
          style: kSubtitleStyle.copyWith(fontSize: 14.0),
        ),
      ]),
    );
  }
}

class ButtonAction extends StatelessWidget {
  final Color color;
  final IconData icon;
  ButtonAction({this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: color,
      ),
      child: Icon(
        icon,
        size: 25.0,
        color: Colors.white,
      ),
    );
  }
}
