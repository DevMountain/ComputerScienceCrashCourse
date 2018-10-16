// Week 5 - Day 4 - Abstract Factory Pattern


// 1. The Abstract Factory Pattern
// 2. The Problem - You have multiple versions of _________ that you need to create.

// Porsche, Volkswagen, Audi

protocol Car {
    func drive()
}

protocol AbstractSports: Car {
    
}

protocol AbstractSedan: Car {
    
}

class AudiSports: AbstractSports {
    func drive() {
        print("You're driving an Audi Sports Car")
    }
}

class AudiSedan: AbstractSedan {
    func drive() {
        print("You're driving an Audi Sedan")
    }
}

class VolkswagenSports: AbstractSports {
    func drive() {
        print("You're driving an Volkswagen Sports Car")
    }
}

class VolkswagenSedan: AbstractSedan {
    func drive() {
        print("You're driving an Volkswagen Sedan")
    }
}

class PorscheSports: AbstractSports {
    func drive() {
        print("You're driving an Porsche Sports Car")
    }
}

class PorscheSedan: AbstractSedan {
    func drive() {
        print("You're driving an Porsche Sedan")
    }
}





// Porsche, Volkswagen, Audi

protocol AbstractCarFactory {
    func buildSport() -> AbstractSports
    func buildSedan() -> AbstractSedan
}

class AudiFactory: AbstractCarFactory {
    func buildSport() -> AbstractSports {
        return AudiSports()
    }
    func buildSedan() -> AbstractSedan {
        return AudiSedan()
    }
}

class VolkswagenFactory: AbstractCarFactory {
    func buildSport() -> AbstractSports {
        return VolkswagenSports()
    }
    func buildSedan() -> AbstractSedan {
        return VolkswagenSedan()
    }
}

class PorscheFactory: AbstractCarFactory {
    func buildSport() -> AbstractSports {
        return PorscheSports()
    }
    func buildSedan() -> AbstractSedan {
        return PorscheSedan()
    }
}







var carFactory: AbstractCarFactory = PorscheFactory()
let sedan = carFactory.buildSedan()
let sports = carFactory.buildSport()
sedan.drive()
sports.drive()
carFactory = AudiFactory()
let newSedan = carFactory.buildSedan()
newSedan.drive()


//class SuperCarFactory {
//    func buildSport() -> AbstractSports {
//        return AbstractSports()
//    }
//    func buildSedan() -> AbstractSedan {
//        return AbstractSedan()
//    }
//}
//
//class AudiFactory: SuperCarFactory {
//    override func buildSport() -> AbstractSports {
//        return AudiSports()
//    }
//    func buildSedan() -> AbstractSedan {
//        return AudiSedan()
//    }
//}
//
//class VolkswagenFactory: SuperCarFactory {
//    func buildSport() -> AbstractSports {
//        return VolkswagenSports()
//    }
//    func buildSedan() -> AbstractSedan {
//        return VolkswagenSedan()
//    }
//}
//
//class PorscheFactory: SuperCarFactory {
//    func buildSport() -> AbstractSports {
//        return PorscheSports()
//    }
//    func buildSedan() -> AbstractSedan {
//        return PorscheSedan()
//    }
//}
