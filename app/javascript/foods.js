document.addEventListener('DOMContentLoaded', () => {
  // "編集"ボタンをクリックしたときの処理
  document.querySelectorAll('.food-edit-btn').forEach(button => {
    button.addEventListener('click', event => {
      event.preventDefault();
      const foodId = event.target.dataset.foodId;
      // 通常表示部分を非表示
      document.getElementById(`food-view-${foodId}`).style.display = 'none';
      // 編集フォーム部分を表示
      document.getElementById(`food-edit-${foodId}`).style.display = 'block';
    });
  });

  // "キャンセル"ボタンをクリックしたときの処理
  document.querySelectorAll('.food-cancel-btn').forEach(button => {
    button.addEventListener('click', event => {
      event.preventDefault();
      const foodId = event.target.dataset.foodId;
      // 通常表示部分を表示
      document.getElementById(`food-view-${foodId}`).style.display = 'block';
      // 編集フォーム部分を非表示
      document.getElementById(`food-edit-${foodId}`).style.display = 'none';
    });
  });
});

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);