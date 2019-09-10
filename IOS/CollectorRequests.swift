#if swift(>=4.0)
@objcMembers public class CollectorRequests: CollectorAPIRequests {

    public override func registerAddItemRequestHandler(handler:  @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: CollectorAPI.kRequestAddItem,
    reqClass: Item.self, 
    respClass: Bool.self,
    requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }

    public override func registerPostEventRequestHandler(handler:  @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: CollectorAPI.kRequestPostEvent,
    reqClass: String.self, 
    respClass: [Item].self,
    requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }


    public override func unregisterAddItemRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func unregisterPostEventRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    //------------------------------------------------------------------------------------------------------------------------------------


    public override func addItem(item: Item, responseCompletionHandler: @escaping ElectrodeBridgeResponseCompletionHandler) {
        let requestProcessor = ElectrodeRequestProcessor<Item, Bool, Any>(
            requestName: CollectorAPI.kRequestAddItem,
            requestPayload: item,
            respClass: Bool.self,
            responseItemType: nil,
            responseCompletionHandler: responseCompletionHandler)

        requestProcessor.execute()
    }

    public override func postEvent(type: String, responseCompletionHandler: @escaping ElectrodeBridgeResponseCompletionHandler) {
        let requestProcessor = ElectrodeRequestProcessor<String, [Item], Any>(
            requestName: CollectorAPI.kRequestPostEvent,
            requestPayload: type,
            respClass: [Item].self,
            responseItemType: Item.self,
            responseCompletionHandler: responseCompletionHandler)

        requestProcessor.execute()
    }
}
#else
public class CollectorRequests: CollectorAPIRequests {

    public override func registerAddItemRequestHandler(handler:  @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: CollectorAPI.kRequestAddItem,
    reqClass: Item.self, 
    respClass: Bool.self,
    requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }

    public override func registerPostEventRequestHandler(handler:  @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: CollectorAPI.kRequestPostEvent,
    reqClass: String.self, 
    respClass: [Item].self,
    requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }

    //------------------------------------------------------------------------------------------------------------------------------------



    public override func unregisterAddItemRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
      return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func unregisterPostEventRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
      return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func addItem(item: Item, responseCompletionHandler: @escaping ElectrodeBridgeResponseCompletionHandler) {
        let requestProcessor = ElectrodeRequestProcessor<Item, Bool, Any>(
            requestName: CollectorAPI.kRequestAddItem,
            requestPayload: item,
            respClass: Bool.self,
            responseItemType: nil,
            responseCompletionHandler: responseCompletionHandler)

        requestProcessor.execute()
    }


    public override func unregisterAddItemRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
      return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func unregisterPostEventRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
      return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func postEvent(type: String, responseCompletionHandler: @escaping ElectrodeBridgeResponseCompletionHandler) {
        let requestProcessor = ElectrodeRequestProcessor<String, [Item], Any>(
            requestName: CollectorAPI.kRequestPostEvent,
            requestPayload: type,
            respClass: [Item].self,
            responseItemType: Item.self,
            responseCompletionHandler: responseCompletionHandler)

        requestProcessor.execute()
    }
}
#endif
