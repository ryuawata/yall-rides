import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["^700 Click to Rent, ^700 Drive to Escape...^700"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
