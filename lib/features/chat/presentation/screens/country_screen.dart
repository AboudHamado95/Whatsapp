import 'package:flutter/material.dart';

import 'package:whatsapp/core/utils/dimensions.dart';
import 'package:whatsapp/features/chat/domain/entities/country_entity.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key, required this.setCountryData})
      : super(key: key);
  final Function setCountryData;

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  List<CountryEntity> countries = [
    CountryEntity(name: 'India', code: '+961', flag: 'IN'),
    CountryEntity(name: 'Pakistan', code: '+962', flag: 'PK'),
    CountryEntity(name: 'United states', code: '+919', flag: 'US'),
    CountryEntity(name: 'south Africa', code: '+922', flag: 'ZA'),
    CountryEntity(name: 'Afghanistan', code: '+963', flag: 'AF'),
    CountryEntity(name: 'United Kingdom', code: '+963', flag: 'IN'),
    CountryEntity(name: 'Italy', code: '+464', flag: 'IT'),
    CountryEntity(name: 'India', code: '+963', flag: 'IN'),
    CountryEntity(name: 'Pakistan', code: '+961', flag: 'PK'),
    CountryEntity(name: 'United states', code: '+962', flag: 'US'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.teal)),
        title: Text(
          'Choose a country',
          style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w700,
              fontSize: context.font16 + 2,
              wordSpacing: 1),
        ),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return card(countries[index]);
        },
      ),
    );
  }

  Widget card(CountryEntity country) {
    return InkWell(
      onTap: () {
        widget.setCountryData(country);
      },
      child: Card(
        margin: const EdgeInsets.all(0.15),
        child: Container(
          height: context.height30 * 2,
          padding: EdgeInsets.symmetric(
              horizontal: context.width20, vertical: context.height10 / 2),
          child: Row(children: [
            Text(country.flag),
            SizedBox(
              width: context.width15,
            ),
            Text(country.name),
            Expanded(
                child: SizedBox(
              width: context.width30 * 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(country.code),
                ],
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
