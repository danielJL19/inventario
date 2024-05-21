import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-modal"
export default class extends Controller {
  connect() {
  }

  initialize(){
    //se crea o edita un atributo de una etiqueta
    this.element.setAttribute('data-action', 'click->new-modal#showModal')
  }

  showModal(event){
    
    event.preventDefault();
    console.log('va a llamar al form');
    //obtener la url de esta etiqueta
    this.url = this.element.getAttribute('href')
    //permite formato de turbo-stream
    fetch(this.url, {
      headers: {

        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
