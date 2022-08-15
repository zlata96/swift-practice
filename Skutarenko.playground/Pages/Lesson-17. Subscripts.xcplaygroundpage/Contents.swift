let array = ["a", "b", "c"]
array[0] // сабскрипт это обращение к экземпляру по индексу

struct Family {
    var father = "Father"
    var mother = "Mother"
    var kids = ["Kid1", "Kid2", "Kid3"]
    
    var count: Int {
        return 2 + kids.count
    }
    
    subscript(index: Int) -> String? {
        get {
            switch(index) {
            case 0: return father
            case 1: return mother
            case 2..<(2 + kids.count): return kids[index - 2]
            default: return nil
            }
        }
        set {
            let value = newValue ?? ""
            switch(index) {
            case 0: return father = value
            case 1: return mother = value
            case 2..<(2 + kids.count): return kids[index - 2] = value
            default: break
            }
        }
    }
    
    subscript(index: Int, suffix: String) -> String? {
        var name = self[index] ?? ""
        name += " " + suffix
        return name
    }
}

var family = Family()
family.father
family.kids[0]
family.count

family[3]
family[0] = "Daddy"
family[0]
family[3] = "Kate"
family.kids[1]
family[3, "is the great"]!

struct Field {
    var dict = [String: String]()
    
    func key(for column: String, and row: Int) -> String {
        return column + String(row)
    }
    subscript(column: String, row: Int) -> String? {
        get {
            return dict[key(for: column, and: row)]
        }
        set {
            dict[key(for: column, and: row)] = newValue
        }
    }
}

var field = Field()
field["a", 5]
field["a", 5] = "X"
field["a", 5]
field["a", 6]

