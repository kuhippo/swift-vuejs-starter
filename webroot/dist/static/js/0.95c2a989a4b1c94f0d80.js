webpackJsonp([0],{32:function(e,s,t){var a=t(7)(t(56),t(50),null,null,null);e.exports=a.exports},50:function(e,s){e.exports={render:function(){var e=this,s=e.$createElement,t=e._self._c||s;return t("div",{staticClass:"chat"},[t("h2",[e._v("Realtime chat")]),e._v(" "),t("h4",[e._v("(open it in another browser window)")]),e._v(" "),t("table",{staticStyle:{width:"100%","background-color":"#E8E8E8","margin-bottom":"20px"}},e._l(e.messages,function(s){return t("tr",[t("td",{staticClass:"label label-success"},[e._v(e._s(s.message))])])})),e._v(" "),t("form",[t("div",{staticClass:"form-group"},[t("label",{staticClass:"form-control-label",attrs:{for:"message-text"}},[e._v("Message:")]),e._v(" "),t("input",{directives:[{name:"model",rawName:"v-model",value:e.message,expression:"message"}],staticClass:"form-control",attrs:{type:"text",id:"message-text"},domProps:{value:e.message},on:{input:function(s){s.target.composing||(e.message=s.target.value)}}})]),e._v(" "),t("div",{staticClass:"form-group"},[t("button",{staticClass:"btn btn-primary",attrs:{disabled:!e.message||!e.author},on:{click:function(s){s.preventDefault(),e.postMessage(s)}}},[e._v("Post")])])])])},staticRenderFns:[]}},51:function(e,s,t){var a=t(52),n=a.JSON||(a.JSON={stringify:JSON.stringify});e.exports=function(e){return n.stringify.apply(n,arguments)}},52:function(e,s){var t=e.exports={version:"2.5.0"};"number"==typeof __e&&(__e=t)},53:function(e,s,t){e.exports={default:t(51),__esModule:!0}},56:function(e,s,t){"use strict";Object.defineProperty(s,"__esModule",{value:!0});var a=t(53),n=t.n(a);s.default={name:"chat",data:function(){return{author:"John",message:"Vue.js works great with Swift",messages:[],avatar:"",displayName:"",username:""}},components:{},mounted:function(){var e=this,s="";e.socket=new WebSocket("ws://127.0.0.1:8181/chat","chat"),e.socket.onopen=function(){e.promptUserInfo()},e.promptUserInfo=function(){for(;!this.displayName;)this.displayName=prompt("What do you want to be called?");s=this.displayName,e.start(s,this.avatar,this.displayName)},e.socket.onmessage=function(s){var t=JSON.parse(s.data),a=t.message,n=t.avatar;e.appendMessage(a,n,!1)}},methods:{start:function(e,s,t){var a=n()({email:e,avatar:s,displayName:t});this.socket.send(a),this.showChatWindow()},sendMessage:function(e){var s=n()({email:this.username,avatar:this.avatar,displayName:this.displayName,message:e});this.socket.send(s)},appendMessage:function(e,s,t){if(!t){var a={message:e};this.messages.push(a)}},showChatWindow:function(){console.log("1")},postMessage:function(){var e=this.message;this.appendMessage(e,"Self",!0),this.sendMessage(e)}}}}});
//# sourceMappingURL=0.95c2a989a4b1c94f0d80.js.map