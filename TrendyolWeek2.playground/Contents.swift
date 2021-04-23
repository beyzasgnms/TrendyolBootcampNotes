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

//oyun için dönme açıları ile ilgili enum yazınız..
