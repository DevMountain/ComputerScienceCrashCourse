// Week 5 - Day 1 - Strategy Pattern


// Strategy Pattern

// Let's talk pokemon

// We have to design a program that will represent Pokemon.
// Each Pokemon has an image and when I display that image it just prints that image.
// Each Pokemon has only a way they travel.
// Now let's add one attack to each Pokemon.



class Pokemon {
    var image: UIImage
    var attackStategy: AttackStategy
    var travelStategy: TravelStategy
    
    func display() {
        print(image)
    }
    
    func travel() {
        travelStategy.travel()
    }
    
    func attack() {
        attackStategy.attack()
    }
    
    init(image: UIImage, attackStategy: AttackStategy, travelStategy: TravelStategy) {
        self.image = image
        self.attackStategy = attackStategy
        self.travelStategy = travelStategy
    }
}




// Magikarp - Swim/Splash
// Pikachu - Walk/Thunder
// Pidgey - Fly/Gust
// Spearow - Peck/Gust
// Zaptos - Fly/Thunder








protocol AttackStategy {
    func attack()
    func run()
    func defend()
}

class SplashAttackStategy: AttackStategy {
    func attack() {
        print("Splash, Splash, Splash, Splash...not very effective")
    }
}

class ThunderAttackStategy: AttackStategy {
    func attack() {
        print("Thuuuunder!!!!")
    }
}

class PeckAttackStategy: AttackStategy {
    func attack() {
        print("Peck peck peck peck peck peck peck peck")
    }
}

class GustAttackStategy: AttackStategy {
    func attack() {
        print("Gust....")
    }
}







protocol TravelStategy {
    func travel()
}

class SwimTravelStategy: TravelStategy {
    func travel() {
        print("Just keep swimming...")
    }
}

class WalkTravelStategy: TravelStategy {
    func travel() {
        print("Walk and walk and walk and walk")
    }
}

class FlyTravelStategy: TravelStategy {
    func travel() {
        print("Fly away")
    }
}









let pikachu = Pokemon(image: UIImage(named: "Pikachu"), attackStategy: ThunderAttackStategy(), travelStategy: WalkTravelStategy())

pikachu.attack()
pikachu.travel()
