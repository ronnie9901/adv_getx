

class  CrudModel{


  late int id ;
  late String  name,degingatiom;

  CrudModel(this.id, this.name, this.degingatiom);

  factory CrudModel.fromap(Map m1){
    return CrudModel(m1['id'], m1['name'], m1['degingatiom']);

  }
}