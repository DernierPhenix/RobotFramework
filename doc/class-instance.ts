abstract class Animal {
  id: number;
  name: string;
  legs: number = 4;
  age: number = 0;

  static mapropiete: string;

  constructor(name: string) {
    this.name = name;
  }

  save() {
      
  }

  delete() {
    // supprimer avec l'identifiant this.id
  }

  static delete(id: number) {
    // supprimer avec l'id fourni en paramètre
  }
}

class Chien extends Animal {
  constructor(name: string) {
    super(name);
  }
}

class Oiseau extends Animal {
  override legs = 2;
}

let chien1 = new Chien('Laïka');
chien1.age = 3;
chien1.save();
chien1.delete();

Chien.delete(1424234);