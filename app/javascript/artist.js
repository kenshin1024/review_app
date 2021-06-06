const buildHTML = (XHR) => {
  const item = XHR.response.artist;
  const html =`
  <div class = artist>
  <div>${item.title} </div>
  <div class = "review">
  <div class="star_rate"></div>
  <a class="link_to_albums" href="/artists/${item.id}">アーティストの詳細</a>
  <a class="link_to_artist_edit" href="/artists/${item.id}/edit">アーティスト名の変更</a>
  </div>
  </div> `;
  return html;
};
  
  
function post (){
  const submit = document.getElementById("submit");
  submit.addEventListener('click',(e) => {
  e.preventDefault();
  const form = document.getElementById("form");
  const formData = new FormData(form);
  const XHR = new XMLHttpRequest();
  XHR.open("POST", "/artists", true);
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