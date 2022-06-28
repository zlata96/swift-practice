// TASK 1: Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур

enum ChessName: String {
    case pawn
    case rook
    case knight
    case bishop
    case king
    case queen
    case square // пустая клетка
}

enum ChessColor: String {
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

typealias Coordinate = (CoordinateOne, CoordinateTwo)
typealias ChessFigure = (ChessName, ChessColor, CoordinateOne, CoordinateTwo)

// TASK 2: Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.

func whereIsYourFigure(chessFigure: [ChessFigure]) {
    for figure in chessFigure {
        print(figure.1.rawValue, figure.0.rawValue, figure.2.rawValue, figure.3.rawValue)
    }
    print("\n")
}

let figureArray = [blackKing, whiteKing, whiteRock1, whiteRock2]
whereIsYourFigure(chessFigure: figureArray)

// TASK 3: Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
 
func createEmptyChessDesk() -> [ChessFigure] {
    var chessTable = [ChessFigure]()
    var value =  true
    for i in 0...7 {
        value.toggle()
        for j in 0...7 {
            value.toggle()
            chessTable.append(
                ChessFigure(
                    ChessName.square,
                    value ? ChessColor.white : ChessColor.black,
                    CoordinateOne.allCases[i],
                    CoordinateTwo.allCases[j]
                )
            )
        }
    }
    return chessTable
}

func getUnicode(of figure: ChessFigure) -> String {
    switch figure.0 {
        case .pawn: return figure.1 == .white ? "♙ " : "♟ "
        case .rook: return figure.1 == .white ? "♖ " : "♜ "
        case .knight: return figure.1 == .white ? "♘ " : "♞ "
        case .bishop: return figure.1 == .white ? "♗ " : "♝ "
        case .king: return figure.1 == .white ? "♔ " : "♚ "
        case .queen: return figure.1 == .white ? "♕ " : "♛ "
        case .square: return ""
    }
}

func show(_ desk: [ChessFigure]) {
    var output = ""
    var i = 1
    
    for figure in desk {
        if figure.0 != .square {
            output.append(getUnicode(of: figure))
        } else {
            figure.1 == .white ? output.append("\u{25A1} ") : output.append("\u{25A0} ")
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

func put(_ figure: ChessFigure, in table: inout [ChessFigure]) {
    for i in 0...table.count - 1 {
        if figure.2 == table[i].2 && figure.3 == table[i].3 {
            table[i] = figure
        }
    }
}

// TASK 4: Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.

func getSquare(by coordinate: Coordinate, in table: [ChessFigure]) -> ChessFigure? {
    for square in table {
        if square.2 == coordinate.0 && square.3 == coordinate.1 {
            return square
        }
    }
    return nil
}

func getIndex(by coordinate: Coordinate, in table: [ChessFigure]) -> Int? {
    for i in 0...table.count-1 {
        if table[i].2 == coordinate.0 && table[i].3 == coordinate.1 {
            return i
        }
    }
    return nil
}

func getColor(by coordinate: Coordinate, in table: [ChessFigure]) -> ChessColor {
    let emptyDesk = createEmptyChessDesk()
    let index = getIndex(by: coordinate, in: emptyDesk)!
    return emptyDesk[index].1
}

func move(_ figure: ChessFigure, to coordinate: Coordinate, in table: inout [ChessFigure]) {
    // Нашли что на той координате, куда хотим потом двигать
    let square = getSquare(by: coordinate, in: table)!
    // Находим индекс в массиве по координате
    let nextIndex = getIndex(by: coordinate, in: table)!
    // Проверяем, пустая ли там клетка
    if square.0 == .square {
        table[nextIndex].0 = figure.0
        table[nextIndex].1 = figure.1
        
        // Возвращаем предыдущей клетке исходное значение
        let prevCoordinate = (figure.2, figure.3)
        let prevIndex = getIndex(by: prevCoordinate, in: table)!
        table[prevIndex].0 = .square
        table[prevIndex].1 = getColor(by: prevCoordinate, in: table)
    } else {
        print("Error")
    }
}

// MARK: DEMO

var blackKing: ChessFigure = (ChessName.king, ChessColor.black, CoordinateOne.eight, CoordinateTwo.h)
var whiteKing: ChessFigure = (ChessName.king, ChessColor.white, CoordinateOne.one, CoordinateTwo.d)
var whiteRock1: ChessFigure = (ChessName.rook, ChessColor.white, CoordinateOne.seven, CoordinateTwo.b)
var whiteRock2: ChessFigure = (ChessName.rook, ChessColor.white, CoordinateOne.six, CoordinateTwo.a)

var desk = createEmptyChessDesk()

put(blackKing, in: &desk)
put(whiteRock1, in: &desk)
show(desk)

move(blackKing, to: (CoordinateOne.five, CoordinateTwo.e), in: &desk)
show(desk)

move(blackKing, to: (CoordinateOne.seven, CoordinateTwo.b), in: &desk)
show(desk)
