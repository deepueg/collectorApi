#if swift(>=4.0)
@objcMembers public class CollectorAPI: NSObject  {

    static let kRequestAddItem = "com.collectorApi.ern.api.request.addItem";
    static let kEventItemAdded = "com.collectorApi.ern.api.event.itemAdded";


    static let kRequestPostEvent = "com.collectorApi.ern.api.request.postEvent";

    public lazy var events: CollectorAPIEvents = {
        return CollectorEvents()
    }()


    public lazy var requests: CollectorAPIRequests = {
        return CollectorRequests()
    }()
}

@objcMembers public class CollectorAPIEvents: NSObject {
    public func addItemAddedEventListener(eventListener: @escaping ElectrodeBridgeEventListener) -> UUID?{
        assertionFailure("should override")
        return UUID()
    }

    public func removeItemAddedEventListener(uuid: UUID) -> ElectrodeBridgeEventListener? {
        assertionFailure("should override")
        return nil
    }

    public func emitEventItemAdded(itemId: String) {
        assertionFailure("should override")

    }
}

@objcMembers public class CollectorAPIRequests: NSObject {
    public func registerAddItemRequestHandler(handler: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        assertionFailure("should override")
        return UUID()
    }

    public func registerPostEventRequestHandler(handler: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        assertionFailure("should override")
        return UUID()
    }


    public func unregisterAddItemRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        assertionFailure("should override")
        return nil
    }

    public func unregisterPostEventRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        assertionFailure("should override")
        return nil
    }


    public func addItem(item: Item, responseCompletionHandler: @escaping ElectrodeBridgeResponseCompletionHandler) {
        assertionFailure("should override")
    }

    public func postEvent(type: String, responseCompletionHandler: @escaping ElectrodeBridgeResponseCompletionHandler) {
        assertionFailure("should override")
    }

}
#else
public class CollectorAPI: NSObject  {

    static let kRequestAddItem = "com.collectorApi.ern.api.request.addItem";
    static let kEventItemAdded = "com.collectorApi.ern.api.event.itemAdded";


    static let kRequestPostEvent = "com.collectorApi.ern.api.request.postEvent";

    public lazy var events: CollectorAPIEvents = {
        return CollectorEvents()
    }()


    public lazy var requests: CollectorAPIRequests = {
        return CollectorRequests()
    }()
}

public class CollectorAPIEvents: NSObject {
    public func addItemAddedEventListener(eventListener: @escaping ElectrodeBridgeEventListener) -> UUID?{
        assertionFailure("should override")
        return UUID()
    }

    public func removeItemAddedEventListener(uuid: UUID) -> ElectrodeBridgeEventListener? {
        assertionFailure("should override")
        return nil
    }

    public func emitEventItemAdded(itemId: String) {
        assertionFailure("should override")

    }
}

public class CollectorAPIRequests: NSObject {
    public func registerAddItemRequestHandler(handler: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        assertionFailure("should override")
        return UUID()
    }

    public func registerPostEventRequestHandler(handler: @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        assertionFailure("should override")
        return UUID()
    }


    public func unregisterAddItemRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        assertionFailure("should override")
        return nil
    }

    public func unregisterPostEventRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        assertionFailure("should override")
        return nil
    }


    public func addItem(item: Item, responseCompletionHandler: @escaping ElectrodeBridgeResponseCompletionHandler) {
        assertionFailure("should override")
    }

    public func postEvent(type: String, responseCompletionHandler: @escaping ElectrodeBridgeResponseCompletionHandler) {
        assertionFailure("should override")
    }

}

#endif
