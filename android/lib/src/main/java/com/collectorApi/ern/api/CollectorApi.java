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

import com.walmartlabs.electrode.reactnative.bridge.ElectrodeBridgeEventListener;
import com.walmartlabs.electrode.reactnative.bridge.ElectrodeBridgeEvent;
import com.walmartlabs.electrode.reactnative.bridge.ElectrodeBridgeRequestHandler;
import com.walmartlabs.electrode.reactnative.bridge.ElectrodeBridgeResponseListener;
import com.walmartlabs.electrode.reactnative.bridge.None;
import com.walmartlabs.electrode.reactnative.bridge.RequestHandlerHandle;
import java.util.*;
import java.util.UUID;

import com.collectorApi.ern.model.Item;

public final class CollectorApi {
    private static final Requests REQUESTS;
    private static final Events EVENTS;

    static {
        REQUESTS = new CollectorRequests();
        EVENTS = new CollectorEvents();
    }

    private CollectorApi() {
    }

    @NonNull
    public static Requests requests() {
        return REQUESTS;
    }

    @NonNull
    public static Events events() {
        return EVENTS;
    }

    public interface Events {
        String EVENT_ITEM_ADDED = "com.collectorApi.ern.api.event.itemAdded";

        UUID addItemAddedEventListener(@NonNull final ElectrodeBridgeEventListener<String> eventListener);

            ElectrodeBridgeEventListener<ElectrodeBridgeEvent> removeItemAddedEventListener(@NonNull final UUID uuid);

        void emitItemAdded(@NonNull String itemId);

    }

    public interface Requests {
        String REQUEST_ADD_ITEM = "com.collectorApi.ern.api.request.addItem";
        String REQUEST_POST_EVENT = "com.collectorApi.ern.api.request.postEvent";


        RequestHandlerHandle registerAddItemRequestHandler(@NonNull final ElectrodeBridgeRequestHandler<Item, Boolean> handler);

        RequestHandlerHandle registerPostEventRequestHandler(@NonNull final ElectrodeBridgeRequestHandler<String, List<Item>> handler);

        void addItem(Item item, @NonNull final ElectrodeBridgeResponseListener<Boolean> responseListener);

        void postEvent(String type, @NonNull final ElectrodeBridgeResponseListener<List<Item>> responseListener);

    }
}
