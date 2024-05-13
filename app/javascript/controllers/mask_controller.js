// app/javascript/controllers/mask_controller.js

import { Controller } from "@hotwired/stimulus";
import IMask from "imask";

const maskOptions = {
  currency: { mask: Number, thousandsSeparator: "," },
  date: { mask: Date },
};

export default class extends Controller {
  static values = { type: String };

  connect() {
    console.log(this.typeValue)
    IMask(this.element, maskOptions[this.typeValue]);
  }
}
