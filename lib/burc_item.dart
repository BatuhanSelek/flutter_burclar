import 'package:flutter/material.dart';
import 'package:flutter_burclar/burc_detay.dart';
import 'package:flutter_burclar/model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({required this.listelenenBurc , Key? key});

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var MyTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BurcDetay(secilenBurc: listelenenBurc),),);
            },
            // ignore: prefer_interpolation_to_compose_strings
            leading: Image.asset("images/" +listelenenBurc.burcKucukResim,),
            title: Text(listelenenBurc.burcAdi , style: MyTextStyle.headlineMedium,),
            subtitle: Text(listelenenBurc.burcTarihi , style: MyTextStyle.headlineSmall,),
            trailing: const Icon(Icons.arrow_forward_ios),
          
          ),
        ),
      ),
    );
  }
}