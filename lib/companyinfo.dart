import 'package:flutter/material.dart';

class CompanyInfo extends StatefulWidget {
  const CompanyInfo({super.key});

  @override
  State<CompanyInfo> createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Company:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Geeksynergy Technologies Pvt Ltd"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Address:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Sanjayanagar, Bengaluru-56"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Phone:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("XXXXXXXXX09"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Email:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("XXXXXX@gmail.com"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
