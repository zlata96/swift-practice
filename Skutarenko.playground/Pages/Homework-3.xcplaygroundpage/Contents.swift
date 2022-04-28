var zlataResults = (squat: 50, push: 12, pull: 2)

print("Zlata's squat is \(zlataResults.squat), pull is \(zlataResults.pull), push is \(zlataResults.push)")
print("Zlata's squat is \(zlataResults.0), pull is \(zlataResults.2), push is \(zlataResults.1)")

var bogdanResults = (squat: 75, push: 30, pull: 18)

var zlataResultsDublicate = zlataResults
zlataResults = bogdanResults
bogdanResults = zlataResultsDublicate

var differensBtw = (zlataResults.0 - bogdanResults.0, zlataResults.1 - bogdanResults.1, zlataResults.2 - bogdanResults.2)
print("Bogdan's results greater than Zlata's results squat \(differensBtw.0), push \(differensBtw.1), pull \(differensBtw.2)")
