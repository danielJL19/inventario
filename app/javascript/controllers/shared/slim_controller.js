import { Controller } from "@hotwired/stimulus"
import SlimSelect from 'slim-select'
import 'slim-select/dist/slimselect.css'
// Connects to data-controller="shared--slim"
export default class extends Controller {
  static targets = ['field']
  connect() {
    new SlimSelect({
      select: this.fieldTarget
    })
  }
}
