import { Controller } from "stimulus";

const categories = ["Aquarium", "Photophores", "Sculptures", "Pots, coupes", "Cuisine", "Décoration", "Extérieur"]
const buttonCategories = [ "ToutVoirButton", "AquariumButton", "PhotophoresButton", "SculpturesButton", "Pots, coupesButton", "CuisineButton", "DécorationButton", "ExtérieurButton" ]


export default class extends Controller {

   static targets = [ "category", "ToutVoir", "Aquarium", "Photophores", "Sculptures", "Pots, coupes", "Cuisine", "Décoration", "Extérieur", "ToutVoirButton", "AquariumButton", "PhotophoresButton", "SculpturesButton", "Pots, coupesButton", "CuisineButton", "DécorationButton", "ExtérieurButton" ]




   displayToutVoir() {
    this.ToutVoirTarget.classList.remove('hidden')
    this.ToutVoirButtonTarget.classList.add('text-japonica-500', 'font-bold')

    categories.forEach(function (item) {
      console.log(item);
      this[item + "Target"].classList.add('hidden')
    });



    this.PhotophoresButtonTarget.classList.remove('text-japonica-500', 'font-bold')
    this.SculpturesTarget.classList.add('hidden')
    this.SculpturesButtonTarget.classList.remove('text-japonica-500', 'font-bold')
   }

   displayAquarium() {
    this.AquariumTarget.classList.remove('hidden')
    this.AquariumButtonTarget.classList.add('text-japonica-500', 'font-bold')


    this.ToutVoirTarget.classList.add('hidden')
    this.ToutVoirButtonTarget.classList.remove('text-japonica-500', 'font-bold')
    this.ToutVoirButtonTarget.classList.add('text-gray-600', 'font-medium')

    this.PhotophoresTarget.classList.add('hidden')
    this.PhotophoresButtonTarget.classList.remove('text-japonica-500', 'font-bold')

    this.SculpturesTarget.classList.add('hidden')
    this.SculpturesButtonTarget.classList.remove('text-japonica-500', 'font-bold')
   }


   displayPhotophores() {
    this.PhotophoresTarget.classList.remove('hidden')
    this.PhotophoresButtonTarget.classList.add('text-japonica-500', 'font-bold')


    this.AquariumTarget.classList.add('hidden')
    this.AquariumButtonTarget.classList.remove('text-japonica-500', 'font-bold')

    this.ToutVoirTarget.classList.add('hidden')
    this.ToutVoirButtonTarget.classList.remove('text-japonica-500', 'font-bold')
    this.ToutVoirButtonTarget.classList.add('text-gray-600', 'font-medium')

    this.SculpturesTarget.classList.add('hidden')
    this.SculpturesButtonTarget.classList.remove('text-japonica-500', 'font-bold')
   }

   displaySculptures() {
    this.SculpturesTarget.classList.remove('hidden')
    this.SculpturesButtonTarget.classList.add('text-japonica-500', 'font-bold')


    this.AquariumTarget.classList.add('hidden')
    this.AquariumButtonTarget.classList.remove('text-japonica-500', 'font-bold')
    this.PhotophoresTarget.classList.add('hidden')
    this.PhotophoresButtonTarget.classList.remove('text-japonica-500', 'font-bold')

    this.ToutVoirTarget.classList.add('hidden')
    this.ToutVoirButtonTarget.classList.remove('text-japonica-500', 'font-bold')
    this.ToutVoirButtonTarget.classList.add('text-gray-600', 'font-medium')
   }
}
