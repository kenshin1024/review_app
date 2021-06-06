const buildHTML = (XHR) => {
  const item = XHR.response.album;
  const getLocation2 = location.href;
  console.log(item.id)
  const html =`
  <div class = album>
  <div>${item.title} </div>
  <div class="review">
  <div class="star_rate"></div>
  <a class="link_to_songs" href="${getLocation2}/albums/${item.id}">収録曲</a>
  <a class="link_to_album_edit" href="${getLocation2}/albums/${item.id}/edit">アルバムの編集</a>
  </div> 
  </div>`;
  return html;
};


function post (){
  const submit = document.getElementById("submit2");
  submit.addEventListener('click',(e) => {
  e.preventDefault();
  const form = document.getElementById("form");
  const formData = new FormData(form);
  const XHR = new XMLHttpRequest();
  const getLocation = location.href;
  XHR.open("POST", `${getLocation}/albums`, true);
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

