//создаем тип комната(есть длина и ширина)
//создаем тип персонаж  с координатами
//реализовать функцию, которая распечатывает комнату и персонажа в ней
//
//добавить персонажа в метод идти, показываем все в консоли
//не можем выходить за пределы комнаты
//
//создать ящик, у которого есть х и у и он не может покидать пределы
//
//персонаж мог доходить до ящика и двигать его
//
//добавить цель (точку куда дотащить)
//
//создать массив ящиков можно

struct Coordinate: Equatable {
    static let minCoordinate = 0
    static let maxCoordinate = 7
    
    var x: Int {
        willSet {
            if newValue < Coordinate.minCoordinate {
                self.x = Coordinate.minCoordinate
            } else if newValue > Coordinate.maxCoordinate {
                self.x = Coordinate.maxCoordinate
            }
        }
    }
    
    var y: Int {
        willSet {
            if newValue < Coordinate.minCoordinate {
                self.y = Coordinate.minCoordinate
            } else if newValue > Coordinate.maxCoordinate {
                self.y = Coordinate.maxCoordinate
            }
        }
    }
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

enum Name: String, CaseIterable {
    case character = "🧑"
    case box = "📦"
    case square = "⬜"
    case destination = "❌"
    case courier = "🚚"
}

enum Direction {
    case left
    case right
    case up
    case down
}

struct Cell {
    var name: Name
    var coordinate: Coordinate
}

struct Board {
    var cells: [Cell] = []
    
    mutating func createBoard() {
        for i in 0...7 {
            for j in 0...7 {
                cells.append(
                    Cell(
                        name: .square,
                        coordinate: Coordinate(x: j+1, y: i+1)
                    )
                )
            }
        }
    }
    
    mutating func create(_ name: Name) {
        let randomIndex = Int.random(in: 0...cells.count-1)
        if cells[randomIndex].name == .square {
            cells[randomIndex].name = name
        } else {
            create(name)
        }
    }
    
    func show() {
        var output = ""
        
        for (index, cell) in cells.enumerated() {
            output.append(cell.name.rawValue)
            
            // Новая линия
            if (index + 1) % 8 == 0 {
                output += "\n"
            }
        }
        
        output += "-----------------"
        print(output)
    }
    
    func findCharacterIndex() -> Int {
        var index = 0
        for (i, cell) in cells.enumerated() {
            if cell.name == .character {
                index = i
            }
        }
        return index
    }
    
    func findIndex(by coordinate: Coordinate) -> Int {
        var index = 0
        for (i, cell) in cells.enumerated() {
            if cell.coordinate == coordinate {
                index = i
            }
        }
        return index
    }
    
    mutating func move(directions: [Direction]) {
        for direction in directions {
            // Находим текущую клетку где стоит персонаж
            let currentCharacterIndex = findCharacterIndex()
            var nextCoordinate = cells[currentCharacterIndex].coordinate
            switch direction {
            case .left:
                nextCoordinate.x -= 1
            case .right:
                nextCoordinate.x += 1
            case .up:
                nextCoordinate.y += 1
            case .down:
                nextCoordinate.y -= 1
            }
            // На новой клетке делаем персонажа
            cells[findIndex(by: nextCoordinate)].name = .character
            // На старой клетке возвращаем белый квадрат
            cells[currentCharacterIndex].name = .square
            // Показываем каждый шаг
            show()
        }
    }
}


// MARK: DEMO

var board = Board()
board.createBoard()
board.create(.character)
board.create(.box)
board.create(.destination)

board.show()

board.move(directions: [.right, .right, .right])

