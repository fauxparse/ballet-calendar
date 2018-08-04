import { Controller } from 'stimulus'
import fetch from '../lib/fetch'

export default class extends Controller {
  static targets = ['toggle', 'teachers', 'teacher']

  get date() {
    return this.element.dataset.date
  }

  get active() {
    return this.toggleTarget.checked
  }

  get teacherId() {
    return this.element.dataset.teacher
  }

  get available() {
    return this.teacherTargets.find(el => el.dataset.id === this.teacherId)
  }

  set available(available) {
    if (available) {
      this.addTeacher(this.teacherId)
    } else {
      this.removeTeacher(this.teacherId)
    }
    this.element.classList.toggle('day--available', available)
  }

  toggle() {
    const { date } = this

    if (this.active) {
      fetch('/days', { method: 'POST', body: { day: { date } } })
    } else {
      fetch(`/days/${date}`, { method: 'DELETE' })
    }
  }

  toggleAvailability() {
    this.available = !this.available
  }

  addTeacher(id) {
    fetch(`/days/${this.date}/assignments`, {
      method: 'POST',
      body: { assignment: { teacher_id: id } }
    })
      .then(response => response.json())
      .then(teacher => {
        const el = this.renderTeacher(teacher)
        this.teachersTarget.appendChild(el)
        setTimeout(() => el.classList.remove('teacher--out'), 10)
      })
  }

  renderTeacher = teacher => {
    const el = document.createElement('div')
    el.classList.add('teacher')
    el.classList.add('teacher--out')
    if (teacher.id.toString() === this.teacherId) {
      el.classList.add('teacher--self')
    }
    el.setAttribute('data-target', 'day.teacher')
    el.setAttribute('data-id', teacher.id)
    const name = document.createElement('div')
    name.innerText = teacher.name
    el.appendChild(name)
    return el
  }

  removeTeacher(id) {
    const el = this.teacherTargets.find(el =>
      el.dataset.id === id && !el.classList.contains('teacher--out'))
    if (el) {
      el.classList.add('teacher--out')
      setTimeout(() => el.remove(), 300)
      fetch(`/days/${this.date}/assignments/${id}`, { method: 'DELETE' })
    }
  }
}
