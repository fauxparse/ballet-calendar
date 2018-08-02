import { Controller } from 'stimulus'
import fetch from '../lib/fetch'

export default class extends Controller {
  static targets = ['toggle']

  get date() {
    return this.element.dataset.date
  }

  get active() {
    return this.toggleTarget.checked
  }

  toggle() {
    const { date } = this

    if (this.active) {
      fetch('/days', { method: 'POST', body: { day: { date } } })
    } else {
      fetch(`/days/${date}`, { method: 'DELETE' })
    }
  }
}
