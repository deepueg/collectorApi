# javascript

collectorApi - JavaScript client for javascript
Walmart Item Module
This SDK is automatically generated by Electrode Native API generator.
It uses Swagger to generate bridge code for Swift, Android and React Native.

- API version: 
- Package version: 1.0.0

## Installation

### For [Node.js](https://nodejs.org/)

#### npm

To publish the library as a [npm](https://www.npmjs.com/),
please follow the procedure in ["Publishing npm packages"](https://docs.npmjs.com/getting-started/publishing-npm-packages).

Then install it via:

```sh
npm install javascript --save
```

#### Git

If the library is hosted at a Git repository, e.g.
https://github.com/GIT_USER_ID/GIT_REPO_ID
then install it via:

```sh
npm install GIT_USER_ID/GIT_REPO_ID --save
```

## Getting Started

Please follow the [installation](#installation) instruction and execute the following JS code:

```javascript
import { collectorApi } from 'javascript';

const api = new collectorApi.CollectorApi()

api.addItem(item).then(function(data) {
  console.log('API called successfully. Returned data: ' + data);
}, function(error) {
  console.error(error);
});

```

## Documentation for API Endpoints

All URIs are relative to *https://localhost*

Class | Method |request type | Description
------------ | ------------- | ------------- | -------------
*collectorApi.CollectorApi* | [**addItem**](docs/CollectorApi.md#addItem) | **request** /items | 
*collectorApi.CollectorApi* | [**itemAdded**](docs/CollectorApi.md#itemAdded) | **event** event/itemAdded | 
*collectorApi.CollectorApi* | [**postEvent**](docs/CollectorApi.md#postEvent) | **request** /items | 

## Documentation for Models
 - [collectorApi.Item](docs/Item.md)
 - [collectorApi.LoginEvent](docs/LoginEvent.md)

## Documentation for Authorization

 All endpoints do not require authorization.

