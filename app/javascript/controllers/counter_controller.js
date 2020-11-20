import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'count' ];

  refresh() {
    fetch('/cookers', { headers: { accept: 'application/json' } })
      .then(response => response.json())
      .then((data) => {
        this.countTarget.innerText = data.cookers.length;
      });
  }
}