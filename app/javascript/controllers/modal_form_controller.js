import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-form"
export default class extends Controller {
  connect() {
    console.log('Conectado a modal_form');
  }

  hideModal(){
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }

}
