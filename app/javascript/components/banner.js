import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Sou alérgico a...", "E a pipoca?", "Comida!", ],
    typeSpeed: 70,
    loop: true,

  });
}

export { loadDynamicBannerText };


