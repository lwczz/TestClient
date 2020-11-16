import 'package:sqljocky5/connection/connection.dart';
import 'package:sqljocky5/connection/settings.dart';

class dataQuery{

  String query;

  dataQuery(this.query);

}


MySqlConnection conn;

initDB() async{

  var s = ConnectionSettings(
    user: "WC",//todo:Username
    password: "WC123456",//todo:User Password
    host: "202.186.224.125",//todo:Host
    port: 3306,//todo:Port
    db: "FYP",//todo:DB Name
  );

  await MySqlConnection.connect(s).then((_){
    conn=_;
    print('连接成功');
  });

}



insert(String query,List list) async{


  await conn.prepared(query, list).then((_){

    print('新增id${_.insertId}');

  });
}

delete() async{

  await conn.prepared('DELETE FROM Customers WHERE Customers_Id = ?', [
    'CSM1'
  ]);

}

update() async{

  await conn.prepared('UPDATE Peoples SET Peoples_Name = ? WHERE Peoples_Id = ?', [
    'abd','PPL1'
  ]).then((_){
    print('SUCCESSFUL');
  });
}

