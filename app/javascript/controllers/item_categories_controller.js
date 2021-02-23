import { Controller } from "stimulus";

export default class extends Controller {

   static targets = [ "category", "button", "toutVoir", "toutVoirButton" ]



  display(event) {
    let type = event.target.getAttribute("data-type")
    event.currentTarget.classList.add('text-japonica-500', 'font-bold')
    this.buttonTargets.filter(button => {
     if (button.getAttribute("data-type") != type){
      button.classList.remove('text-japonica-500', 'font-bold') }})


    this.categoryTargets.filter(category => {
     if (category.getAttribute("data-type") != type){
      category.classList.add('hidden') }})

    this.categoryTargets.filter(category => {
     if (category.getAttribute("data-type") == type){
      category.classList.remove('hidden') }})

    this.toutVoirTarget.classList.add('hidden')
    this.toutVoirButtonTarget.classList.remove('text-japonica-500', 'font-bold')
    this.toutVoirButtonTarget.classList.add('text-gray-600', 'font-medium')

   }



  displayAll() {

    this.toutVoirTarget.classList.remove('hidden')
    this.toutVoirButtonTarget.classList.add('text-japonica-500', 'font-bold')

    this.buttonTargets.forEach(button => {
      button.classList.remove('text-japonica-500', 'font-bold')
    })

    this.categoryTargets.forEach(category => {
      category.classList.add('hidden')
    })
  }
}
