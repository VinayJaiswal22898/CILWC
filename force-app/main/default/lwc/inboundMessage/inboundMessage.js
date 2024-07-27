import { LightningElement ,api} from 'lwc';

export default class InboundMessage extends LightningElement {
    @api inmessage = 'Hello From InBound';
}