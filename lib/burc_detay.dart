import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  // ignore: non_constant_identifier_names
  const BurcDetay({super.key, required this.secilenBurc, Key? Key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.pink;
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();
    appBarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          expandedHeight: 250,
          pinned: true,
          backgroundColor: appBarRengi,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              widget.secilenBurc.burcAdi + " Burcu Ve Özellikleri",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Image.asset(
              // ignore: prefer_interpolation_to_compose_strings
              "images/" + widget.secilenBurc.burcBuyukResim,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Text(
                widget.secilenBurc.burcDetayi,
                style: const TextStyle(
                    fontFamily: AutofillHints.creditCardSecurityCode,
                    fontSize: 22),
              ),
            ),
          ),
        )
      ],
    ));
  }

  void appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));
        appBarRengi = _generator.vibrantColor!.color;
        setState(() {
          
        });
  }
}
