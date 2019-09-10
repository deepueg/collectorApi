import { electrodeBridge } from 'react-native-electrode-bridge';
import CollectorRequests from './CollectorRequests';
import CollectorEvents from './CollectorEvents';

const REQUESTS = new CollectorRequests(electrodeBridge);

export function requests() {
    return REQUESTS;
}

const EVENTS = new CollectorEvents(electrodeBridge);

export function events() {
  return EVENTS;
}



export default ({requests, events});
