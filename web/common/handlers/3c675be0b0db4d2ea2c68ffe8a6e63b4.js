!function(){"use strict";function e(){window.ReWebSDK={},window._currentTenant={"tenantName":"MyTVS","tenantId":"3c675be0-b0db-4d2e-a2c6-8ffe8a6e63b4","_tenantId":"3c675be0_b0db_4d2e_a2c6_8ffe8a6e63b4","ga_id":101174568,"shortCode":"oWS"},location.origin.includes("joann")&&(window._currentTenant={tenantName:"Joann",tenantId:"6da5fc51-c42d-4616-9f68-b80a2f37f335",_tenantId:"6da5fc51_c42d_4616_9f68_b80a2f37f335",ga_id:101181631,shortCode:"Pym"}),"00b4e220_6121_4a93_a63f_d0848bd73506"==window._currentTenant._tenantId&&(window.ReWebSDKConfig={custombase:"https://sdk.hdfcbk.io"}),window.ReWebSDK.build={release:"2023-05-18T09:29:40.784Z",version:72.4},window.ReWebSDK.pushConfig={"apiKey":"AIzaSyB68Lm2W_htXh9EG-H9xAiO2G_X7UUHIek","authDomain":"mytvs-website.firebaseapp.com","projectId":"mytvs-website","storageBucket":"mytvs-website.appspot.com","messagingSenderId":"639785801369","appId":"1:639785801369:web:9de6a34b5ea1c36c690a08"},window.ReWebSDK.pushHeaderKey="AAAAlPY0lpk:APA91bHev-Yal4PIL9QJ63veqovTbsyCKXSkrmV748MOF8d7q8WuKN-GKFeMhX3EI6DejNrLP3ujLbRNtNHqT6RkjkSCnQdFcJC4Fb7ud_euIddx9Y6tk4gdP-7O1SCuCEdOLaedJljb",window.ReWebSDK.serviceWorkerFile="firebase-messaging-sw.js";try{window.ReWebSDK.backups={push:JSON.stringify({pushConfig:window.ReWebSDK.pushConfig,pushHeaderKey:window.ReWebSDK.pushHeaderKey,serviceWorkerFile:window.ReWebSDK.serviceWorkerFile})}}catch(e){}function e(){try{function e(e,o){return e.match(o)?e.match(o)[2]:null}const o=navigator.userAgent;let t="unkown";switch(t=/chrome|crios/i.test(o)&&!/opr|opera|chromium|edg|ucbrowser|googlebot/i.test(o)?"Chrome":t,t=/safari/i.test(o)&&!/chromium|edg|ucbrowser|chrome|crios|opr|opera|fxios|firefox/i.test(o)?"Safari":t,t=/chromium/i.test(o)?"Chromium":t,t=/firefox|fxios/i.test(o)&&!/seamonkey/i.test(o)?"Mozilla Firefox":t,t=/edg/i.test(o)?"Edge":t,t=/googlebot/i.test(o)?"GoogleBot":t,t=/opr|opera/i.test(o)?"Opera":t,t=/ucbrowser/i.test(o)?"UCBrowser":t,t=/; msie|trident/i.test(o)&&!/ucbrowser/i.test(o)?"IE":t,t=window.navigator.brave&&window.navigator.brave.isBrave.name&&"isBrave"==window.navigator.brave.isBrave.name?"Brave":t,t){case"UCBrowser":case"UCBrowser":return t+"/"+e(o,/(ucbrowser)\/([\d\.]+)/i);case"Edge":return t+"/"+e(o,/(edge|edga|edgios|edg)\/([\d\.]+)/i);case"GoogleBot":return t+"/"+e(o,/(googlebot)\/([\d\.]+)/i);case"Chromium":return t+"/"+e(o,/(chromium)\/([\d\.]+)/i);case"Mozilla Firefox":return t+"/"+e(o,/(firefox|fxios)\/([\d\.]+)/i);case"Chrome":return t+"/"+e(o,/(chrome|crios)\/([\d\.]+)/i);case"Safari":return t+"/"+e(o,/(safari)\/([\d\.]+)/i);case"Opera":return t+"/"+e(o,/(opera|opr)\/([\d\.]+)/i);case"IE":const r=e(o,/(trident)\/([\d\.]+)/i);return r?t+"/"+parseFloat(r)+4:t+"/7.0";case"Brave":return t+"/"+e(o,/(chrome|crios)\/([\d\.]+)/i);default:return"unknown/0.0.0.0"}}catch(e){return console.log("SDK:: Error on getting browserType: ",e),"unknown/0.0.0.0"}}function o(e){sessionStorage.getItem("Resul_initedAt")||(sessionStorage.setItem("Resul_initedAt",(new Date).getTime()),sessionStorage.setItem("Resul_initedDateAt",new Date((new Date).toUTCString()).toISOString())),sessionStorage.setItem("Resul_pageinitedAt",(new Date).getTime()),"tenant"in e&&(window._currentTenant=e.tenant);e.custombase?console.log("custom base from resulconfig"):["vwe","owO","IDq","rnd","RNr","p48","dVZ","hJG","OlS","n0w","Ydy"].includes(window._currentTenant.shortCode)?e.custombase="https://sdk.rsut.io":["hUe"].includes(window._currentTenant.shortCode)?e.custombase="https://sdk.hdfcbk.io":e.custombase="https://sdk.resu.io",window.ReWebSDK.configs=e;let o="";try{try{o=e.customFileBase||e.custombase||new URL(document.querySelector('[src^="https://sdk.r"][defer="defer"]').src).origin||new URL(document.querySelector('[src^="https://sdk.tngr"][defer="defer"]').src).origin}catch(t){o=e.customFileBase||e.custombase||"https://sdk.resu.io"}}catch(e){o="https://sdk.resu.io"}try{let t=document.createElement("script");t.src=o+"/common/scripts/app.js?v="+window.ReWebSDK.build.version,t.type="text/javascript",t.onload=function(){window.sdk?sessionStorage.getItem("clientIProtocol")?new sdk(Object.assign(e,{ipaddress:sessionStorage.getItem("clientIProtocol")})):fetch(o+"/Campaign/getclientip").then((function(e){return e.json()})).then((function(o){new sdk(Object.assign(e,o)),sessionStorage.setItem("clientIProtocol",o.ipaddress)})).catch((o=>{new sdk(Object.assign(e,{ipaddress:sessionStorage.getItem("clientIProtocol")}))})):console.log("%c SDK:: Not loaded!","color: #0540d3; font-family:sans-serif; ")},t.onerror=function(e){window.ReWebSDK.onerror(e)},document.head.appendChild(t)}catch(e){window.ReWebSDK.onerror(e)}}function t(){if("IE"==window.ReWebSDK.utils.browserName&&"unknown"==window.ReWebSDK.utils.browserName||"function"!=typeof window.fetch)console.warn("SDK:: Not supported in "+window.ReWebSDK.utils.browserName+" browser");else try{var e=new RegExp("(googlebot/|bot|Googlebot-Mobile|Googlebot-Image|Google favicon|Mediapartners-Google|bingbot|slurp|java|wget|curl|Commons-HttpClient|Python-urllib|libwww|httpunit|nutch|phpcrawl|msnbot|jyxobot|FAST-WebCrawler|FAST Enterprise Crawler|biglotron|teoma|convera|seekbot|gigablast|exabot|ngbot|ia_archiver|GingerCrawler|webmon |httrack|webcrawler|grub.org|UsineNouvelleCrawler|antibot|netresearchserver|speedy|fluffy|bibnum.bnf|findlink|msrbot|panscient|yacybot|AISearchBot|IOI|ips-agent|tagoobot|MJ12bot|dotbot|woriobot|yanga|buzzbot|mlbot|yandexbot|purebot|Linguee Bot|Voyager|CyberPatrol|voilabot|baiduspider|citeseerxbot|spbot|twengabot|postrank|turnitinbot|scribdbot|page2rss|sitebot|linkdex|Adidxbot|blekkobot|ezooms|dotbot|Mail.RU_Bot|discobot|heritrix|findthatfile|europarchive.org|NerdByNature.Bot|sistrix crawler|ahrefsbot|Aboundex|domaincrawler|wbsearchbot|summify|ccbot|edisterbot|seznambot|ec2linkfinder|gslfbot|aihitbot|intelium_bot|facebookexternalhit|yeti|RetrevoPageAnalyzer|lb-spider|sogou|lssbot|careerbot|wotbox|wocbot|ichiro|DuckDuckBot|lssrocketcrawler|drupact|webcompanycrawler|acoonbot|openindexspider|gnam gnam spider|web-archive-net.com.bot|backlinkcrawler|coccoc|integromedb|content crawler spider|toplistbot|seokicks-robot|it2media-domain-crawler|ip-web-crawler.com|siteexplorer.info|elisabot|proximic|changedetection|blexbot|arabot|WeSEE:Search|niki-bot|CrystalSemanticsBot|rogerbot|360Spider|psbot|InterfaxScanBot|Lipperhey SEO Service|CC Metadata Scaper|g00g1e.net|GrapeshotCrawler|urlappendbot|brainobot|fr-crawler|binlar|SimpleCrawler|Livelapbot|Twitterbot|cXensebot|smtbot|bnf.fr_bot|A6-Indexer|ADmantX|Facebot|Twitterbot|OrangeBot|memorybot|AdvBot|MegaIndex|SemanticScholarBot|ltx71|nerdybot|xovibot|BUbiNG|Qwantify|archive.org_bot|Applebot|TweetmemeBot|crawler4j|findxbot|SemrushBot|yoozBot|lipperhey|y!j-asr|Domain Re-Animator Bot|AddThis|favicon|FAST|spider|SEO|Domain|Bot)","i"),t=navigator.userAgent;if(e.test(t))console.error("SDK:: Initialization not allowed!");else document.querySelector("[ResulConfig]")||null?fetch(document.querySelector("[ResulConfig]").getAttribute("ResulConfig")).then((function(e){return e.ok?e.json():new Error("Something went wrong")})).then((function(e){o(e)})).catch((function(e){console.log("SDK:: Unable to load configFile: ",e),console.log("SDK:: loading default params"),o(window.ReWebSDKConfig||{})})):o(window.ReWebSDKConfig||{})}catch(e){console.log("SDK:: Unable to Initialize SDK :",e)}}window._resMethods={},window.ReWebSDK.methods={},window.ReWebSDK.userRegister_payloadDefault={},window.ReWebSDK.configs={},window.ReWebSDK.utils={},window.ReWebSDK.onerror=function(e){console.log("SDK:: error: ",e)},window.ReWebSDK.utils={browserName:e().split("/")[0],browserVersion:parseInt(e().split("/")[1])},"00b4e220_6121_4a93_a63f_d0848bd73506"==window._currentTenant._tenantId?(console.log("SDK:: checking access to execute "),"https://applyonline.hdfcbank.com"==location.origin&&t()):t()}try{"function"==typeof requirejs?(console.log("%c SDK:: Found requirejs!","color: #0540d3; font-family:sans-serif; "),window.addEventListener("load",(function(){console.log("%c SDK:: Preparing!","color: #0540d3; font-family:sans-serif; "),setTimeout((function(){console.log("%c SDK:: Loading!","color: #0540d3; font-family:sans-serif; "),e()}),2500)}))):e()}catch(e){console.log("SDK:: Loading Error: ",e)}}();