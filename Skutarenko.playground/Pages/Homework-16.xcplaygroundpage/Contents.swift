//создаем тип комната(есть длина и ширина)
//создаем тип персонаж  с координатами
//реализовать функцию, которая распечатывает комнату и персонажа в ней
//добавить персонажа в метод идти, показываем все в консоли
//не можем выходить за пределы комнаты
//создать ящик, у которого есть х и у и он не может покидать пределы
//персонаж мог доходить до ящика и двигать его
//добавить цель (точку куда дотащить)
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

enum Name: String {
    case character = "🧑"
    case box = "📦"
    case square = "⬜"
    case destination = "❌"
    case courier = "🚚"
    case gameOver = "❤️"
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

class Board {
    var cells: [Cell] = []
    
    init() {
        createBoard()
    }
    
    func createBoard() {
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
    
    func findCharacterOrCourierIndex() -> Int {
        var index = 0
        for (i, cell) in cells.enumerated() {
            if cell.name == .character || cell.name == .courier {
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
    
    func create(_ name: Name, by coordinate: Coordinate) {
        let i = findIndex(by: coordinate)
        if cells[i].name == .square {
            cells[i].name = name
        } else {
            print("Choose new cell")
        }
    }
    
    func move(directions: [Direction]) {
        for direction in directions {
            // Находим текущий индекс персонажа или курьера
            let currentIndex = findCharacterOrCourierIndex()
            // Определяем персонаж или курьер находится на текущей клетке
            var currentName = cells[currentIndex].name
            var nextCoordinate = cells[currentIndex].coordinate
            switch direction {
            case .left:
                nextCoordinate.x -= 1
            case .right:
                nextCoordinate.x += 1
            case .up:
                nextCoordinate.y -= 1
            case .down:
                nextCoordinate.y += 1
            }
            // На старой клетке возвращаем белый квадрат
            cells[currentIndex].name = .square
            // Завершение игры
            if cells[findIndex(by: nextCoordinate)].name == .destination {
                gameOver()
            }
            // Если дошли до коробки, то персонаж становится курьером
            if cells[findIndex(by: nextCoordinate)].name == .box {
                currentName = .courier
            }
            // Изменяем имя клетки, на которую перемещаем персонажа или курьера
            cells[findIndex(by: nextCoordinate)].name = currentName
            // Показываем каждый шаг
            show()
        }
    }
    
    func gameOver() {
        for i in 0...cells.count - 1 {
            if cells[i].name == .square {
                cells[i].name = .gameOver
            }
        }
        print("    GAME OVER")
    }
}


// MARK: DEMO

var board = Board()
board.create(.character, by: Coordinate(x: 4, y: 3))
board.create(.box, by: Coordinate(x: 2, y: 5))
board.create(.destination, by: Coordinate(x: 3, y: 7))

board.show()

board.move(directions: [.left, .left, .down, .down])
board.move(directions: [.right, .down, .down])


