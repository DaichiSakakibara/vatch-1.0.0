if (location.pathname.match("users")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("q_nickname_cont");
    inputElement.addEventListener("keyup", () => {
    const users = document.getElementById("q_nickname_cont").value;
    const XHR = new XMLHttpRequest();
     XHR.open("GET", `users/?@users=${users}`, true);
    XHR.responseType = "json";
    XHR.send();
     XHR.onload = () => {
       document.getElementById("users-search-form").submit();
       };
    });
  });
};