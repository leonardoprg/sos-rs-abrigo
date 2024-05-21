// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application";
import mask_controller from './mask_controller';
import form_controller from './form_controller';

application.register('mask', mask_controller);
application.register('form', form_controller);

/* move to other controller */

document.addEventListener('turbo:load', () => {
  const item_autocomplete = document.getElementById("item-autocomplete");
  if (item_autocomplete) {
    item_autocomplete.addEventListener('autocomplete.change', (event) => {
      Turbo.visit(`/items/${event.detail.value}/edit`);
    });
  }
});