!function(){"use strict";window.webEventTrack=class{constructor(){if(this.win="",this.selfClose=!1,this.url=decodeURIComponent(window.location.href),this.documentDomainName=this.url.substr(this.keyLocation).split("=")[0].includes("_resulticksFormId")?document.domain:"resulticks.com",this.formFlag=this.url.substr(this.keyLocation).split("=")[0].includes("_resulticksFormId"),this.urlParam=e=>{var t=new RegExp("[?&]"+e+"=([^&#]*)").exec(window.location.href);return null==t?null:decodeURI(t[1])||0},-1!=this.url.indexOf("?_resulticksFormId")&&sessionStorage.setItem("resulticksBrandOwnForm",!0),this.keyLocation=-1!=this.url.indexOf("?_resulticksFormId")?this.url.indexOf("?_resulticksFormId"):-1!=this.url.indexOf("?_resulticksId")?this.url.indexOf("?_resulticksId"):null,this.url.includes("?_resulticksId")||this.url.includes("?_resulticksFormId")||window.ReWebSDK.utils.SSH.getItem("setEventTrackMode")){window.ReWebSDK.utils.SSH.setItem("setEventTrackMode",!0),this.socket,this.campaignId=window.ReWebSDK.utils.SSH.getItem("setEventTrackCampingId")||this.urlParam("_resulticksId"),-1!=this.url.indexOf("?_resulticksFormId")&&(this.campaignId=window.ReWebSDK.utils.SSH.getItem("setEventTrackCampingId")||this.urlParam("_resulticksFormId"));try{!function(e){if(""===e||""===e.trim())return!1;try{return btoa(atob(e))==e}catch(e){return!1}}(this.campaignId)?this.campaignId=this.campaignId:this.campaignId=atob(this.campaignId)}catch(e){this.campaignId=this.campaignId}window.ReWebSDK.utils.SSH.setItem("setEventTrackCampingId",this.campaignId),this.resJS=document.createElement("SCRIPT"),this.resJS.setAttribute("src","https://html2canvas.hertzen.com/dist/html2canvas.min.js"),this.resJS.setAttribute("type","text/javascript"),this.resJS.setAttribute("async","true"),this.resJS1=document.createElement("SCRIPT"),this.resJS1.setAttribute("src","https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.4/socket.io.js"),this.resJS1.setAttribute("type","text/javascript"),this.resJS1.setAttribute("defer","true"),this.resJS.onload=()=>{},this.resJS1.onload=()=>{this.setFieldTrack()},document.body.appendChild(this.resJS),document.body.appendChild(this.resJS1)}}setFieldTrack(){this.clientSocketConnection(this.campaignId);var e=document.createElement("BUTTON");e.innerHTML="Set Event",e.setAttribute("id","setevent"),e.setAttribute("style","top:5px;right:10px;position: absolute;");var t=document.createElement("div");t.innerHTML="<span style='color:#fff;'> Browse to set the events...</span>",t.appendChild(e),t.setAttribute("id","webtrackheader"),t.setAttribute("style","height:35px;background-color:#0f1d8d;padding: 9px;position:fixed;width:100%;z-index:10000;"),document.body.innerHTML=t.outerHTML+document.body.innerHTML;var i=document.getElementById("setevent");i&&(i.onclick=()=>{window.ReWebSDK.utils.SSH.removeItem("setEventTrackMode");let e="";e=this.url.substr(this.keyLocation).split("=")[0].includes("_resulticksFormId")?"/Recipients/BrandOwnFormFieldTrack?_resulticksFormId="+btoa(this.campaignId)+"&domainName="+document.domain:"/Campaign/FieldTrack?id="+btoa(this.campaignId)+"|"+btoa("new");let t=new URL(sessionStorage.getItem("documentReferrer")||"https://resulticks.team").origin+e;console.log("_url",t),this.win=window.open(t,"_blank"),this.win.addEventListener("load",console.log("pageLoaded"),this.sendData(),!0)})}clientSocketConnection(e){this.socket=io("https://mobsoc.resu.io/"),this.socket.on("connect",(()=>{this.socket.emit("new_user",{userName:"sdk",domainName:this.documentDomainName,appId:parseInt(window.ReWebSDK.utils.SSH.getItem("setEventTrackCampingId"))})})),this.socket.on("closed",(()=>{this.selfClose=!0,sessionStorage.getItem("resulticksBrandOwnForm"),window.close()})),window.addEventListener("beforeunload",(()=>{this.selfClose||this.socket.emit("close",{userName:"sdk",domainName:this.documentDomainName,appId:parseInt(window.ReWebSDK.utils.SSH.getItem("setEventTrackCampingId")),status:!1})}))}sendData(){var e=document.documentElement.outerHTML;e=e.replace(new RegExp("socket.emit","g"),"//socket.emit");var t=new Object;t.userName="WebContentSender",t.url=window.location.href.includes(this.url.substr(this.keyLocation).split("=")[0])?window.location.href:window.location.href+this.url.substr(this.keyLocation).split("=")[0]+"="+window.ReWebSDK.utils.SSH.getItem("setEventTrackCampingId"),t.appId=this.CampaignId,t.isMobile="web",t.screenName=window.document.title,t.Height=window.document.defaultView.getComputedStyle(window.document.body,"").getPropertyValue("height"),t.Width=window.document.defaultView.getComputedStyle(window.document.body,"").getPropertyValue("width"),document.getElementById("setevent").style.display="none",html2canvas(document.querySelector("body")).then((e=>{var i=e.toDataURL("image/jpeg",.5);t.PageContentJson=this.getInnercontent(),document.getElementById("setevent").style.display="block";let s=this.formFlag?{receiverInfo:t}:t,n=this.formFlag?{image:i}:{PageScreenShot:i};s={...s,...n};const o={userName:"sdk",domainName:this.documentDomainName,appId:parseInt(window.ReWebSDK.utils.SSH.getItem("setEventTrackCampingId")),data:s,screenName:window.name,url:location.href,pageURL:window.location.href};this.socket.emit("data_post",o);const r=setTimeout((()=>{this.sendData(),clearTimeout(r)}),5e3)}))}getInnercontent(){var e=[];return document.querySelectorAll("input,button,select,textarea").forEach((t=>{e.push(this.getAtributes({},[],t))})),document.querySelectorAll("video,audio,a,object,embed,iframe").forEach((t=>{(t.src||t.href||t.data)&&e.push({tagurl:t.src||t.href||t.data,...this.getAtributes({},[],t)})})),e}getAtributes(e={},t,i){let s={};var n=function(e){const t=e.getBoundingClientRect();return{left:t.left+window.pageXOffset,top:t.top+window.pageYOffset}}(i);try{s.left=n.left,s.top=n.top,s.height=parseInt(document.defaultView.getComputedStyle(i,"").getPropertyValue("height"))||0,s.width=parseInt(document.defaultView.getComputedStyle(i,"").getPropertyValue("width"))||0,s.viewid=i.getAttribute("id")||"",s.viewname=i.getAttribute("name")||"",s.tagname=i.tagName||"",s.tagtype=i.getAttribute("type")||"",s.placeholder=i.getAttribute("placeholder")||"",s.required=""==i.getAttribute("required")||"true"==i.getAttribute("required")||"required"==i.getAttribute("required")}catch(e){s.err=e}return s}secondsTimeSpanToHMS(e){var t=Math.floor(e/3600);e-=3600*t;var i=Math.floor(e/60);return t+":"+(i<10?"0"+i:i)+":"+((e-=60*i)<10?"0"+e:e)}}}();
