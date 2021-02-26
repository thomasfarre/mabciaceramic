import { Controller } from "stimulus";

export default class extends Controller {
   static targets = [ "descriptionToggleable", "descriptionOpen", "descriptionClose", "deliveryToggleable", "deliveryOpen", "deliveryClose", "contactToggleable", "contactOpen", "contactClose"]


   descriptionToggle() {
     this.descriptionToggleableTarget.classList.toggle('hidden')
     this.descriptionOpenTarget.classList.toggle('hidden')
     this.descriptionCloseTarget.classList.toggle('hidden')
   }

   deliveryToggle() {
     this.deliveryToggleableTarget.classList.toggle('hidden')
     this.deliveryOpenTarget.classList.toggle('hidden')
     this.deliveryCloseTarget.classList.toggle('hidden')
   }

   contactToggle() {
     this.contactToggleableTarget.classList.toggle('hidden')
     this.contactOpenTarget.classList.toggle('hidden')
     this.contactCloseTarget.classList.toggle('hidden')
   }
}
