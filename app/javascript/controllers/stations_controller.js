import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  refresh() {
    fetch(location.href)
      .then(response => response.text())
      .then(html => {
        const container = document.querySelector(".container");
        container.innerHTML = html;
      });
  }
}
