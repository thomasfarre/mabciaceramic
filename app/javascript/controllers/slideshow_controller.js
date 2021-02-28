import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "slide", "allSlides", "counter" ]

  initialize() {
    this.index = 0
    this.showCurrentSlide()
  }

  show() {
    this.allSlidesTarget.classList.toggle("hidden")
  }

  next() {
    if (this.index == (this.slideTargets.length - 1)) {
      this.index = -1
    }
    this.index++
    this.counterTarget.innerHTML = this.index + 1
    this.showCurrentSlide()
  }

  previous() {
    if (this.index == 0) {
      this.index = this.slideTargets.length
    }
    this.index--
    this.counterTarget.innerHTML = this.index + 1
    this.showCurrentSlide()
  }

  showCurrentSlide() {
    this.slideTargets.forEach((element, index) => {
      element.hidden = index != this.index
    })
  }
}
