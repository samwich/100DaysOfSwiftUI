import Foundation

// 100 Days of SwiftUI Checkpoint 7

class Animal {
    let legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("barks generically")
    }
}

class Corgi: Dog {
    override func speak() {
        print("british bark")
    }
}

class Poodle: Dog {
    override func speak() {
        print("french bark")
    }
}

class Cat: Animal {
    var isTame: Bool
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    func speak() {
        print("mew")
    }
}

class Persian: Cat {
    init() {
        super.init(isTame: true)
    }
    override func speak() {
        print("meow")
    }
}

class Lion: Cat {
    init() {
        super.init(isTame: false)
    }
    
    override func speak() {
        print("roar")
    }
}
