import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class Transaction_Item extends StatelessWidget {
  const Transaction_Item({
    Key? key,
    required this.transaction,
    required this.deletetx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deletetx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            // '\$' + tx.amount.toString(),      //${tx.amount}  -> String Interpolation
            '\$${transaction.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Quicksand',
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(transaction.date),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? FlatButton.icon(
              textColor: Colors.red,
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                onPressed: () => deletetx(transaction.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () => deletetx(transaction.id),
              ),
      ),
    );

    // return Card(
                //   elevation: 6,
                //   child: Row(children: <Widget>[
                //     Container(
                //       margin:
                //           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: Theme.of(context).primaryColor,
                //           width: 2,
                //         ),
                //       ),
                //       padding: EdgeInsets.all(10),
                //       child: Text(
                //         // '\$' + tx.amount.toString(),      //${tx.amount}  -> String Interpolation
                //         '\$${transactions[index].amount.toStringAsFixed(2)}',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20,
                //           fontFamily: 'Quicksand',
                //           color: Theme.of(context).primaryColor,
                //         ),
                //       ),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text(
                //           transactions[index].title,
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 16,
                //             color: Colors.black,
                //           ),
                //         ),
                //         Text(
                //           DateFormat.yMMMEd().format(transactions[index].date),
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 12,
                //             color: Colors.grey,
                //           ),
                //         ),
                //       ],
                //     ),
                //     IconButton(
                //       icon: Icon(Icons.delete),
                //       color: Theme.of(context).primaryColor,
                //       onPressed: () {},
                //     )
                //   ]),
                // );
  }
}
