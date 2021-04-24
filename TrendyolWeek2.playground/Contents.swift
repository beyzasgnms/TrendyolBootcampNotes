import UIKit

// Hafta 2

//İsmi olmayan, parametre alıp geriye değer döndürebilen, bir değişkene atanabilen, bir fonksiyona ise parametre olarak geçilebilen kod bloğudur.

let sayHi = {
    print("Merhaba")
}
sayHi()

let sayHi2: (String) -> () = {name in print("Merhaba \(name)")}

sayHi2("Başak")

let compare: (Int,Int) -> Bool = {(x,y) in return x<y}
compare(2,5)

let ornek:(Int,Int) -> Int = {(x,y) in x-y}
ornek(5,3)

let names = ["Beyza","Murat","Başak","Ata", "Yavuz" ]
let sortedNames = names.sorted{(x:String, y:String) -> Bool in return x>y}
let sortedNames2 = names.sorted{(x,y)->Bool in return x<y}
let sortedNames3 = names.sorted{$0 < $1}
let sortedNames4 = names.sorted(by: >)

//Bir fonksiyona parametre olarak closure verme
let exampleClosure = { print("MyClosure run..")}

func myFunc(myClosure:()->Void){
    print("My Function start...")
    myClosure()
    print("My Function end...")
}
myFunc(myClosure: exampleClosure)
//Hem String hem Void döndü!! Buraya dikkat şu kullanımı sağladı: let result2: Void = buy()("sabun")

func buy() -> (String) -> Void {
    return{
        print("\($0) satın aldım")
    }
}
let result = buy()
let result2: Void = buy()("sabun")
result("zeytin")
    
/*Completion Error(en çok kullanacağımız closure türüymüş,
Http gibi uzun istekler için, isteğin tamamlanmasından hemen sonra bir şeyler yapmak istiyorsak...
 Sürecin devamı edip etmediğini birden çok kez kontrol etmek maliyetli olacaktır, bunu çözmek için completion handler kullanabilirsin.
 İşlem tamamlanır tamamlanmaz geri çağıran bir closure..
 */
//İstek oluşturduk () demek void dönecek demek.
let handler : (Data?, URLResponse?, Error?) -> () = {
    data,response,error in
    print(String(data: data!, encoding: .utf8)!)
}
let url = "https://www.trendyol.com"
let myUrl = URL(string: url)
//let task = URLSession.shared.dataTask(with: myUrl!, completionHandler: handler)
//task.resume()

let task = URLSession.shared.dataTask(with: myUrl!){data,response,error in print(String(data:data!, encoding: .utf8)!)}
//Enum genel tanım
enum Direction{
    case right
    case left
    case top
    case down
}
enum Direction2{
    case right,left,top,down
}
let leftSide = Direction.left
let rightSide = Direction.right
let back = Direction.left
let updown: Direction = .down

enum Numbers: Int { case One = 1, Two, Three, Four, Five}

let five = Numbers.Five
print(five.rawValue)

enum Hata: Error{
    case sunucuHatasi(sebep:String)
    case kullaniciHatasi(sebep:String)
    
}
let hata = Hata.kullaniciHatasi(sebep: "Kullanıcı hatasıdır")
print(hata)

enum Cities:String{
    case İzmir = "Boyoz"
    case Edirne = "Ciğer"
    case Balıkesir = "Höşmerim"
    case Mugla = "Deniz, Kum, Güneş"
    case Aydin = "incir"
}
let city = Cities.Aydin
print(city.rawValue)

//enumların init fonksiyonu vardır
enum GrainsError: Error {
        case inputTooHigh(String)
        case inputTooLow(String)
        init(_ input: Int) {
            let message = "Input[\(input)] invalid. Input should be between 1 and 64 (inclusive)"
            self = input <= 0 ? .inputTooLow(message) : .inputTooHigh(message)
        }
    }
func move(direction:Direction){
    print("my character moving to \(direction)")

}
move(direction: .down)

let direction = Direction.right
switch direction{
case.down:print("down")
case.left:print("left")
case.right:print("right")
case.top:print("top")
}
//Oyun için dönme açıları ile ilgili bir switch case yapısı
enum Orchesta{
    enum Keyboards{
        case piano
        case synth
    }
    enum Strings{
        case violin
        case cello
    }
    enum Percussion{
        case drum
        case bell
    }
}
let instrument1 = Orchesta.Keyboards.piano
let instrument2 = Orchesta.Percussion.bell
let instrument3 = Orchesta.Strings.cello

//Optionals
var text:String? = nil
//var text2:String = text!
var number: Int? = 5

if let mySafeNumber = number{
    print("number: \(mySafeNumber)")
}else{
    print("number was not assigned value")
}

var sehir:String?
print(sehir ?? "-")
if let il = sehir {
    print("İlin ismi: \(il)")
}
else{
    print("Değer okunamadı")
}
 
struct Member{
    var name:String?
    var email:String?
    var password:Int?
}
var member = Member(name:"Kerim",email:"kerim.caglar@gmail.com",password:nil)

func getMember(member: Member){
    if let name = member.name, let email = member.email, let password = member.password{
        print(name)
        print(email)
        print(password)
    }else{ print("Verileriniz okunamadı")}
}
getMember(member: member)

//Guard let ile değişkeni dışarda kullanmaya devam edebiliyoruz. Hatayı başta yakalıyor. Early Exit olarak da geçer.
func uyeGetir(uye:Member){
    guard let name = uye.name, let email = uye.email, let password = uye.password else{
        return
    }
    print(name)
    print(email)
    print(password)
}
let uye = Member(name:"Beyza",email:"beyzasgnms@gmail.com", password: nil)
uyeGetir(uye: uye)
//Error Handling(try,try?,try!)
//ilk try örneğimiz Do Catch ile kullanılıyor.
enum NameError: Error{
    case tooLong //tooShort'da yapabilirdin
    case tooLong2
}
func nameValidation(name:String) throws -> String{
    if name.count > 8{
        throw NameError.tooLong
    }else{
        return name
    }
}
func surnameValidation(surname:String) throws -> String{
    if surname.count > 8{
        throw NameError.tooLong2
    }else{
        return surname
    }
}

do{
    _ = try nameValidation(name: "Hüseyin")
    _ = try surnameValidation(surname: "uzunbişey")
    print("Name is valid..")
}catch NameError.tooLong{
    print("Name is too long.")
}catch NameError.tooLong2{
print("Surname is too long.")
}
//Try? örneği
if (try? nameValidation(name:"beyza")) != nil{
    print("Name is valid 2")}
else{
    print("name is too long2")
}
//try! ben hata yakalarsam bozuluyoreeee

//let refult = try! nameValidation(name: "beyzaaaaa")

//hesap makinesi simülasyon

var screen = "0.0"
enum CalculateError:Error{
    case nanError //O%0
    case InfError //0 a bölme
    case baseCase //Bölünen 0 ise
}
func bolme(bolunen:Double, bolen:Double) throws -> Double{
    
    guard bolunen != 0 || bolen != 0 else{
        print("Nan hatası meydana geldi")
        throw CalculateError.nanError
    }
    guard bolunen != 0 else{
        print("Base case")
        throw CalculateError.baseCase
    }
    
    guard bolen != 0 else{
        print("Bölme hatası")
        throw CalculateError.InfError
    }
    return bolunen / bolen
}

do{
    try bolme(bolunen:0,bolen:0)
}catch CalculateError.nanError{
    screen = "Nan"
}catch CalculateError.InfError{
    screen = "Inf Error"
}catch CalculateError.baseCase{
    screen = "0"
}

//Part2

//Extensions

var a = 3.3
var b = 685.0
var c = a / b
//sonuç yazıldı fakat çok büyük bir sayı, böyle bir bölüm gelse bile virgülden sonra 2 ya da 3 ne
//istiyorsam bunu handle etmek istiyorum ve buna extension yazmalıyım.

//virgülden sonra 2 basamak 10 üzeri2...
var d = (c*1000).rounded() //sayıyı yuvarlar
d / 1000

extension Double{
    func sayiyiYuvarla(basamak: Int) -> Double{
        let carpan = pow(10.0, Double(basamak))
        return(self * carpan).rounded() / carpan
    }
}

var e  = 0.00291970802919708
e.sayiyiYuvarla(basamak: 3)

extension Int{
    func kupAl() -> Int{
        return self*self*self
    }
    mutating func kareAl() {
        self = self * self
    }
    func cift()->String{
        if self % 2 == 0{
            return "sayi cift"
        }else{
            return "sayi tek"
    }
}
}
5.kupAl()
var k = 3
k.kareAl()
57.cift()

let cities = ["İstanbul", "Ankara", "izmir"]
let numbrs = [1,2,3]
let doubleNumbers = [3.14,5.2,7.3]

func myCities(cities:[String]){
    for city in cities{
        print(city)
    }
}
func tamSayilar(ts:[Int]){
    for t in ts{
        print(t)
    }
}
    
func doubleSayilar(ts:[Double]){
    for d in ts{
        print(d)
        }
}
myCities(cities: cities)
tamSayilar(ts: numbrs)
doubleSayilar(ts: doubleNumbers)

func herhangiBirArray<T>(array:[T]){
    array.map{
        print($0)
    }
}
herhangiBirArray(array: cities)
func addition<T: Numeric>(a:T,b:T)->T{
    return a+b
}
addition(a:3,b:5)


func multiply<T: Numeric>(a:T,b:T)->T{
    return a*b
}
multiply(a: 2, b: 5)

func findIndex<T:Equatable>(foundItem:T,in items: [T])->Int?{
    for (index,item) in items.enumerated(){
        if item == foundItem{
            return index
        }
    }
    return nil
}
if let result = findIndex(foundItem: "Eskişehir", in: cities){
    print(result)
}

class Arac{
    var tekerlekSayisi: Int
    var renk: String
    init(tekerlekSayisi:Int,renk:String){
        self.tekerlekSayisi = tekerlekSayisi
        self.renk = renk
    }
}

let bmw = Arac(tekerlekSayisi: 4,renk: "beyaz")
let bmw2 = bmw
bmw.renk = "siyah"
bmw.renk
bmw2.renk
bmw.renk

struct Araba{
    var model: Int
    var yakitTipi:String
}
var araba = Araba(model:2020,yakitTipi: "hibrid")
araba.model
let araba2 = araba
araba.yakitTipi = "Dizel"
araba.yakitTipi
araba2.yakitTipi//hala hibrid olarak yazmaya devam eder.


//Reference Type and Value Type... klasik nesne tabanlı programlama
//Value Type stack, reference type heap'te tutulur. Struct kullanımı tavsiye edilir.

struct Kare{
    var kenarUzunlugu: Int
    func cevreHesapla()->Int{
        return kenarUzunlugu*4
    }
    func alanHesapla()->Int{
        return kenarUzunlugu*kenarUzunlugu
    }
}
let kare = Kare(kenarUzunlugu: 3)
kare.alanHesapla()
kare.cevreHesapla()
//Daire için struct yaz

struct Daire{
    var yaricap:Double
    func alan()-> Double{
        return Double(2*3*yaricap)
    }
    func cevre()-> Double{
        return Double(2*3*yaricap)
    }
}


//Protocols
class Game{
    var name:String
    var platform:String
    var ganre: String
    init(name:String, platform:String, ganre:String){
        self.name = name
        self.platform = platform
        self.ganre = ganre
    }
}

protocol Oyuncu{
    var name:String{get}
    var alive:Bool{get set}
    var health:Int{get set}
}

