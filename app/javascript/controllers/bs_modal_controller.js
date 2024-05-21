import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bs-modal"
export default class extends Controller {
  //cuando se conecta al controlador se instancia el modal boostrap
  connect() {
    this.modal = new bootstrap.Modal(this.element,{
      keyboard: false
    })
    this.modal.show()
    
  }

  disconnect(){

    this.modal.hide()
  }

  hidden(){
    this.modal.hide()
  }
}
