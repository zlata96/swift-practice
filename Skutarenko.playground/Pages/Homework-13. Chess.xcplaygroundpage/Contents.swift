// TASK 1: Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур

enum Name: String {
    case pawn
    case rook
    case knight
    case bishop
    case king
    case queen
    case square // пустая клетка
}

enum Color: String {
    case white
    case black
}

enum CoordinateOne: String, CaseIterable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
}

enum CoordinateTwo: String, CaseIterable {
    case a
    case b
    case c
    case d
    case e
    case f
    case g
    case h
}

struct Coordinate {
    var lineX: CoordinateOne
    var lineY: CoordinateTwo
    
    init (lineX: CoordinateOne, lineY: CoordinateTwo) {
        self.lineX = lineX
        self.lineY = lineY
    }
}

struct Figure {
    var name: Name
    var color: Color
    var coordinate: Coordinate
    
    init(name: Name, color: Color, coordinate: Coordinate){
        self.name = name
        self.color = color
        self.coordinate = coordinate
    }
        
}

// TASK 2: Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.

func whereIsYourFigure(figures: [Figure]) {
    for figure in figures {
        print(figure.color.rawValue, figure.name.rawValue, figure.coordinate.lineX.rawValue, figure.coordinate.lineY.rawValue)
    }
    print("\n")
}

let figureArray = [blackKing, whiteKing, whiteRock1, whiteRock2]
whereIsYourFigure(figures: figureArray)

// TASK 3: Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
 
func createEmptyDesk() -> [Figure] {
    var desk = [Figure]()
    var value =  true
    for i in 0...7 {
        value.toggle()
        for j in 0...7 {
            value.toggle()
            desk.append(
                Figure(
                    name: .square,
                    color: value ? .white : .black,
                    coordinate: Coordinate(lineX: .allCases[i], lineY: .allCases[j])
                )
            )
        }
    }
    return desk
}

func getUnicode(of figure: Figure) -> String {
    switch figure.name {
        case .pawn: return figure.color == .white ? "♙ " : "♟ "
        case .rook: return figure.color == .white ? "♖ " : "♜ "
        case .knight: return figure.color == .white ? "♘ " : "♞ "
        case .bishop: return figure.color == .white ? "♗ " : "♝ "
        case .king: return figure.color == .white ? "♔ " : "♚ "
        case .queen: return figure.color == .white ? "♕ " : "♛ "
        case .square: return ""
    }
}

func show(_ desk: [Figure]) {
    var output = ""
    var i = 1
    
    for figure in desk {
        if figure.name != .square {
            output.append(getUnicode(of: figure))
        } else {
            figure.color == .white ? output.append("\u{25A1} ") : output.append("\u{25A0} ")
        }

        // Новая линия
        if i % 8 == 0 {
            output += "\n"
        }
        i += 1
    }
    print(output)
    print("--------------")
}

func put(_ figure: Figure, in desk: inout [Figure]) {
    for i in 0...desk.count - 1 {
        if figure.coordinate.lineX == desk[i].coordinate.lineX && figure.coordinate.lineY == desk[i].coordinate.lineY {
            desk[i] = figure
        }
    }
}

// TASK 4: Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.

func getSquare(by coordinate: Coordinate, in desk: [Figure]) -> Figure? {
    for square in desk {
        if square.coordinate.lineX == coordinate.lineX && square.coordinate.lineY == coordinate.lineY {
            return square
        }
    }
    return nil
}

func getIndex(by coordinate: Coordinate, in desk: [Figure]) -> Int? {
    for i in 0...desk.count-1 {
        if desk[i].coordinate.lineX == coordinate.lineX && desk[i].coordinate.lineY == coordinate.lineY {
            return i
        }
    }
    return nil
}

func getColor(by coordinate: Coordinate, in desk: [Figure]) -> Color {
    let emptyDesk = createEmptyDesk()
    let index = getIndex(by: coordinate, in: emptyDesk)!
    return emptyDesk[index].color
}

func move(_ figure: Figure, to coordinate: Coordinate, in desk: inout [Figure]) {
    // Нашли что на той координате, куда хотим потом двигать
    let square = getSquare(by: coordinate, in: desk)!
    // Находим индекс в массиве по координате
    let nextIndex = getIndex(by: coordinate, in: desk)!
    // Проверяем, пустая ли там клетка
    if square.name == .square {
        desk[nextIndex].name = figure.name
        desk[nextIndex].color = figure.color
        
        // Возвращаем предыдущей клетке исходное значение
        let prevCoordinate = Coordinate(lineX: figure.coordinate.lineX, lineY: figure.coordinate.lineY )
        let prevIndex = getIndex(by: prevCoordinate, in: desk)!
        desk[prevIndex].name = .square
        desk[prevIndex].color = getColor(by: prevCoordinate, in: desk)
    } else {
        print("Error")
    }
}

// MARK: DEMO

var blackKing = Figure(name: .king, color: .black, coordinate: Coordinate(lineX: CoordinateOne.eight, lineY: CoordinateTwo.h))
var whiteKing = Figure(name: .king, color: .white, coordinate: Coordinate(lineX: CoordinateOne.one, lineY: CoordinateTwo.d))
var whiteRock1 = Figure(name: .rook, color: .white, coordinate: Coordinate(lineX: CoordinateOne.seven, lineY: CoordinateTwo.b))
var whiteRock2 = Figure(name: .rook, color: .white, coordinate: Coordinate(lineX: CoordinateOne.six, lineY: CoordinateTwo.a))

var desk = createEmptyDesk()

put(blackKing, in: &desk)
put(whiteRock1, in: &desk)
show(desk)

move(blackKing, to: Coordinate(lineX: .five, lineY: .e), in: &desk)
show(desk)

move(blackKing, to: Coordinate(lineX: .seven, lineY: .b), in: &desk)
show(desk)

