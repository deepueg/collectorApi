/*
* Copyright 2017 WalmartLabs
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
* http://www.apache.org/licenses/LICENSE-2.0
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

package com.collectorApi.ern.api;

import android.support.annotation.NonNull;

import com.walmartlabs.electrode.reactnative.bridge.ElectrodeBridgeHolder;
import com.walmartlabs.electrode.reactnative.bridge.ElectrodeBridgeRequestHandler;
import com.walmartlabs.electrode.reactnative.bridge.ElectrodeBridgeResponseListener;
import com.walmartlabs.electrode.reactnative.bridge.None;
import com.walmartlabs.electrode.reactnative.bridge.RequestHandlerProcessor;
import com.walmartlabs.electrode.reactnative.bridge.RequestProcessor;
import com.walmartlabs.electrode.reactnative.bridge.RequestHandlerHandle;
import java.util.*;
import com.collectorApi.ern.model.Item;


final class CollectorRequests implements CollectorApi.Requests {
    CollectorRequests() {}


    @Override
    public RequestHandlerHandle registerAddItemRequestHandler(@NonNull final ElectrodeBridgeRequestHandler<Item, Boolean> handler) {
        return new RequestHandlerProcessor<>(REQUEST_ADD_ITEM, Item.class, Boolean.class, handler).execute();
    }

    @Override
    public RequestHandlerHandle registerPostEventRequestHandler(@NonNull final ElectrodeBridgeRequestHandler<String, List<Item>> handler) {
        return new RequestHandlerProcessor<>(REQUEST_POST_EVENT, String.class, (Class) Item.class, handler).execute();
    }

    //------------------------------------------------------------------------------------------------------------------------------------

    @Override
    public void addItem(Item item,@NonNull final ElectrodeBridgeResponseListener<Boolean> responseListener) {
        new RequestProcessor<>(REQUEST_ADD_ITEM,  item, Boolean.class, responseListener).execute();
    }
    @Override
    public void postEvent(String type,@NonNull final ElectrodeBridgeResponseListener<List<Item>> responseListener) {
        new RequestProcessor<>(REQUEST_POST_EVENT,  type, (Class) List.class, Item.class, responseListener).execute();
    }
}
