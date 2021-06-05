const buildHTML = (XHR) => {
  const item = XHR.response.song;
  const getLocation2 = location.href;
  const html =`
  <div class = artist>
  <div>${item.title} </div>
  <div><a class="link_to_albums" href="${getLocation2}/songs/${item.id}">詳細</a></div>
  </div> `;
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