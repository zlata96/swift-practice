/* есть семья, папа мама и дети
 папа глава семьи
 мама контролирует детей
 
 дети могут вызывать друг друга
 могут просить конфету у мамы
 могут просить у папы игрушку купить
 могут просить друг у друга игрушку
 
 у папы три клоужера
 1 обращается к семье и просить распечатать
 2 распечатать маму
 3 распечатать детей
 
 все должно потом уничтожиться само собой
 */

class Family {
    var members = [String]()
    
    init() {
        print("Create Family")
    }
    
    deinit {
        print("Goodbye Family")
    }
    
    func showFamily() {
        print(members)
    }
}

class Father {
    var mother = Mother()
    weak var kid1: Kid1?
    weak var kid2: Kid2?
    var family = Family()
    
    init() {
        print("Create Father" )
    }
    
    deinit {
        print("Goodbye Father")
    }
    
    func showFamily() {
        family.showFamily()
    }
    
    func showMother() {
        print(mother)
    }
    
    func showKids() {
        print(mother.kid1)
        print(mother.kid2)
    }
}

class Mother {
    var kid1 = Kid1()
    var kid2 = Kid2()
    
    init() {
        print("Create Mother")
    }
    
    deinit {
        print("Goodbye Mother")
    }
}

class Kid {
    
    init() {
        print("Create Kid")
    }
    
    deinit {
        print("Goodbye Kid")
    }
    
    func askKidToy() {
        print("Give me your toy, please")
    }
    
    func askFatherToy() {
        print("Buy a new toy, please")
    }
    
    func askMotherCandy() {
        print("Give me candy, please")
    }
}

class Kid1: Kid {
    weak var kid2: Kid2?
    
    override init() {
        super.init()
        print("Create Kid1")
    }
    
    deinit {
        print("Goodbye Kid1")
    }
}

class Kid2: Kid {
    weak var kid1: Kid1?
    
    override init() {
        super.init()
        print("Create Kid2")
    }
    
    deinit {
        print("Goodbye Kid2")
    }
}

// MARK: DEMO

var playground = true

if playground {
    let father = Father()
    
    father.family.members.append("Father")
    father.family.members.append("Mother")
    father.family.members.append("Kid1")
    father.family.members.append("Kid2")
    father.family.showFamily()
    father.showKids()
    father.showMother()

    print("exit playground")
}

print("end")
