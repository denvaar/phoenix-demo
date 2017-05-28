import "phoenix_html";
import moment from "moment";

const App = {
  run: () => {
    const dateElements = document.getElementsByClassName("pretty-date");
    Array.prototype.slice.call(dateElements).forEach(el => {
      el.innerHTML = moment(el.innerHTML).format('lll');
    });
  }
}

App.run();
