import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lender_up/reuseable_widgets/build_sheet.dart';

List<Widget> CardPorto(
    List<Map<String, dynamic>> pinjamanData,
    BuildContext context,
    Map<String, dynamic>? lenderData,
    Map<String, dynamic>? dompetData) {
  List<Widget> items = [];

  // Loop untuk membuat konten item secara dinamis
  for (var data in pinjamanData) {
    items.add(Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) =>
                buildSheet(context, data, true, lenderData, dompetData),
          );
        },
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          padding: EdgeInsets.only(top: 10, bottom: 10),
          width: 400,
          height: 120,
          decoration: BoxDecoration(
            color: Color(0xffffffffff),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  // margin: EdgeInsets.only(left: 10),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 50,
                        height: 50,
                        child: ClipOval(
                            child: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                          fit: BoxFit.cover,
                        ))),
                    Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data['name']!,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold))),
                              Text(data['description']!,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600)))
                            ])),
                    Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Status Pembayaran",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w700))),
                              Text("AMAN",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color(0xff6EB13A),
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)))
                            ])),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text("Sisa Pokok",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Color(0xff1D3557),
                                fontSize: 8,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                              ))),
                        ),
                        Container(
                          child: Text(
                              "Rp. ${(data['nominal_pinjaman'] - data['nominal_dilunasi']).toString()}",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                              ))),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          // margin:
                          // EdgeInsets.only(left: 70, right: 70),
                          child: Text("Bagi Hasil",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Color(0xff1D3557),
                                fontSize: 8,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                              ))),
                        ),
                        Container(
                          // margin:
                          // EdgeInsets.only(left: 70, right: 70),
                          child:
                              Text("${data['bagi_hasil_persen'].toString()}%",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                  ))),
                        ),
                      ],
                    ),
                  ],
                )
              ]),
        ),
      ),
    ));
  }

  return items;
}
