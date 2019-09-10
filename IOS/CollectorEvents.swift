#if swift(>=4.0)
@objcMembers public class CollectorEvents:  CollectorAPIEvents {
    public override func addItemAddedEventListener(eventListener: @escaping ElectrodeBridgeEventListener) -> UUID?{
        let listenerProcessor = EventListenerProcessor(
                                eventName: CollectorAPI.kEventItemAdded,
                                eventPayloadClass: String.self,
                                eventListener: eventListener)

        return listenerProcessor.execute()
    }


    public override func removeItemAddedEventListener(uuid: UUID) -> ElectrodeBridgeEventListener? {
        return ElectrodeBridgeHolder.removeEventListener(uuid)
    }


    public override func emitEventItemAdded(itemId: String) {
        let eventProcessor = EventProcessor(
                                eventName: CollectorAPI.kEventItemAdded,
                                eventPayload: itemId)

        eventProcessor.execute()
    }

}
#else
public class CollectorEvents:  CollectorAPIEvents {
    public override func addItemAddedEventListener(eventListener: @escaping ElectrodeBridgeEventListener) -> UUID?{
        let listenerProcessor = EventListenerProcessor(
                                eventName: CollectorAPI.kEventItemAdded,
                                eventPayloadClass: String.self,
                                eventListener: eventListener)

        return listenerProcessor.execute()
    }

    public override func removeItemAddedEventListener(uuid: UUID) -> ElectrodeBridgeEventListener? {
        return ElectrodeBridgeHolder.removeEventListener(uuid)
    }

    public override func emitEventItemAdded(itemId: String) {
        let eventProcessor = EventProcessor(
                                eventName: CollectorAPI.kEventItemAdded,
                                eventPayload: itemId)

        eventProcessor.execute()
    }
}
#endif
