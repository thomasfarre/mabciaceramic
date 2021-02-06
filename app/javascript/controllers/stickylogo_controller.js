import { Controller } from "stimulus";

export default class extends Controller {
   static targets = [ "stickylogo" ]


   onScroll() {
    var y = window.scrollY;
    if (y >= 50) {
     this.stickylogoTarget.classList.remove('opacity-0')
     this.stickylogoTarget.classList.add('opacity-100')
    } else {
        this.stickylogoTarget.classList.remove('opacity-100')
        this.stickylogoTarget.classList.add('opacity-0')
    }
   };
}
