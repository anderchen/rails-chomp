import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["I am alergic to water", "I don't eat popcorn", "I Love food!", ],
    typeSpeed: 40,
    loop: true,

  });
}

export { loadDynamicBannerText };

$(document).ready(function(){
  $(".category-choice").click(function(){
    $(this).toggleClass("active");
  });
});

