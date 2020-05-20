import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_app/constants.dart';
import 'package:health_app/models/doctor.dart';
import 'package:health_app/views/doctor_details.dart';
import 'package:health_app/widgets/doctor_card.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Hello,\n",
                            style: kTitleStyle.copyWith(
                              fontSize: 26.0,
                              color: kGrey2Color,
                            ),
                          ),
                          TextSpan(
                            text: "Flutter World",
                            style: kTitleStyle.copyWith(
                              fontSize: 26.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage("assets/user.png"),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 55.0,
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: kGrey1Color,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      icon: Icon(
                        FontAwesomeIcons.search,
                        size: 20.0,
                        color: Colors.black54,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                width: double.infinity,
                height: 150.0,
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: kBlue2Color,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 15.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Do you have symptoms\nof Covid 19?",
                              style: kTitleStyle,
                            ),
                            Spacer(),
                            RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              color: kBlue1Color,
                              elevation: 2.0,
                              child: SizedBox(
                                width: 150.0,
                                height: 50.0,
                                child: Center(
                                  child: Text(
                                    "Contact a doctor",
                                    style: kButtonStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/doctor11.png",
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 15.0),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: Text("Categories", style: kTitleStyle),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 80.0,
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    CategoriesItem(
                      title: "General\npractitioner",
                      color: kRedColor,
                      icon: FontAwesomeIcons.stethoscope,
                    ),
                    SizedBox(width: 15.0),
                    CategoriesItem(
                      title: "Dental\nsurgeon",
                      color: kYellowColor,
                      icon: FontAwesomeIcons.tooth,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  color: kGrey1Color,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Top doctors", style: kTitleStyle),
                        Spacer(),
                        Text("See all", style: kSubtitleStyle),
                      ],
                    ),
                    ListView.builder(
                      itemCount: doctorList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        var doctor = doctorList[index];

                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorDetail(
                                    doctor: doctor,
                                  ),
                                ),
                              );
                            },
                            child: DoctorCard(doctor: doctor));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesItem extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  CategoriesItem({this.title, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: kGrey2Color,
              width: 1.0,
            )),
        child: Row(
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: color,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 12.0),
            Text(title, style: kCategoryStyle),
          ],
        ),
      ),
    );
  }
}
