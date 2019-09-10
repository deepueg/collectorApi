// @flow
export default class CollectorEvents {
    constructor(bridge) {
        this._bridge = bridge;
    }

            addItemAddedEventListener( eventListener: Function): string {
            return   this._bridge.registerEventListener("com.collectorApi.ern.api.event.itemAdded", eventListener);
            }

            removeItemAddedEventListener( uuid: string): any {
            return   this._bridge.removeEventListener(uuid);
            }

//------------------------------------------------------------------------------------------------------------------------------------

            emitItemAdded(itemId: string): void {
                    return this._bridge.emitEvent("com.collectorApi.ern.api.event.itemAdded", { data:itemId });


            }
}
