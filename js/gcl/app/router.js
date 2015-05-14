import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

// This is the beginning of Alex's Code

Router.map(function() {
  this.resource("contacts", {
    path: "/"
  });
});

// This is the end of Alex's Code

export default Router.map(function() {});
