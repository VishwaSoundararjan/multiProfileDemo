!function(){"use strict";window.visionretailModule={init:function(){console.log("vision retail Executed!");const e=document.querySelector('meta[name="ProductCategory"]')?.content,t=document.querySelector('meta[name="Section"]')?.content;if(e&&(e!==window.ReWebSDK.utils.LSH.getItem("productCategory")&&(window.ReWebSDK.utils.LSH.setItem("productCategory",e),t&&null!=t&&""!=t&&"undefined"!=t&&window.ReWebSDK.utils.LSH.setItem("section",t)),window.addEventListener("DOMContentLoaded",(function(){window.ReWebSDK.utils.LSH.setItem("productCategory",e),t&&null!=t&&""!=t&&"undefined"!=t&&window.ReWebSDK.utils.LSH.setItem("section",t)})),window.addEventListener("sdk_ready",(()=>{window.ReWebSDK.utils.LSH.setItem("productCategory",e),t&&null!=t&&""!=t&&"undefined"!=t&&window.ReWebSDK.utils.LSH.setItem("section",t)}))),"/apparel.html"==location.pathname||"/mobile-product.html"==location.pathname||"/computerproducts.html"==location.pathname||"/homeappliances.html"==location.pathname||"/bike-products.html"==location.pathname){const e=`/${window.ReWebSDK.utils.LSH.getItem("productCategory")||"default"}/${window.ReWebSDK.utils.LSH.getItem("section")||"default"}.jpg`;document.querySelector("#swiper-unique-id-1 .swiper-slide .banner-shortcode").innerHTML=`\n            <div class="background" style="background-image: url(${e});"></div>`}}}}();