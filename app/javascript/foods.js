document.addEventListener('DOMContentLoaded', () => {
  // "管理"ボタンをクリックしたときの処理
  document.querySelectorAll('.food-btn').forEach(button => {
    button.addEventListener('click', event => {
      event.preventDefault();
      const foodId = event.target.dataset.foodId;
      document.getElementById(`food-view-${foodId}`).style.display = 'none';
      document.getElementById(`food-edit-${foodId}`).style.display = 'block';
    });
  });

  // "キャンセル"ボタンをクリックしたときの処理
  document.querySelectorAll('.food-cancel').forEach(button => {
    button.addEventListener('click', event => {
      event.preventDefault();
      const foodId = event.target.dataset.foodId;
      document.getElementById(`food-view-${foodId}`).style.display = 'block';
      document.getElementById(`food-edit-${foodId}`).style.display = 'none';
    });
  });
});

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);