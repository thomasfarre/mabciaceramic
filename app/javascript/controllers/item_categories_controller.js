import { Controller } from "stimulus";

export default class extends Controller {
   static targets = [ "category", "cards" ]


   display() {
    this.cardsTarget.classList.toggle('hidden')
   }
}
