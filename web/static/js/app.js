// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html";
import moment from "moment";
// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".
import "./show";
// import socket from "./socket"

export const App = {
  run: () => {
    const dateElements = document.getElementsByClassName("pretty-date");
    Array.prototype.slice.call(dateElements).forEach(el => {
      el.innerHTML = moment(el.innerHTML).format('lll');
    });
  
    // const likeButton = document.getElementById("like-button");
    // likeButton.addEventListener("click", () => handleLikePost(likeButton.dataset.postId), false);
  }
}

/*
const handleLikePost = (postId) => {
  fetch(`/api/posts/${postId}/like`, { method: "PATCH" })
    .then(res => res.json())
    .then(data => {
      document.getElementById("like-counter").innerHTML = data;
    })
    .catch(error => {
      alert(error)
    });
}
*/
