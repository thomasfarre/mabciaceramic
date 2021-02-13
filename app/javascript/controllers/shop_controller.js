import { Controller } from "stimulus";

export default class extends Controller {
   static targets = [ "toggleable", "open", "close" ]


   toggle() {
     this.toggleableTarget.classList.toggle('hidden')
     this.openTarget.classList.toggle('hidden')
     this.closeTarget.classList.toggle('hidden')
   }
}
