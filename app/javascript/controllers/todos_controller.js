// app/javascript/controllers/todos_controller.js
import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

export default class extends Controller {
    static targets = ["list"]

    connect() {
        console.log("Todo controller connected")
    }

    create(event) {
        event.preventDefault()
        const [data, status, xhr] = event.detail
        if (status === 'OK') {
            const newTodo = xhr.response
            this.listTarget.innerHTML += `<li>${newTodo.title}</li>`
        }
    }
}
