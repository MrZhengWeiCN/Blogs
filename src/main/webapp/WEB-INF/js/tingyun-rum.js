window._ty_rum&&window._ty_rum.server||function(t){function e(t){J&&(W.e[t]||(W.e[t]=[])).push(u())}function r(){var t=tt(it);return t||(t=nt(),et(it,t)),t}function n(){var t=a(ot);return t||(t=nt(),i(ot,t)),t}function a(t){if("string"!=typeof t)return null;var e=B.cookie;if(!e)return null;var r=null,n=e.split(";");return X.each(n,function(e){var n=e.split("=");if(X.trim(n[0])===X.trim(t))return r=n[1],!0}),r}function i(t,e,r){var n=t+"="+e;if(r){var a=new Date;a.setTime(a.getTime()+1e3*r),n+=";expires="+a.toGMTString()}B.cookie=n}function o(t){switch(typeof t){case"object":if(!t)return"null";if(t instanceof Array){for(var e="[",r=0;r<t.length;r++)e+=(r>0?",":"")+o(t[r]);return e+"]"}if(t instanceof Date)return t.getTime().toString();var e="{",r=0;for(var n in t)if("function"!=typeof t[n]){var a=o(t[n]);e+=(r>0?",":"")+o(n)+":"+a,r++}return e+"}";case"string":return'"'+t.replace(/([\"\\])/g,"\\$1").replace(/\n/g,"\\n")+'"';case"number":return t.toString();case"boolean":return t?"true":"false";case"function":return o(t.toString());case"undefined":default:return'"undefined"'}}function s(t){return z?z(t):t}function u(){return Date.now?Date.now():(new Date).valueOf()}function c(t,e,r){function n(){var t=X.args.apply(this,arguments);return e(i,t,r)}var a,i=t[t.length-1];if("function"==typeof i){switch(i.length){case 0:a=function(){return n.apply(this,arguments)};break;case 1:a=function(t){return n.apply(this,arguments)};break;case 2:a=function(t,e){return n.apply(this,arguments)};break;case 3:a=function(t,e,r){return n.apply(this,arguments)};break;case 4:a=function(t,e,r,a){return n.apply(this,arguments)};break;case 5:a=function(t,e,r,a,i){return n.apply(this,arguments)};break;default:for(var o=[],s=0,u=i.length;s<u;s++)o.push("_"+s);a=eval("(function(){return function("+o.join(",")+"){var args = [].slice.call(arguments, 0);return e(i, args, r);};})();")}t[t.length-1]=a}return t}function f(t,e){return t&&e&&(t.moduleName=e),t}function l(t,e,r){return function(){try{q=e,r&&d(e),t.apply(this,arguments),r&&p()}catch(n){throw r&&p(),f(n,e)}}}function d(e){X.each(["setTimeout","setInterval"],function(r){X.wrap(!0,t,r,function(t){return function(){var r,n=X.args.apply(this,arguments),a=n[0];return"function"==typeof a&&(r=l(a,e,!0)),r&&(n[0]=r),t.apply?t.apply(this,n):Function.prototype.apply.apply(t,[t,n])}})})}function p(){X.each(["setTimeout","setInterval"],function(e){X.unwrap(t,e)})}function h(t){H&&X.wrap(!1,H.prototype,"addEventListener",function(e){return function(){var r,n=X.args.apply(this,arguments),a=n[1];return"function"==typeof a&&(r=l(a,t,!0)),r&&(n[1]=r),e.apply(this,n)}}),d(t)}function v(){H&&X.unwrap(H.prototype,"addEventListener"),p()}function y(t){return function(t,e){}}function m(){return ft&&ft.indexOf("1")>-1}function g(){var t=0;if(G.firstPaint)t=G.firstPaint;else if(ct){var e=ct.timing;t=e.domLoading,ct.getEntriesByName&&X.each(B.querySelectorAll("head>link, head>script"),function(r){var n;if("LINK"==r.tagName?n=r.href:"SCRIPT"==r.tagName&&(r.defer||(n=r.src)),n){var a=ct.getEntriesByName(n);if(1==a.length){var i=a[0].responseEnd+e.navigationStart;i>t&&(t=i)}}}),t-=e.navigationStart,G.firstPaint=Math.round(t)}return t}function _(){if(G.fs)return G.fs;G.firstPaint||g();var e=G.firstPaint,r=t.innerHeight;if(ct&&ct.getEntriesByName){var n=[];X.each(B.querySelectorAll("img"),function(t){"none"!=t.style.display&&""!=t.src&&t.offsetTop<=r&&n.push(t.src)}),X.each(n,function(t){var r=ct.getEntriesByName(t);if(r.length){var n=r[0].responseEnd;n>e&&(e=n)}})}return G.fs=Math.round(e),e}function S(){var t=ct.timing&&ct.timing.navigationStart||G.st,e=G.end_time-t;return G.dr=e,e}function w(){if(this.errors.length){var t=function(t){var e=[],r={};X.each(t,function(t){var e=N(t[1],t[2],t[3],t[6]);r[e]?r[e][4]+=1:r[e]=[t[1],t[2],t[3],"#"==t[4]?B.URL:t[4],1,t[5],t[6],t[7]]});for(var n in r)e.push(r[n]);return e}(this.errors),e=this;X.POST(X.mkurl(G.server.beacon,"err",{fu:U?U:U++,os:parseInt((u()-(F||G.st))/1e3)}),X.stringify({datas:t}),{},function(t,r){t||(e.errors=[])})}}function T(){e("DOMContentLoaded"),lt.initend()}function b(){"complete"===B.readyState&&(e("readyStateComplete"),lt.initend())}function E(t){function e(){lt.send()}return!!G.load_time||(lt.initend(),G.load_time=u(),J&&(W.load=G.load_time),void(9===t?e():setTimeout(e,0)))}function k(){dt||E(9),X.bind(w,lt)(),dt=1}function x(){lt.touch||(lt.touch=u())}function P(t){if(t[6]){var e=t[4],r=t[5];if(r&&"string"==typeof r&&e){r=r.split(/\n/);var n=$.exec(r[0]);n||(n=$.exec(r[1])),n&&n[1]!=e&&(t[4]=n[1]||e,t[2]=n[2]||t[2],t[3]=n[3]||t[3])}}}function N(t,e,r,n){return String(t)+String(e)+String(r)+String(n)}function L(e){var r=arguments,n="unknown",a=[u()];if(0!=r.length){if("string"==typeof e){var i=r.length<4?r.length:4;a[1]=r[0],i>2&&(a[2]=r[2],a[3]=0,a[4]=r[1]),i>3&&r[3]&&(a[3]=r[3])}else if(e instanceof Event||t.ErrorEvent&&e instanceof ErrorEvent){if(a[1]=e.message||(e.error&&e.error.constructor.name)+(e.error&&e.error.message)||"",a[2]=e.lineno?e.lineno:0,a[3]=e.colno?e.colno:0,a[4]=e.filename||e.error&&e.error.fileName||e.target&&e.target.baseURI||"",!a[4]&&Q)return;a[4]==B.URL&&(a[4]="#"),e.error?(a[5]=e.error.stack,a[6]=e.error.moduleName):(a[5]=null,a[6]=null);var o=N(a[1],a[2],a[3],a[6]);if(a[7]=pt[o]?0:1,pt[o]=!0,a[1]===n&&a[4]===n)return;P(a)}lt.errors.push(a)}}function R(t){return function(){var e=arguments;if(!this._ty_wrap){var r=X.args.apply(this,e);this._ty_rum={method:r[0],url:r[1],start:u()}}try{return t.apply(this,e)}catch(n){return Function.prototype.apply.call(t,this,e)}}}function C(e){return"string"==typeof e?e.length:t.ArrayBuffer&&e instanceof ArrayBuffer?e.byteLength:t.Blob&&e instanceof Blob?e.size:e&&e.length?e.length:0}function I(e){return function(){function r(t){var e,r,n=c._ty_rum;if(n){if(4!==n.readyState&&(n.end=u()),n.s=c.status,""==c.responseType||"text"==c.responseType)n.res=C(c.responseText);else if(c.response)n.res=C(c.response);else try{n.res=C(c.responseText)}catch(i){n.res=0}if(n.readyState=c.readyState,n.cb_time=l,e=[n.method+" "+n.url,n.s>0?n.end-n.start:0,l,n.s,n.s>0?0:t,n.res,n.req],n.r&&(r=a(c),r&&(r=r.xData)&&(e.push(r.id),e.push(r.action),e.push(r.time&&r.time.duration),e.push(r.time&&r.time.qu))),G.aa.push(e),G.server.custom_urls&&G.server.custom_urls.length&&!lt.ct){if(!G.pattern){G.pattern=[];for(var o=0;o<G.server.custom_urls.length;o++)G.pattern.push(new RegExp(G.server.custom_urls[o]))}for(var o=0;o<G.pattern.length;o++)if(n.url.match(G.pattern[o])){lt.ct=n.end+l;break}}lt.sa(),c._ty_rum=null}}function n(){4==c.readyState&&r(0)}function a(e){var r;if(e.getResponseHeader){var n=X.parseJSON(e.getResponseHeader("X-Tingyun-Tx-Data"));n&&n.r&&e._ty_rum&&n.r+""==e._ty_rum.r+""&&(r={name:e._ty_rum.url,xData:n},ct&&t._ty_rum.c_ra.push(r))}return r}function i(t){return function(){var e,r;4==c.readyState&&c._ty_rum&&(c._ty_rum.end=e=u(),c._ty_rum.readyState=4);try{q&&d(q),r=t.apply(this,arguments),q&&p()}catch(a){throw a=f(a,q),q&&p(),q=null,a}return 4==c.readyState&&(l=u()-e),n(),r}}function o(t){return function(){var e=c._ty_rum;return!e||("progress"==t||("abort"==t?r(905):"loadstart"==t?e.start=u():"error"==t?r(990):"timeout"==t&&r(903),!0))}}function s(t,e){e instanceof Array||(e=[e]);for(var r=0;r<e.length;r++){var n=e[r];X.sh(t,n,o(n),!1)}}if(!this._ty_wrap){this._ty_rum.start=u(),this._ty_rum.req=arguments[0]?C(arguments[0]):0;var c=this,l=0,h=X.wrap(!1,this,"onreadystatechange",i);h||X.sh(this,"readystatechange",n,!1),s(this,["error","progress","abort","load","loadstart","loadend","timeout"]),h||setTimeout(function(){X.wrap(!1,c,"onreadystatechange",i)},0)}var v=function(){function t(t){var e={},r=/^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?/.exec(t);return r&&(e.protocol=r[1]?r[1]+":":"http:",e.hostname=r[3],e.port=r[4]||""),e}return function(e){var r=location;if(e=X.trim(e)){if(e=e.toLowerCase(),e.startsWith("//")&&(e=r.protocol+e),!e.startsWith("http"))return!0;var n=t(e),a=n.protocol===r.protocol&&n.hostname===r.hostname;return a&&(a=n.port===r.port||!r.port&&("http:"===r.protocol&&"80"===n.port||"https:"===r.protocol&&"443"===n.port)),a}return!1}}(),y=arguments;try{var m=G.server;m&&m.id&&this._ty_rum&&v(this._ty_rum.url)&&(this._ty_rum.r=(new Date).getTime()%1e8,this.setRequestHeader&&this.setRequestHeader("X-Tingyun-Id",m.id+";r="+this._ty_rum.r))}catch(g){}try{return e.apply(this,y)}catch(_){return Function.prototype.apply.call(e,this,y)}}}function O(){var e="TINGYUN_DATA";if(G.agent)return G.agent;var r=a(e);if(r){try{r=r.replace(/^"/,"").replace(/"$/,""),r=G.agent=X.parseJSON(decodeURIComponent(r))}catch(n){}i(e,"",-1e3)}else r=t._ty_rum&&t._ty_rum.agent;return r}var q,D=t.XMLHttpRequest,B=document,M=Object.defineProperty,A=t.define,H=t.EventTarget,U=0,$=new RegExp("([a-z]+:/{2,3}.*):(\\d+):(\\d+)"),z=t.encodeURIComponent,F=null,X={wrap:function(t,e,r,n,a){try{var i=e[r]}catch(o){if(!t)return!1}if(!i&&!t)return!1;if(i&&i._ty_wrap)return!1;try{e[r]=n(i,a)}catch(o){return!1}return e[r]._ty_wrap=[i],!0},unwrap:function(t,e){try{var r=t[e]._ty_wrap;r&&(t[e]=r[0])}catch(n){}},each:function(t,e){if(t){var r;for(r=0;r<t.length&&(!t[r]||!e(t[r],r,t));r+=1);}},mkurl:function(t,e){var a=arguments,i=/^https/i.test(B.URL)?"https":"http";if(i=i+"://"+t+"/"+e+"?av=1.6.2&v=1.6.0&key="+s(G.server.key)+"&ref="+s(B.URL)+"&rand="+u()+"&pvid="+at+"&did="+s(r())+"&sid="+s(n()),"pf"!==e&&G&&(G.agent=O(),G.agent&&(G.agent.n&&(i+="&n="+s(G.agent.n)),G.agent.user_label&&(i+="&user_label="+s(G.agent.user_label)))),a.length>2){var o=a[2];for(var c in o)i+="&"+c+"="+o[c]}return j.host&&(i+="&cshst="+s(j.host)),j.url&&(i+="&csurl="+s(j.url)),i},GET:function(t,e){function r(){e&&e.apply(this,arguments),n.parentNode&&n.parentNode.removeChild(n)}if(navigator&&navigator.sendBeacon&&rt.test(t))return navigator.sendBeacon(t,null);var n=B.createElement("img");return n.setAttribute("src",t),n.setAttribute("style","display:none"),this.sh(n,"readystatechange",function(){"loaded"!=n.readyState&&4!=n.readyState||r("loaded")},!1),this.sh(n,"load",function(){return r("load"),!0},!1),this.sh(n,"error",function(){return r("error"),!0},!1),B.body.appendChild(n)},fpt:function(t,e,r){function n(t,e,r){var n=B.createElement(t);try{for(var a in e)n[a]=e[a]}catch(i){var o="<"+t;for(var a in e)o+=" "+a+'="'+e[a]+'"';o+=">",r||(o+="</"+t+">"),n=B.createElement(o)}return n}var a=n("div",{style:"display:none"},!1),i=n("iframe",{name:"_ty_rum_frm",width:0,height:0,style:"display:none"},!1),o=n("form",{style:"display:none",action:t,enctype:"application/x-www-form-urlencoded",method:"post",target:"_ty_rum_frm"},!1),s=n("input",{name:"data",type:"hidden"},!0);return s.value=e,o.appendChild(s),a.appendChild(i),a.appendChild(o),B.body.appendChild(a),o.submit(),i.onreadystatechange=function(){"complete"!==i.readyState&&4!==i.readyState||(r(null,i.innerHTML),B.body.removeChild(a))},!0},POST:function(e,r,n,a){if(this.ie)return this.fpt(e,r,a);if(navigator&&navigator.sendBeacon&&rt.test(e)){var i=navigator.sendBeacon(e,r);return a(!i),i}var o;if(t.XDomainRequest)return o=new XDomainRequest,o.open("POST",e),o.onload=function(){a(null,o.responseText)},this.sh(o,"load",function(){a(null,o.responseText)},!1),this.sh(o,"error",function(){a("POST("+e+")error")},!1),this.wrap(!0,o,"onerror",function(t){return function(){return a&&a("post error",o.responseText),!0}}),o.send(r),!0;if(!D)return!1;o=new D,o.overrideMimeType&&o.overrideMimeType("text/html");try{o._ty_wrap=1}catch(s){}var u=0;o.onreadystatechange=function(){4==o.readyState&&200==o.status&&(0==u&&a(null,o.responseText),u++)},o.onerror&&this.wrap(!0,o,"onerror",function(t){return function(){return a("post error",o.responseText),"function"!=typeof t||t.apply(this,arguments)}});try{o.open("POST",e,!0)}catch(s){return this.fpt(e,r,a)}for(var c in n)o.setRequestHeader(c,n[c]);return o.send(r),!0},sh:function(t,e,r,n){return t.addEventListener?t.addEventListener(e,r,n):!!t.attachEvent&&t.attachEvent("on"+e,r)},args:function(){for(var t=[],e=0;e<arguments.length;e++)t.push(arguments[e]);return t},stringify:o,parseJSON:function(e){if(e&&"string"==typeof e){var r=t.JSON?t.JSON.parse:function(t){return new Function("return "+t)()};return r(e)}return null},trim:V?function(t){return null==t?"":V.call(t)}:function(t){return null==t?"":t.toString().replace(/^\s+/,"").replace(/\s+$/,"")},extend:function(t,e){if(t&&e)for(var r in e)e.hasOwnProperty(r)&&(t[r]=e[r]);return t},bind:function(t,e){return function(){return t.apply(e,arguments)}}},j={},G=t._ty_rum=t.TINGYUN=X.extend({st:u(),ra:[],c_ra:[],aa:[],snd_du:function(){return this.server.adu?1e3*this.server.adu:1e4},cc:function(){return this.server.ac?this.server.ac:10},config:function(t,e){var r;if("object"==typeof t)r=t;else{if("string"!=typeof t||void 0===e)throw new Error("illegal arguments");r={},r[t]=e}for(var n in r)j[n]=r[n];return this},setUserLabel:function(t){t&&((this.agent||(this.agent={})).user_label="string"==typeof t?t:X.stringify(t))}},t._ty_rum||{});var ty_rum=G;ty_rum.server = {id:'wl4EtIR_7Is',ignore_err : true,beacon:'beacon.tingyun.com',beacon_err:'beacon-err.tingyun.com',key:'heTre0seWW0',trace_threshold:7000,fp_threshold:2000,fs_threshold:4000,dr_threshold:4000,custom_urls:[],sr:1.0};if(G.server&&!(G.server.sr&&Math.random()>=G.server.sr)){var J=!("debug"in G.server)||G.server.debug,W={start:G.st,e:{},an:{count:0},visible:[]};!function(){if(J){var t,e;"undefined"!=typeof B.hidden?(t="hidden",e="visibilitychange"):"undefined"!=typeof B.msHidden?(t="msHidden",e="msvisibilitychange"):"undefined"!=typeof B.webkitHidden&&(t="webkitHidden",e="webkitvisibilitychange"),"undefined"==typeof B.addEventListener||"undefined"==typeof B[t]||X.sh(B,e,function(){J&&W.visible.push([B[t],u()])})}}();var Y={fp_threshold:2e3,fs_threshold:4e3,dr_threshold:4e3},Z=X.extend(Y,G.server),K="ignore_err",Q=!(K in G.server)||G.server[K],V=String.prototype.trim;String.prototype.startsWith||(String.prototype.startsWith=function(t,e){return e=e||0,this.indexOf(t,e)===e});var tt,et,rt=/^http/i,nt=function(){function t(t){return t<0?NaN:t<=30?0|Math.random()*(1<<t):t<=53?(0|Math.random()*(1<<30))+(0|Math.random()*(1<<t-30))*(1<<30):NaN}function e(t,e){for(var r=t.toString(16),n=e-r.length,a="0";n>0;n>>>=1,a+=a)1&n&&(r=a+r);return r}return function(){return e(t(32),8)+"-"+e(t(16),4)+"-"+e(16384|t(12),4)+"-"+e(32768|t(14),4)+"-"+e(t(48),12)}}(),at=nt(),it="TY_DISTINCT_ID",ot="TY_SESSION_ID",st=function(){try{return localStorage.setItem(at,at),localStorage.removeItem(at),!0}catch(t){return!1}}();st?(tt=X.bind(localStorage.getItem,localStorage),et=X.bind(localStorage.setItem,localStorage)):(tt=a,et=i);try{M&&M(t,"define",{get:function(){return A},set:function(t){"function"==typeof t&&(t.amd||t.cmd)?(A=function(){var e=X.args.apply(this,arguments);if(3!==e.length)return t.apply(this,e);var r="string"==typeof e[0]?e[0]:"anonymous";return t.apply(this,c(e,function(t,e,r){var n;try{q=r,h(r),n=t.apply(this,e),v()}catch(a){throw v(),f(a,r)}return n},r))},X.extend(A,t)):A=t},configurable:!0})}catch(ut){}var ct=t.performance?t.performance:t.Performance;ct&&(X.sh(ct,"resourcetimingbufferfull",function(){var t=ct.getEntriesByType("resource");t&&(G.ra=G.ra.concat(t),ct.clearResourceTimings())},!1),X.sh(ct,"webkitresourcetimingbufferfull",function(){var t=ct.getEntriesByType("resource");t&&(G.ra=G.ra.concat(t),ct.webkitClearResourceTimings())},!1));for(var ft="",lt=G.metric={ready:function(){return G.load_time},initend:function(){function t(){lt.sa()}G.end_time||(G.end_time=u(),J&&(W.end=G.end_time),this._h=setInterval(t,2e3))},send:function(){function e(){function e(t){return n[t]>0?n[t]-a:0}var r={};if(ct&&ct.timing){var n=ct.timing;if(J){var i=W.t={};for(var o in n){var u=n[o];"function"!=typeof u&&(i[o]=u)}}a=n.navigationStart;var c=e("domainLookupStart"),f=e("domainLookupEnd"),l=e("redirectStart"),d=e("redirectEnd"),p=e("connectStart"),h=e("connectEnd");r={f:e("fetchStart"),qs:e("requestStart"),rs:e("responseStart"),re:e("responseEnd"),os:e("domContentLoadedEventStart"),oe:e("domContentLoadedEventEnd"),oi:e("domInteractive"),oc:e("domComplete"),ls:e("loadEventStart"),le:e("loadEventEnd"),tus:e("unloadEventStart"),tue:e("unloadEventEnd"),ressize:!0},h-p>0&&(r.cs=p,r.ce=h),f-c>0&&(r.ds=c,r.de=f),(d-l>0||d>0)&&(r.es=l,r.ee=d),0==r.le&&(r.ue=G.load_time-a);var v;if(n.msFirstPaint)v=n.msFirstPaint,J&&(W.fp="m_"+v);else if(t.chrome&&chrome.loadTimes){var y=chrome.loadTimes();y&&(y.firstPaintTime&&(v=1e3*y.firstPaintTime),J&&(W.fp="c_"+y.firstPaintTime))}else G.firstPaint&&(v=G.firstPaint,J&&(W.fp=G.firstPaint));v&&(r.fp=Math.round(v-a),G.firstPaint=r.fp),n.secureConnectionStart&&(r.sl=e("secureConnectionStart"))}else r={t:a,os:G.end_time-a,ls:G.load_time-a,ressize:!1};r.je=lt.errors.length,lt.ct&&(r.ct=lt.ct-a),lt.touch&&(r.fi=lt.touch-a);var m=O();return m&&(r.id=s(m.id),r.a=m.a,r.q=m.q,r.tid=s(m.tid),r.n=s(m.n)),r.sh=t.screen&&t.screen.height,r.sw=t.screen&&t.screen.width,r}function r(e){var r=t._ty_rum.c_ra;if(e)for(var n=r.length-1;n>=0;n--)if(e.indexOf(r[n].name)>-1)return r[n].xData;return null}function n(t){function e(t){return d[t]>0?d[t]:0}var n="1",i="0";if(ft+=g()>=Z.fp_threshold?n:i,ft+=_()>=Z.fs_threshold?n:i,ft+=S()>=Z.dr_threshold?n:i,ft+=t>=G.server.trace_threshold?n:i,!m())return null;var o=ct;if(o&&o.getEntriesByType){var u={tr:!0,tt:s(B.title),charset:B.characterSet},c=G.ra,f=o.getEntriesByType("resource");f&&(c=c.concat(f),o.clearResourceTimings?o.clearResourceTimings():o.webkitClearResourceTimings&&o.webkitClearResourceTimings()),u.res=[];for(var l=0;l<c.length;l++){var d=c[l],p={o:e("startTime"),rt:d.initiatorType,n:d.name,f:e("fetchStart"),ds:e("domainLookupStart"),de:e("domainLookupEnd"),cs:e("connectStart"),ce:e("connectEnd"),sl:e("secureConnectionStart"),qs:e("requestStart"),rs:e("responseStart"),re:e("responseEnd"),ts:d.transferSize||0,es:d.encodedBodySize||0},h=r(d.name);h&&(p.aid=h.id,p.atd=h.trId,p.an=h.action,p.aq=h.time&&h.time.qu,p.as=h.time&&h.time.duration),u.res.push(p)}if(lt.errors.length){u.err=[];for(var l=0,v=lt.errors,y=v.length;l<y;l++)u.err.push({o:Math.round(v[l][0]-a),e:v[l][1]&&v[l][1].replace(/([\"\\])/g,"\\$1").replace(/\n/g,"\\n"),l:v[l][2],c:v[l][3],r:v[l][4],ec:y,s:v[l][5],m:v[l][6],ep:v[l][7]})}return u}return null}if(this.sended)return!1;if(!this.ready())return!1;var a=G.st,i={};try{var o=e();i=n(o.ls>0?o.ls:G.load_time-a);var c={trflag:ft||"0000",fp:G.firstPaint,fs:G.fs,dr:G.dr};X.extend(o,c)}catch(f){}i?(J&&(i.debug=W),i=X.stringify(i)):i="",J=!1;var l=X.mkurl(G.server.beacon,"pf",o);F=u(),0!=i.length&&X.POST(l,i,{},y("POST"))||X.GET(l);var d=X.bind(w,this);return d(),setInterval(d,1e4),this.sended=!0,this.sa(1),!0},sa:function(t){(this.ready()||t)&&(t||(t=!this._last_send||u()-this._last_send>G.snd_du()||G.aa.length>=G.cc()),G.aa.length>0&&t&&(this._last_send=u(),X.POST(X.mkurl(G.server.beacon,"xhr"),X.stringify({xhr:G.aa}),{},y("POST")),G.aa=[]))},errors:[]},dt=null,pt={},ht=[["load",E],["beforeunload",k],["pagehide",k],["unload",k],["pageshow",function(){}]],vt=0;vt<ht.length;vt++){var yt=null;J&&(yt=function(t,r){return function(n){return e(t),r.apply(this,arguments)}}(ht[vt][0],ht[vt][1])),X.sh(t,ht[vt][0],yt||ht[vt][1],!1)}t.addEventListener?X.sh(t,"error",L,!1):t.onerror=function(t,e,r,n,a){if(e||!Q){var i=[u(),t,r,n,e==B.URL?"#":e],o=N(t,r,n,a&&a.moduleName);i=i.concat([a&&a.stack,a&&a.moduleName,pt[o]?0:1]),pt[o]=!0,P(i),lt.errors.push(i)}};for(var mt=[["scroll",x],["keypress",x],["click",x],["DOMContentLoaded",T],["readystatechange",b]],vt=0;vt<mt.length;vt++)X.sh(B,mt[vt][0],mt[vt][1],!1);if(X.wrap(!1,t,"requestAnimationFrame",function(e){return function(){var r=u();return J&&(W.an.count++,W.an.t=r),G.firstPaint=r,t.requestAnimationFrame=e,e.apply(this,arguments)}}),D)if(D.prototype)X.wrap(!1,D.prototype,"open",R),X.wrap(!1,D.prototype,"send",I);else{X.ie=7;var gt=D;t.XMLHttpRequest=function(){var t=new gt;return X.wrap(!1,t,"open",R),X.wrap(!1,t,"send",I),t}}else t.ActiveXObject&&(X.ie=6)}}(window);