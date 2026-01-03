import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["items", "itemTemplate"]

    connect() {
        console.log("BILLING CONTROLLER CONNECTED")
    }

    addItem(event) {
        if (event) event.preventDefault()
        console.log("Add Item Clicked")

        // Fallback if target system fails
        const itemsContainer = this.hasItemsTarget ? this.itemsTarget : this.element.querySelector('[data-billing-target="items"]')
        const template = this.hasItemTemplateTarget ? this.itemTemplateTarget : this.element.querySelector('[data-billing-target="itemTemplate"]')

        if (template && itemsContainer) {
            const content = template.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
            itemsContainer.insertAdjacentHTML('beforeend', content)
            console.log("Item added successfully")
        } else {
            console.error("Targets not found. Template:", !!template, "Container:", !!itemsContainer)
        }
    }

    removeItem(event) {
        if (event) event.preventDefault()
        console.log("Remove Item Clicked")
        const item = event.target.closest(".bill-item")
        if (item) {
            item.remove()
            console.log("Item removed")
        }
    }
}
