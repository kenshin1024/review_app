const buildHTML = (XHR) => {
  const item = XHR.response.album;
  const getLocation2 = location.href;
  const getArtistId2 = getLocation2.replace("http://localhost:3000/artists/", "");
  const html =`
  <div class = artist>
  <div>${item.title} </div>
  <div><a class="link_to_albums" href="/artists/${getArtistId2}/albums/${item.id}">詳細・収録曲</a></div>
  </div> `;
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
  const getArtistId = getLocation.replace("http://localhost:3000/artists/", "");
  console.log(getArtistId)
  XHR.open("POST", `/artists/${getArtistId}/albums`, true);
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

