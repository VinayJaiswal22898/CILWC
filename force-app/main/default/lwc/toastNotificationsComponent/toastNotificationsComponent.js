import { LightningElement } from 'lwc';
import{ShowToastEvent} from "lightning/platformShowToastEvent";

export default class ToastNotificationsComponent extends LightningElement {
    titleText = "Sample Title";
    messageText = "Sample Message";
    variant = "error";
    variantOptions = [
      { label: "error", value: "error" },
      { label: "warning", value: "warning" },
      { label: "success", value: "success" },
      { label: "info", value: "info" },
    ];
handleTitleOnChange(event){
    this.titleText = event.target.value;
}
handleMessageOnChange(event){
    this.messageText = event.target.value;
}
handleVariantOnChnage(event){
    this.variant = event.target.value;
}
showNotification() {
    const evt = new ShowToastEvent({
      title: this.titleText,
      message: this.messageText,
      variant: this.variant,
    });
    this.dispatchEvent(evt);
}
}