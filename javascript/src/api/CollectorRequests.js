// @flow


export default class CollectorRequests {
    constructor(bridge) {
     this._bridge = bridge;
    }

        /**
         * Registers a handler for a particular api.  This allows javascript to handle a request from native.
         * @param The handler function, taking a single parameter being the data of the request and returning a Promise. Implementer of the handler should either resolve the promise with an object being the response data (if any) or reject the promise with an Error
         */
    registerAddItemRequestHandler( handler : Function): Promise<any> {
        this._bridge.registerRequestHandler("com.collectorApi.ern.api.request.addItem", handler);
    }
        /**
         * Registers a handler for a particular api.  This allows javascript to handle a request from native.
         * @param The handler function, taking a single parameter being the data of the request and returning a Promise. Implementer of the handler should either resolve the promise with an object being the response data (if any) or reject the promise with an Error
         */
    registerPostEventRequestHandler( handler : Function): Promise<any> {
        this._bridge.registerRequestHandler("com.collectorApi.ern.api.request.postEvent", handler);
    }

    //------------------------------------------------------------------------------------------------------------------------------------


    /**
      * Creates a Item in the store.
      * @param  item Item to add
      * @param integer timeout in milliseconds
      * @return {Promise} a {@link https://www.promisejs.org/|Promise}, with data of type {@link Boolean }
      */

     addItem(item: any,timeout: number): Promise<any> {
                return this._bridge.sendRequest("com.collectorApi.ern.api.request.addItem", { data:item, timeout });

    }

    /**
      * Returns all items from the system that the user has access to
      * @param {Object} opts Optional parameters
      * @param  opts.type maximum number of results to return
      * @param integer timeout in milliseconds
      * @return {Promise} a {@link https://www.promisejs.org/|Promise}, with data of type {@link Array.<module:com.collectorApi.ern.model/Item> }
      */

     postEvent(opts: any,timeout: number): Promise<any> {
                return this._bridge.sendRequest("com.collectorApi.ern.api.request.postEvent", { data:opts, timeout });

    }
}
