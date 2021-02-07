import { Controller } from "stimulus";

export default class extends Controller {
   static targets = [ "stickylogo" ]


   onScroll() {
    var y = window.scrollY;
    if (y >= 60) {
     this.stickylogoTarget.classList.remove('hidden')
    } else {
        this.stickylogoTarget.classList.add('hidden')
    }
   };
}
