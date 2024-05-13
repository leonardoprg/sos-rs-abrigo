// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application";
import mask_controller from './mask_controller';

application.register('mask', mask_controller);