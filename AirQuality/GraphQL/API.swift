// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AllDevicesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AllDevices {
      allDevices {
        __typename
        deviceId
        deviceName
      }
    }
    """

  public let operationName: String = "AllDevices"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allDevices", type: .list(.object(AllDevice.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allDevices: [AllDevice?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "allDevices": allDevices.flatMap { (value: [AllDevice?]) -> [ResultMap?] in value.map { (value: AllDevice?) -> ResultMap? in value.flatMap { (value: AllDevice) -> ResultMap in value.resultMap } } }])
    }

    public var allDevices: [AllDevice?]? {
      get {
        return (resultMap["allDevices"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AllDevice?] in value.map { (value: ResultMap?) -> AllDevice? in value.flatMap { (value: ResultMap) -> AllDevice in AllDevice(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [AllDevice?]) -> [ResultMap?] in value.map { (value: AllDevice?) -> ResultMap? in value.flatMap { (value: AllDevice) -> ResultMap in value.resultMap } } }, forKey: "allDevices")
      }
    }

    public struct AllDevice: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Device"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("deviceId", type: .nonNull(.scalar(String.self))),
          GraphQLField("deviceName", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(deviceId: String, deviceName: String) {
        self.init(unsafeResultMap: ["__typename": "Device", "deviceId": deviceId, "deviceName": deviceName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var deviceId: String {
        get {
          return resultMap["deviceId"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "deviceId")
        }
      }

      public var deviceName: String {
        get {
          return resultMap["deviceName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "deviceName")
        }
      }
    }
  }
}

public final class LatestSensorDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LatestSensorData($deviceName: String!) {
      latestSensorData(deviceName: $deviceName) {
        __typename
        alt
        co2
        hum
        id
        lux
        noise
        pm1
        pm10
        pm2_5
        pm4
        pres
        temp
        time
      }
    }
    """

  public let operationName: String = "LatestSensorData"

  public var deviceName: String

  public init(deviceName: String) {
    self.deviceName = deviceName
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("latestSensorData", arguments: ["deviceName": GraphQLVariable("deviceName")], type: .list(.object(LatestSensorDatum.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(latestSensorData: [LatestSensorDatum?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "latestSensorData": latestSensorData.flatMap { (value: [LatestSensorDatum?]) -> [ResultMap?] in value.map { (value: LatestSensorDatum?) -> ResultMap? in value.flatMap { (value: LatestSensorDatum) -> ResultMap in value.resultMap } } }])
    }

    public var latestSensorData: [LatestSensorDatum?]? {
      get {
        return (resultMap["latestSensorData"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LatestSensorDatum?] in value.map { (value: ResultMap?) -> LatestSensorDatum? in value.flatMap { (value: ResultMap) -> LatestSensorDatum in LatestSensorDatum(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [LatestSensorDatum?]) -> [ResultMap?] in value.map { (value: LatestSensorDatum?) -> ResultMap? in value.flatMap { (value: LatestSensorDatum) -> ResultMap in value.resultMap } } }, forKey: "latestSensorData")
      }
    }

    public struct LatestSensorDatum: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("alt", type: .nonNull(.scalar(Double.self))),
          GraphQLField("co2", type: .nonNull(.scalar(Double.self))),
          GraphQLField("hum", type: .nonNull(.scalar(Double.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("lux", type: .nonNull(.scalar(Double.self))),
          GraphQLField("noise", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pm1", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pm10", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pm2_5", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pm4", type: .nonNull(.scalar(Double.self))),
          GraphQLField("pres", type: .nonNull(.scalar(Double.self))),
          GraphQLField("temp", type: .nonNull(.scalar(Double.self))),
          GraphQLField("time", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(alt: Double, co2: Double, hum: Double, id: GraphQLID, lux: Double, noise: Double, pm1: Double, pm10: Double, pm2_5: Double, pm4: Double, pres: Double, temp: Double, time: String) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "alt": alt, "co2": co2, "hum": hum, "id": id, "lux": lux, "noise": noise, "pm1": pm1, "pm10": pm10, "pm2_5": pm2_5, "pm4": pm4, "pres": pres, "temp": temp, "time": time])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var alt: Double {
        get {
          return resultMap["alt"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "alt")
        }
      }

      public var co2: Double {
        get {
          return resultMap["co2"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "co2")
        }
      }

      public var hum: Double {
        get {
          return resultMap["hum"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "hum")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var lux: Double {
        get {
          return resultMap["lux"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "lux")
        }
      }

      public var noise: Double {
        get {
          return resultMap["noise"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "noise")
        }
      }

      public var pm1: Double {
        get {
          return resultMap["pm1"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "pm1")
        }
      }

      public var pm10: Double {
        get {
          return resultMap["pm10"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "pm10")
        }
      }

      public var pm2_5: Double {
        get {
          return resultMap["pm2_5"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "pm2_5")
        }
      }

      public var pm4: Double {
        get {
          return resultMap["pm4"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "pm4")
        }
      }

      public var pres: Double {
        get {
          return resultMap["pres"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "pres")
        }
      }

      public var temp: Double {
        get {
          return resultMap["temp"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "temp")
        }
      }

      public var time: String {
        get {
          return resultMap["time"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "time")
        }
      }
    }
  }
}

public final class AltDataInDateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AltDataInDate($deviceName: String!, $date: String!) {
      sensorDataInDate(deviceName: $deviceName, date: $date) {
        __typename
        alt
      }
    }
    """

  public let operationName: String = "AltDataInDate"

  public var deviceName: String
  public var date: String

  public init(deviceName: String, date: String) {
    self.deviceName = deviceName
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sensorDataInDate", arguments: ["deviceName": GraphQLVariable("deviceName"), "date": GraphQLVariable("date")], type: .list(.object(SensorDataInDate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sensorDataInDate: [SensorDataInDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sensorDataInDate": sensorDataInDate.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }])
    }

    public var sensorDataInDate: [SensorDataInDate?]? {
      get {
        return (resultMap["sensorDataInDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SensorDataInDate?] in value.map { (value: ResultMap?) -> SensorDataInDate? in value.flatMap { (value: ResultMap) -> SensorDataInDate in SensorDataInDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }, forKey: "sensorDataInDate")
      }
    }

    public struct SensorDataInDate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("alt", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(alt: Double) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "alt": alt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var alt: Double {
        get {
          return resultMap["alt"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "alt")
        }
      }
    }
  }
}

public final class Co2DataInDateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Co2DataInDate($deviceName: String!, $date: String!) {
      sensorDataInDate(deviceName: $deviceName, date: $date) {
        __typename
        co2
      }
    }
    """

  public let operationName: String = "Co2DataInDate"

  public var deviceName: String
  public var date: String

  public init(deviceName: String, date: String) {
    self.deviceName = deviceName
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sensorDataInDate", arguments: ["deviceName": GraphQLVariable("deviceName"), "date": GraphQLVariable("date")], type: .list(.object(SensorDataInDate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sensorDataInDate: [SensorDataInDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sensorDataInDate": sensorDataInDate.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }])
    }

    public var sensorDataInDate: [SensorDataInDate?]? {
      get {
        return (resultMap["sensorDataInDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SensorDataInDate?] in value.map { (value: ResultMap?) -> SensorDataInDate? in value.flatMap { (value: ResultMap) -> SensorDataInDate in SensorDataInDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }, forKey: "sensorDataInDate")
      }
    }

    public struct SensorDataInDate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("co2", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(co2: Double) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "co2": co2])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var co2: Double {
        get {
          return resultMap["co2"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "co2")
        }
      }
    }
  }
}

public final class HumDataInDateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query HumDataInDate($deviceName: String!, $date: String!) {
      sensorDataInDate(deviceName: $deviceName, date: $date) {
        __typename
        hum
      }
    }
    """

  public let operationName: String = "HumDataInDate"

  public var deviceName: String
  public var date: String

  public init(deviceName: String, date: String) {
    self.deviceName = deviceName
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sensorDataInDate", arguments: ["deviceName": GraphQLVariable("deviceName"), "date": GraphQLVariable("date")], type: .list(.object(SensorDataInDate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sensorDataInDate: [SensorDataInDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sensorDataInDate": sensorDataInDate.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }])
    }

    public var sensorDataInDate: [SensorDataInDate?]? {
      get {
        return (resultMap["sensorDataInDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SensorDataInDate?] in value.map { (value: ResultMap?) -> SensorDataInDate? in value.flatMap { (value: ResultMap) -> SensorDataInDate in SensorDataInDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }, forKey: "sensorDataInDate")
      }
    }

    public struct SensorDataInDate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("hum", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(hum: Double) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "hum": hum])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var hum: Double {
        get {
          return resultMap["hum"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "hum")
        }
      }
    }
  }
}

public final class LuxDataInDateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LuxDataInDate($deviceName: String!, $date: String!) {
      sensorDataInDate(deviceName: $deviceName, date: $date) {
        __typename
        lux
      }
    }
    """

  public let operationName: String = "LuxDataInDate"

  public var deviceName: String
  public var date: String

  public init(deviceName: String, date: String) {
    self.deviceName = deviceName
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sensorDataInDate", arguments: ["deviceName": GraphQLVariable("deviceName"), "date": GraphQLVariable("date")], type: .list(.object(SensorDataInDate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sensorDataInDate: [SensorDataInDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sensorDataInDate": sensorDataInDate.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }])
    }

    public var sensorDataInDate: [SensorDataInDate?]? {
      get {
        return (resultMap["sensorDataInDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SensorDataInDate?] in value.map { (value: ResultMap?) -> SensorDataInDate? in value.flatMap { (value: ResultMap) -> SensorDataInDate in SensorDataInDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }, forKey: "sensorDataInDate")
      }
    }

    public struct SensorDataInDate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("lux", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(lux: Double) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "lux": lux])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var lux: Double {
        get {
          return resultMap["lux"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "lux")
        }
      }
    }
  }
}

public final class NoiseDataInDateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query NoiseDataInDate($deviceName: String!, $date: String!) {
      sensorDataInDate(deviceName: $deviceName, date: $date) {
        __typename
        noise
      }
    }
    """

  public let operationName: String = "NoiseDataInDate"

  public var deviceName: String
  public var date: String

  public init(deviceName: String, date: String) {
    self.deviceName = deviceName
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sensorDataInDate", arguments: ["deviceName": GraphQLVariable("deviceName"), "date": GraphQLVariable("date")], type: .list(.object(SensorDataInDate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sensorDataInDate: [SensorDataInDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sensorDataInDate": sensorDataInDate.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }])
    }

    public var sensorDataInDate: [SensorDataInDate?]? {
      get {
        return (resultMap["sensorDataInDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SensorDataInDate?] in value.map { (value: ResultMap?) -> SensorDataInDate? in value.flatMap { (value: ResultMap) -> SensorDataInDate in SensorDataInDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }, forKey: "sensorDataInDate")
      }
    }

    public struct SensorDataInDate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("noise", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(noise: Double) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "noise": noise])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var noise: Double {
        get {
          return resultMap["noise"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "noise")
        }
      }
    }
  }
}

public final class Pm1DataInDateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Pm1DataInDate($deviceName: String!, $date: String!) {
      sensorDataInDate(deviceName: $deviceName, date: $date) {
        __typename
        pm1
      }
    }
    """

  public let operationName: String = "Pm1DataInDate"

  public var deviceName: String
  public var date: String

  public init(deviceName: String, date: String) {
    self.deviceName = deviceName
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sensorDataInDate", arguments: ["deviceName": GraphQLVariable("deviceName"), "date": GraphQLVariable("date")], type: .list(.object(SensorDataInDate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sensorDataInDate: [SensorDataInDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sensorDataInDate": sensorDataInDate.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }])
    }

    public var sensorDataInDate: [SensorDataInDate?]? {
      get {
        return (resultMap["sensorDataInDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SensorDataInDate?] in value.map { (value: ResultMap?) -> SensorDataInDate? in value.flatMap { (value: ResultMap) -> SensorDataInDate in SensorDataInDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }, forKey: "sensorDataInDate")
      }
    }

    public struct SensorDataInDate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pm1", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pm1: Double) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "pm1": pm1])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pm1: Double {
        get {
          return resultMap["pm1"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "pm1")
        }
      }
    }
  }
}

public final class Pm10DataInDateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Pm10DataInDate($deviceName: String!, $date: String!) {
      sensorDataInDate(deviceName: $deviceName, date: $date) {
        __typename
        pm10
      }
    }
    """

  public let operationName: String = "Pm10DataInDate"

  public var deviceName: String
  public var date: String

  public init(deviceName: String, date: String) {
    self.deviceName = deviceName
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sensorDataInDate", arguments: ["deviceName": GraphQLVariable("deviceName"), "date": GraphQLVariable("date")], type: .list(.object(SensorDataInDate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sensorDataInDate: [SensorDataInDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sensorDataInDate": sensorDataInDate.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }])
    }

    public var sensorDataInDate: [SensorDataInDate?]? {
      get {
        return (resultMap["sensorDataInDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SensorDataInDate?] in value.map { (value: ResultMap?) -> SensorDataInDate? in value.flatMap { (value: ResultMap) -> SensorDataInDate in SensorDataInDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }, forKey: "sensorDataInDate")
      }
    }

    public struct SensorDataInDate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pm10", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pm10: Double) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "pm10": pm10])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pm10: Double {
        get {
          return resultMap["pm10"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "pm10")
        }
      }
    }
  }
}

public final class Pm25DataInDateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Pm25DataInDate($deviceName: String!, $date: String!) {
      sensorDataInDate(deviceName: $deviceName, date: $date) {
        __typename
        pm2_5
      }
    }
    """

  public let operationName: String = "Pm25DataInDate"

  public var deviceName: String
  public var date: String

  public init(deviceName: String, date: String) {
    self.deviceName = deviceName
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sensorDataInDate", arguments: ["deviceName": GraphQLVariable("deviceName"), "date": GraphQLVariable("date")], type: .list(.object(SensorDataInDate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sensorDataInDate: [SensorDataInDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sensorDataInDate": sensorDataInDate.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }])
    }

    public var sensorDataInDate: [SensorDataInDate?]? {
      get {
        return (resultMap["sensorDataInDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SensorDataInDate?] in value.map { (value: ResultMap?) -> SensorDataInDate? in value.flatMap { (value: ResultMap) -> SensorDataInDate in SensorDataInDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }, forKey: "sensorDataInDate")
      }
    }

    public struct SensorDataInDate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pm2_5", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pm2_5: Double) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "pm2_5": pm2_5])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pm2_5: Double {
        get {
          return resultMap["pm2_5"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "pm2_5")
        }
      }
    }
  }
}

public final class Pm4DataInDateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Pm4DataInDate($deviceName: String!, $date: String!) {
      sensorDataInDate(deviceName: $deviceName, date: $date) {
        __typename
        pm4
      }
    }
    """

  public let operationName: String = "Pm4DataInDate"

  public var deviceName: String
  public var date: String

  public init(deviceName: String, date: String) {
    self.deviceName = deviceName
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sensorDataInDate", arguments: ["deviceName": GraphQLVariable("deviceName"), "date": GraphQLVariable("date")], type: .list(.object(SensorDataInDate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sensorDataInDate: [SensorDataInDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sensorDataInDate": sensorDataInDate.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }])
    }

    public var sensorDataInDate: [SensorDataInDate?]? {
      get {
        return (resultMap["sensorDataInDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SensorDataInDate?] in value.map { (value: ResultMap?) -> SensorDataInDate? in value.flatMap { (value: ResultMap) -> SensorDataInDate in SensorDataInDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }, forKey: "sensorDataInDate")
      }
    }

    public struct SensorDataInDate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pm4", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pm4: Double) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "pm4": pm4])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pm4: Double {
        get {
          return resultMap["pm4"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "pm4")
        }
      }
    }
  }
}

public final class PresDataInDateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query PresDataInDate($deviceName: String!, $date: String!) {
      sensorDataInDate(deviceName: $deviceName, date: $date) {
        __typename
        pres
      }
    }
    """

  public let operationName: String = "PresDataInDate"

  public var deviceName: String
  public var date: String

  public init(deviceName: String, date: String) {
    self.deviceName = deviceName
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sensorDataInDate", arguments: ["deviceName": GraphQLVariable("deviceName"), "date": GraphQLVariable("date")], type: .list(.object(SensorDataInDate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sensorDataInDate: [SensorDataInDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sensorDataInDate": sensorDataInDate.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }])
    }

    public var sensorDataInDate: [SensorDataInDate?]? {
      get {
        return (resultMap["sensorDataInDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SensorDataInDate?] in value.map { (value: ResultMap?) -> SensorDataInDate? in value.flatMap { (value: ResultMap) -> SensorDataInDate in SensorDataInDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }, forKey: "sensorDataInDate")
      }
    }

    public struct SensorDataInDate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pres", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pres: Double) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "pres": pres])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pres: Double {
        get {
          return resultMap["pres"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "pres")
        }
      }
    }
  }
}

public final class TempDataInDateQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query TempDataInDate($deviceName: String!, $date: String!) {
      sensorDataInDate(deviceName: $deviceName, date: $date) {
        __typename
        temp
      }
    }
    """

  public let operationName: String = "TempDataInDate"

  public var deviceName: String
  public var date: String

  public init(deviceName: String, date: String) {
    self.deviceName = deviceName
    self.date = date
  }

  public var variables: GraphQLMap? {
    return ["deviceName": deviceName, "date": date]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sensorDataInDate", arguments: ["deviceName": GraphQLVariable("deviceName"), "date": GraphQLVariable("date")], type: .list(.object(SensorDataInDate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sensorDataInDate: [SensorDataInDate?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "sensorDataInDate": sensorDataInDate.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }])
    }

    public var sensorDataInDate: [SensorDataInDate?]? {
      get {
        return (resultMap["sensorDataInDate"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SensorDataInDate?] in value.map { (value: ResultMap?) -> SensorDataInDate? in value.flatMap { (value: ResultMap) -> SensorDataInDate in SensorDataInDate(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SensorDataInDate?]) -> [ResultMap?] in value.map { (value: SensorDataInDate?) -> ResultMap? in value.flatMap { (value: SensorDataInDate) -> ResultMap in value.resultMap } } }, forKey: "sensorDataInDate")
      }
    }

    public struct SensorDataInDate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SensorData"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("temp", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(temp: Double) {
        self.init(unsafeResultMap: ["__typename": "SensorData", "temp": temp])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var temp: Double {
        get {
          return resultMap["temp"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "temp")
        }
      }
    }
  }
}
