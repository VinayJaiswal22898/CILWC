import { LightningElement } from 'lwc';
import customStyle from '@salesforce/resourceUrl/custom_css';
import {loadStyle} from 'lightning/platformResourceLoader';
export default class CssUsingStaticResource extends LightningElement {
    css = customStyle;
    showUi =false;
    connectedCallback(){
        Promise.All([
            loadStyle(this, this.css)
        ])
        .then((result)=>{
            this.showUi = true;
        })
    }
}

