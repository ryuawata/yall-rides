import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const text = document.querySelector('#banner-typed-text')
  if (text) {
    new Typed(text, {
      strings: ["^700 Click to Rent, ^700 Drive to Escape...^700"],
      typeSpeed: 80,
      loop: true
    });
  }

}

export { loadDynamicBannerText };
