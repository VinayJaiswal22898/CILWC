import { LightningElement } from 'lwc';

export default class ConditionalRenderingComp extends LightningElement {
    visibility ;
    visibility2  = false;

    /*
      visibility ; - false
        visibility = null - false
          visibility = undifined - false
            visibility  = ' ' - fasle
              visibility = 'ok' true
                visibility = 143; - true
    
    
    */
}