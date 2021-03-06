import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: transactions.isEmpty
          ? new Column(
        children: <Widget>[
          new Text(
            "No transaction add yer",
            style: Theme
                .of(context)
                .textTheme
                .title,
          ),
          new SizedBox(
            height: 15,
          ),
          Container(
              height: 200,
              child: Image.asset(
                "assets/images/waiting.jpg",
                fit: BoxFit.cover,
              ))
        ],
      )
          : ListView.builder(
        itemBuilder: ((anyname, index) {
          return new Card(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: new ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text(
                        "\$${transactions[index].amount.toStringAsFixed(2)}"),
                  ),
                ),
              ),
              title: Text("${transactions[index].title}", style: Theme
                  .of(context)
                  .textTheme
                  .title,),
              subtitle: Text(
                  "${DateFormat.yMMMd().format(transactions[index].date)}"),
              trailing: IconButton(icon: Icon(Icons.delete), color: Theme
                  .of(context)
                  .errorColor,onPressed: ()=>deleteTx(transactions[index].id), ),
            ),
          );
//                Card(
//                  child: Row(
//                    children: <Widget>[
//                      Container(
//                        margin: EdgeInsets.symmetric(
//                          vertical: 10,
//                          horizontal: 15,
//                        ),
//                        decoration: BoxDecoration(
//                          border: Border.all(
//                            color: Theme.of(context).primaryColor,
//                            width: 2,
//                          ),
//                        ),
//                        padding: EdgeInsets.all(10),
//                        child: Text(
//                          '\$${transactions[index].amount.toStringAsFixed(2)}',
//                          style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                            fontSize: 20,
//                            color: Theme.of(context).primaryColor,
//                          ),
//                        ),
//                      ),
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text(
//                            transactions[index].title,
//                            style: Theme.of(context).textTheme.title,
//                          ),
//                          Text(
//                            DateFormat.yMMMd().format(transactions[index].date),
//                            style: TextStyle(
//                              color: Colors.grey,
//                            ),
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
//                );
        }),
        itemCount: transactions.length,
      ),
    );
  }
}
