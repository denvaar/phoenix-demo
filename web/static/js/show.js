const Show  = {
  run: () => {
    const likeButton = document.getElementById("like-button");
    likeButton.addEventListener("click", () =>
      handleLikePost(likeButton.dataset.postId), false);
  }
}

const handleLikePost = (postId) => {
  fetch(likeUrl, { method: "PATCH" })
    .then(res => res.json())
    .then(data => {
      document.getElementById("like-counter").innerHTML = data;
    })
    .catch(error => {
      alert(error)
    });
}

Show.run();
