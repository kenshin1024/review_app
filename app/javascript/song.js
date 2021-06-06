const buildHTML = (XHR) => {
  const item = XHR.response.song;
  const getLocation2 = location.href;
  const html =`
  <div class = song>
  <div>${item.title} </div>
  <div class="review">
  <div class="star_rate"></div>
  <a class="link_to_songs" href="${getLocation2}/songs/${item.id}">曲の詳細</a>
  <a class="link_to_album_edit" href="${getLocation2}/songs/${item.id}/edit">曲名・評価の変更</a>
  </div>`;
  return html;
};
  
  
function post (){
  const submit = document.getElementById("submit3");
  submit.addEventListener('click',(e) => {
  e.preventDefault();
  const form = document.getElementById("form");
  const formData = new FormData(form);
  const XHR = new XMLHttpRequest();
  const getLocation = location.href;
  XHR.open("POST", `${getLocation}/songs`, true);
  XHR.responseType = "json";
  XHR.send(formData);
  XHR.onload = () => {
    if (XHR.status != 200) {
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;
    };
    const list = document.getElementById("list")
    const formText = document.getElementById("title");
    list.insertAdjacentHTML("afterbegin",buildHTML(XHR))
    formText.value = "";
   };
 });
};

window.addEventListener('load', post);