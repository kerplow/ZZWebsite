function upVote(id, votes) {
  voteable = document.getElementById(id);
  voteable.querySelector('.downvote').classList.remove('voted')
  voteable.querySelector('.upvote').classList.add('voted')
  voteable.querySelector('.vote-total').innerHTML = votes
};

function downVote(id, votes) {
  voteable = document.getElementById(id);
  voteable.querySelector('.downvote').classList.add('voted')
  voteable.querySelector('.upvote').classList.remove('voted')
  voteable.querySelector('.vote-total').innerHTML = votes
};

function unVote(id, votes) {
  voteable = document.getElementById(id);
  voteable.querySelector('.downvote').classList.remove('voted')
  voteable.querySelector('.upvote').classList.remove('voted')
  voteable.querySelector('.vote-total').innerHTML = votes
};
