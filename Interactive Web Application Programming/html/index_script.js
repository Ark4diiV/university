  var themeSwitchButton = document.getElementById("themeSwitcher");
  var beginButton = document.getElementById("beginButton");
  var throwButton = document.getElementById("throwButton");
  var body = document.querySelector("body");
  var header = document.querySelector("header");
  var nav = document.querySelector("nav");
  var main = document.querySelector("main");
  var section = document.querySelector("section");
  var aside = document.querySelector("aside");
  var footer = document.querySelector("footer");

  function themeSwitch(){
    var themeSwitchButton = document.getElementById("themeSwitcher");
    if(themeSwitchButton.innerText == "Dark theme"){
      switchToDark(themeSwitchButton);
      localStorage.setItem('theme', 'dark');
    } else{
      switchToLight(themeSwitchButton);
      localStorage.setItem('theme', 'light');
    }
  };

  function switchToDark(){
    body.style.backgroundColor = "#000000";
    header.style.backgroundImage = "url(img/panorama_dark.jpg)";
    header.style.boxShadow = '0 0 10px rgba(255,255,255,0.7)';
    nav.style.backgroundColor = "rgb(45,45,45)";
    nav.style.boxShadow = '0 0 10px rgba(255,255,255,0.5)';
    aside.style.boxShadow = '0 0 10px rgba(255,255,255,0.5)';

    footer.style.cssText = "color:#999999; \
      box-shadow:0 0 10px rgba(255,255,255,0.5); \
      background-color: rgb(45,45,45); \
    ";

    var navLinks = nav.getElementsByTagName('a');
    for(var i = 0 ; i < navLinks.length ; i++){
      navLinks[i].style.color = "#aaaaaa";
    }
    section.style.color = '#999999';
    section.style.boxShadow = "0 0 10px rgba(255,255,255,0.5)";

    themeSwitchButton.innerText = "Light theme";
    if(themeSwitchButton.classList.contains("lightButton")){
      themeSwitchButton.classList.remove("lightButton");
    }
    themeSwitchButton.classList.add("darkButton");
    themeSwitchButton.style.cssText = "color: rgb(210, 210, 210); \
      border: 1px solid rgba(255,255,255,0.1); \
      background: rgb(45,45,45) linear-gradient(#696969, #353535); \
    ";

    if(aside.querySelector('button') != null){
      if(throwButton.classList.contains("lightButton")){
        throwButton.classList.remove("lightButton");
        }
      throwButton.classList.add("darkButton");
      throwButton.style.cssText = "color: rgb(210, 210, 210); \
        border: 1px solid rgba(255,255,255,0.1); \
        background: rgb(45,45,45) linear-gradient(#696969, #353535); \
      ";
      };
  };

  function switchToLight(){
    body.style.backgroundColor = "#F8F8FF";
    header.style.backgroundImage = "url(img/panorama_light.jpg)";
    header.style.boxShadow = '0 0 10px rgba(0,0,0,0.5)';
    nav.style.backgroundColor = "rgb(250,250,250)";
    nav.style.boxShadow = '0 0 10px rgba(0,0,0,0.5)';
    aside.style.boxShadow = '0 0 10px rgba(0,0,0,0.5)';

    footer.style.cssText = "color:#000000; \
      box-shadow:0 0 10px rgba(0,0,0,0.5); \
      background-color: rgb(250,250,250); \
    ";

    var navLinks = nav.getElementsByTagName('a');
    for(var i = 0 ; i < navLinks.length ; i++){
      navLinks[i].style.color = "#000000";
    }
    section.style.color = '#222222';
    section.style.boxShadow = "0 0 10px rgba(0,0,0,0.5)";

    themeSwitchButton.innerText = "Dark theme";
    if(themeSwitchButton.classList.contains("darkButton")){
      themeSwitchButton.classList.remove("darkButton");
    }
    themeSwitchButton.classList.add("lightButton");
    themeSwitchButton.style.cssText = "color: rgb(68,68,68); \
    border: 1px solid rgba(0,0,0,0.1); \
    background: rgb(245,245,245) linear-gradient(#f4f4f4, #f1f1f1); \
    ";
    if(aside.querySelector('button') != null){
      if(throwButton.classList.contains("darkButton")){
        throwButton.classList.remove("darkButton");
      }
      throwButton.classList.add("lightButton");
      throwButton.style.cssText = "color: rgb(68,68,68); \
      border: 1px solid rgba(0,0,0,0.1); \
      background: rgb(245,245,245) linear-gradient(#f4f4f4, #f1f1f1); \
      ";
    };
  };
if(localStorage.getItem('theme') === 'dark'){
    switchToDark();
} else{
    switchToLight();
}


  themeSwitchButton.addEventListener("click", themeSwitch);
