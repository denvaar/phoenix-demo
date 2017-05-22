// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
import "phoenix_html";
import moment from "moment";
// Import local files
import "./show";


export const App = {
  run: () => {
    const dateElements = document.getElementsByClassName("pretty-date");
    Array.prototype.slice.call(dateElements).forEach(el => {
      el.innerHTML = moment(el.innerHTML).format('lll');
    });
  }
}
