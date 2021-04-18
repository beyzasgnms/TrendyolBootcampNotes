import UIKit
/*
 Terminalde şunları deneyebilirsin:
 1> let a = 3
 2. let b = 5
 3. print(a+b)
8
a: Int = 3
b: Int = 5
 4> var c = 0
c: Int = 0
 5> c = a + b
 6> print(c)
8
 7>
Apple genellikle let kullanılmasını ister :)
let değişkeninde değişiklik yapamazsın.
*/

var str = "Hello, playground"
str = "Merhaba \n arkadaşlar"
print(str)
/* Ters slash alt satıra inmemizi sağlıyor.
 let _ = "deneme"
 let ? " "merhaba"
 let çağlar = "kerim" Türkçe değişken tanımlayabilirsin
 
*/
let 🧸 = "ayıcık"
let 👩🏼‍💻 = "beyzos"
let icon = "\u{1f44d}"
let x : Int = 2
let a : Double = 3
print(a)
print("Merhaba ben Swift /(a) kullanıyorum")
let y: Character = "y"
let z: Character = "z"
/*
name: String
lastName: String
address: String
 
 Adresi optional olarak tanımlamalıyız, çünkü dolu ya da boş olacağına dair bilgi yok.

*/
let name : String?
name = "Beyza"
print(name ?? "-")
name?.count
var isim = "Merhaba"

for item in isim{
    print(item)
}
isim.first
isim.last
let x1 = 4.2
let x2 = 3
/* print(x1 + x2) int ve double toplayamazsın. Birinden
birini cast etmen gereklidir. */

print(x1 + Double(x2))
String(x1)
print("Merhaba \(x1)")

//If else
var version = 13
let myVersion = 5
if version > 13{
    print("SwiftUI kullanılabilir")
}else if version == 12{
    print("Beklemelisin")
}else{
    print("Hangi çağdasın bro")
}

//Ternary if
//13 ise true, değilse false atayacak
//let version = DEGER ? DOGRU ISE ALACAGI DEGER : YANLIS ISE ALACAGI DEGER
//willSet, didSet
var myValue = 3 {
    willSet{
        print("Will set \(newValue) Eski değerim \(myValue)")
    }
    didSet{
        print("Did set \(myValue) Eski değerim \(oldValue)")
        
    }
}
myValue = 6

//tuples: öğeleri birden fazla liste halinde tutabildiğin yapıdır.
let tuples = ("1", 2)
print(tuples.0)
print(tuples.1)
//dictionary ve obje yapısını andırıyor.
let namesTuples = (first:1, middle: "Ali", last: 3)
namesTuples.first
namesTuples.middle
namesTuples.last

let coord = (x:3, y:5)
coord.x
coord.y

var numberTuples : (optionalFirst: Int?, middle: String, last: Int)?
numberTuples = (nil, "Başak", last:23)

//Soru 1: Merkezi (0,0) raidus: 1 olan birim çember
let birimCember = (x:0,y:0,r:1)
typealias  Circle = (center: (x:CGFloat, y:CGFloat), radius:CGFloat)
let unitCircle : Circle = ((0.0, 0.0), 1)

var a1 = 3
var b1 = 5
var c1 = 2
var d1 = 7
(a1,b1,c1,d1) = (b1,a1,d1,c1)
print(a1)

//Girilen tarihi tarih ve saatini ayrı veren bir fonksiyon yaz.
//func parseDateWatch() ->
func sayHi(){
    print("Merhaba")
}
func sum(k : Int, l : Int){
    print(k + l)
}
sayHi()
sum(k:3, l:4)

func multiply(x:Int, y:Int)-> Int{
    return x*y
}
multiply(x: 2, y: 5)


// Geri dönüş değeri tuple olan bir fonksiyon tanımlanabilir.func parse()-> (first,last)

var pi = 3.14
class Circle2{
    var radius = 0.0
    var perimeter: Double {
        get{
            2 * pi * radius
        }
        set{
            radius = newValue / (pi*2)
        }
    }
}
let circle = Circle2()
circle.radius = 1
print(circle.perimeter)
circle.perimeter = 14
print(circle.radius)

//Split
let startDate = "23:51"
//components methodu karakter,string bölebiliyor.
let dateArray = startDate.components(separatedBy: ":")
let text = "kerim"
text.uppercased()
//boolean
let ax = true
//array
//Boş array tanımı aşağıdaki oluşturulabilir.
var stringArray: [String] = []
var stringArray2 = [String]()
var stringArray3 = Array<String>()
stringArray.append("ahmet")
print(stringArray)
Array(repeating: "Ali", count: 3)
let matris = [
[1,2,3],
[4,5,6]
]
//var cities = ["İzmir", "Edirne", "Tekirdağ", "Mersin", "İzmit"]
//cities.remove(at: 2)
//print(cities)

//cities.sorted()

var numberArray = [37,5,6,92,10,73]
numberArray.max()
numberArray.min()

var cities = ["İzmir", "Edirne", "Tekirdağ"]
let numberAndCities = zip(numberArray, cities)
print(numberAndCities)


//filter, map, flatmap, reduce
//switch case tuples
/*
let switchTuple = (firstCase:true, secondCase:false)

switch switchTuple{
case(true,false):
    //do something
case(true, true):
    //do
case(false,true):
//code
case(false,false):
}
 
 */
//SET
var colors = Set<String>()
var myColors: Set<String> = ["Mavi", "Siyah", "Yeşil", "Mavi"]
//küme özelliği olarak tekrarlayan ifadeyi tek algilar
myColors.count
//Setler unordered yapılar, ama 5.4 ile orderedSet yapısı gelecek.. Mülakatlarda soruluyor.
//Set nedir? birden fazla değer yapısı olamaz, underored, hashable yapısına uygun.
//kesisim(intersection)
//birlesim(union)
//fark(?)exculisiveor

var animals: Set<String> = ["Kedi", "Jaguar","Kartal", "Panda"]
var cars: Set<String> = ["Kartal", "Panda", "Audi", "BMW"]
let instersect1 = animals.intersection(cars)
let instersect2 = cars.intersection(animals)
let union = cars.union(animals)
let union2 = animals.union(cars)
union.count
let xor = cars.symmetricDifference(animals)
let sub1 = animals.subtracting(cars)

var myCars: Set<String> = ["Kartal", "Panda"]
myCars.insert("String")
let isSubSet = animals.isSubset(of: cars)
let isSubSet2 = myCars.isSubset(of: cars)
//zip
//Set
//dictionary, unordered yapıda ---swift 5.4 ile ordered yapı geliyor.
var hayvanlar1 : Dictionary<String,String> = Dictionary<String,String>()

var hayvanlar2 = [String: String]()
var hayvanlar3 : [String:String] = [:] //boş olduğunu belirtmek için
var hayvanlar : [String:String] = ["Karabaş":"Köpek", "Cicikuş":"Papağan", "Limon":"Kedi"]
hayvanlar["Karabaş"]

for hayvan in hayvanlar.keys{
    print(hayvan)
}

hayvanlar["Karabaş"] = "At"
print(hayvanlar)

//Any Hashable: tipten bağımsız hale gelmemizi sağlıyor.

//Dictionary AnyHashable

let description : [AnyHashable: Any] =  [
    42: "an Int",
    ["a", "b"] as Set: "a set of strings"
]
print(description[42]!)

//Inout, bir mülakatta sorulmuş, & işareti değiştirmemizi sağladı.
func doubleInPlace(number: inout Int){
    number *= 2
}
var myNum = 10
doubleInPlace(number: &myNum)
print(myNum)

func updateValue(value:inout Int){
//defaultunda let olarak görüyor. value += 1
//value:Int önüne inOut yazarsak artık hata vermez
    value += 1
}
//Variadic
func sum2(w:Int, e:Int,m:Int, n: Int) -> Int{
    return w + e
}
sum2(w:2, e:3, m:6, n:7)
//numbers:Int ... ile birden fazla değer gireceğini anlıyor.
func sum3(numbers:Int ...) -> Int{
    return numbers.reduce(0, +)
}
sum3(numbers: 1,2,3,4,5)

//closures(blocks,python lambdas denk geliyor) () -> (), () -> Void
//şurada güzel açıklamış:
/*https://medium.com/@emregrses/swift-fonksiyonlarından-closures-9b28c104b1e5
//Hiçbir şey almayan hiçbir şey döndürmeyen tip
*/
let merhaba = {
    print("Merhaba")
}

merhaba()
//(Int,Int) -> Int
let add = { (x:Int, y:Int) -> Int in
    return x+y
}
add(2,3)
let divide = { ( x:Int, y:Int) throws -> Int in
    if y == 0{
        print("...")
    }
    return x/y
}
/*İlk haftalık notlar bunlardı. Closures pek oturmadı,
 daha önce denk gelmediğim bir yapı. Onun dışında dictionary
 kullanımıyla alakalı pratik yapabilirsin.*/

/*Ödev
 1-Elimizde sadece harflerden oluşan
 noktalam işaret veya sayılar yok,
 uzun stringler olsun. Bu stringler içinde bazı harflerin tekrar edeceğini düşün. Mesela a harfi 20 farklı yerde geçiyor.
 Bir fonksyion yaz, 3 parametresi yolladığında eşit ve fazla olanları silsin, örneğin a için 20 tane olduğundan dolayı 17 tanesini silecek.
Örnek string "aaba kouq bux"
 Tekrar sayısı 2 verildiğinde:
a, b , u silecek ve ekrana "koq x"(boşluk da olacak) basacak.
Tekrar sayısı 3 verildiğinde
"b kouq bux" basacak
String ve tekrar sayısını parametre olarak al */

/*Ödev2
 Elimizde uzun bir cümle olsun, bazı kelimeler tekrar edecek bir cümle düşünün. İstediğimiz ise, hangi kelimeden kaç tane kullanıldığını bulmamız.
 string = "merhaba nasılsınız . iyiyim siz nasılsınız . ben de iyiyim."
 merhaba:1
 nasılsınız:2
 iyiyim: 2
 */
