# Codable

> A type that can convert itself into and out of an external representation.

```Swift
public typealias Codable = Decodable & Encodable

public protocol Encodable {

  /// Encodes this value into the given encoder.
  /// - Parameter encoder: The encoder to write data to.
  public func encode(to encoder: Encoder) throws
}

public protocol Decodable {
  /// Creates a new instance by decoding from the given decoder.
  /// - Parameter decoder: The decoder to read data from.
  public init(from decoder: Decoder) throws
}
```

## Encoding & Decoding
**[Encoding, 부호화]**
- 정보의 형태나 형식을 표준화, 보안, 처리 속도 향상, 저장 공간 절약 등을 위해서 목적에 맞는 다른 형태나 형식으로 변환하는 처리 혹은 그 처리 방식
- Encoder : 인코딩을 수행하는 장치나 회로, 컴퓨터 소프트웨어, 알고리즘
- A type that can encode values into a native format for external representation

**[Decoding, 복호화]**
- Encoding(부호화)된 대상을 원래의 형태로 되돌리는 일
- 예를 들어, 압축 파일을 다시 풀거나 암호화된 내용을 원래 내용으로 되돌리는 일
- A type that can decode values from a native format into in-memory representations

<img src="/Img/Class/encode_decode_1.png" title="encode_decode_1" width="500px">

## Conform to protocol Codable
```Swift
struct CodableExample: Codable {
   let bool: Bool
   let int: Int
   let double: Double
   let string: String
   let array: [Int]
   let dict: [String: String]
}
```

## Built-in Encoder / Decoder
```Swift
/// `PropertyListEncoder` facilitates the encoding of `Encodable` values into property lists.
open class PropertyListEncoder { }

/// `PropertyListDecoder` facilitates the of property list values into semantic `Decodable` types.
open class PropertyListDecoder { }

/// `JSONEncoder` facilitates the encoding of `Encodable` values into JSON.
open class JSONEncoder { }

/// `JSONDecoder` facilitates the decoding of JSON into semantic `Decodable` types.
open class JSONDecoder { }
```

## PropertyListDecoder
```Swift
let fileURL = URL(fileURLWithPath: "file.plist")
guard let plistDict = NSDictionary(contentsOf: fileURL) as? [String: Any] else {
  return
}

if let value1 = plistDict["key1"] as? Int,
  let value2 = plistDict["key2"] as? String {
    print(value1, value2)
}

↓ ↓ ↓ ↓ ↓

let fileURL = URL(fileURLWithPath: "file.plist")
guard let fileData = try? Data(contentsOf: fileURL) else { return }
let plistContent = PropertyListDecoder().decode(CodableType.self, from: fileData)
print(plistContent.key)
```

## JSONDecoder
```Swift
let fileURL = URL(fileURLWithPath: "file.json")
let jsonData = try! Data(contentsOf: fileURL)
guard let jsonObject = try? JSONSerialization.jsonObject(
  with: jsonData,
  options: .allowFragments) else { return }
guard let jsonDict = jsonObject as? [String: Any] else { return }
if let value1 = jsonDict["key1"] as? Int {
    print(value1)
}

↓ ↓ ↓ ↓ ↓

let fileURL = URL(fileURLWithPath: "file.json")
let jsonData = try! Data(contentsOf: fileURL)
let decodedContent = JSONDecoder().decode(CodableType.self, from: jsonData)
print(decodedContent.key)
```

<img src="/Img/Class/codable_protocol.png" title="codable_protocol" width="500px">

## CodingKey
> 인코딩과 디코딩을 위한 키로 사용하기 위해 쓰이는 프로토콜
```Swift
public protocol CodingKey {
/// The string to use in a named collection(e.g. a string-keyed dict)
public var stringValue: String { get }

/// Creates a new instance from the given string.
public init?(stringValue: String)

/// The value to use in an integer-indexed collection
/// (e.g. an int-keyed dictionary).
public var intValue: Int? { get }

/// Creates a new instance from the specified integer.
public init?(intValue: Int)
}
```

## Basic, Array,
> Basic
```Swift
struct Dog: Decodable {
  let age: Int
  let name: String

  private enum CodingKeys: String, CodingKey {
    case age
    case name
  }
}

let jsonData = """
{
  "age": 3,
  "name": "Tory"
}
""".data(using: .utf8)!

let dog = try? JSONDecoder().decode(Dog.self, from: jsonData)
print(dog)

```

<br/>

> Array
```Swift
let jsonData = """
[
  {
    "age": 3,
    "name": "Tory"
  },
  {
    "age": 3,
    "name": "Tory"
  }
]
""".data(using: .utf8)!

let dogs = try! JSONDecoder().decode([Dog].self, from: jsonData)
print(dogs)
```

<br/>

> Dictionary
```Swift
let jsonData = """
{
  "first": {
      "age": 3,
      "name": "Tory"
  },
  "second": {
    "age": 3,
    "name": "Tory"
  }
}
""".data(using: .utf8)!

let dogs = try! JSONDecoder().decode([String: Dog].self, from: jsonData)
print(dogs)
```

## Decode Manually
```Swift
struct Dog: Decodable {
  let age: Int
  let name: String

  private enum CodingKeys: String, CodingKey {
    case age
    case name
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    age = try values.decode(Int.self, forKey: .age)
    name = try values.decode(String.self, forKey: .name)
  }
}
```

## Nested Kyes
```Swift
struct Coordinate {
  var latitude: Double
  var longitude: Double
  var elevation: Double

  enum CodingKeys: String, CodingKey {
    case latitude
    case longitude
    case additionalInfo
  }

  enum AdditionalInfoKeys: String, CodingKey {
    case elevation
  }


extension Coordinate: Decodable {
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    latitude = try values.decode(Double.self, forKey: .latitude)
    longitude = try values.decode(Double.self, forKey: .longitude)

    let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)

    elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
```

## Encoding Error
```Swift
/// An error that occurs during the encoding of a value.
public enum EncodingError : Error {
  /// 주어진 값으로 인코딩을 하지 못할 때
  case invalidValue(Any, EncodingError.Context)
}
```

## Decoding Error
```Swift
/// An error that occurs during the decoding of a value.
public enum DecodingError : Error {
  /// 프로퍼티 타입 미스매치
  case typeMismatch(Any.Type, DecodingError.Context)

  /// 디코딩할 데이터의 키에 해당하는 Value 가 없을 경우
  case valueNotFound(Any.Type, DecodingError.Context)]

  /// 디코딩할 데이터에 지정한 키가 없는 경우
  case keyNotFound(CodingKey, DecodingError.Context)

  /// 데이터가 망가졌을 경우
  case dataCorrupted(DecodingError.Context)
}
```

<img src="/Img/Class/overview_codable_1.png" title="overview_codable_1" width="500px">
<img src="/Img/Class/overview_codable_2.png" title="overview_codable_2" width="500px">
