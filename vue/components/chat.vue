<template>
  <div class="chat">
    <h2>Realtime chat</h2>
    <h4>(open it in another browser window)</h4>

    <table style="width: 100%;background-color:#E8E8E8;margin-bottom:20px">
      <tr v-for=" m in messages">
        <td class="label label-success" >{{ m.message }}</td>
      </tr>
    </table>
    <form>
      <div class="form-group">
        <label for="message-text" class="form-control-label">Message:</label>
        <input type="text" class="form-control" id="message-text" v-model="message" />
      </div>
      <div class="form-group">
        <button class="btn btn-primary" :disabled="!message || !author" @click.prevent="postMessage">Post</button>
      </div>
    </form>
  </div>
</template>
<script>
export default {
  name: 'chat',
  data () {
    return {
      author: 'John',
      message: 'Vue.js works great with Swift',
      messages: [],
      avatar: '',
      displayName: '',
      username: ''
    }
  },
  components: {},
  mounted: function () {
    // var hostname = window.location.host
    var chat = this
    var username = ''
    chat.socket = new WebSocket('ws://' + '127.0.0.1:8181/chat', 'chat')
    chat.socket.onopen = function () {
      chat.promptUserInfo()
    }
    chat.promptUserInfo = function () {
      while (!this.displayName) {
        this.displayName = prompt('What do you want to be called?')
      }
      username = this.displayName

      chat.start(username, this.avatar, this.displayName)
    }
    chat.socket.onmessage = function (received) {
      var jsonAry = JSON.parse(received.data)
      var message = jsonAry['message']
      var avatar = jsonAry['avatar']
      var selfSent = false
      chat.appendMessage(message, avatar, selfSent)
    }
  },
  methods: {
    start: function (email, avatarImageURI, name) {
      var json = JSON.stringify({ email, 'avatar': avatarImageURI, 'displayName': name })
      this.socket.send(json)
      this.showChatWindow()
    },
    sendMessage: function (message) {
      var json = JSON.stringify({ 'email': this.username, 'avatar': this.avatar, 'displayName': this.displayName, message })
      this.socket.send(json)
    },
    appendMessage: function (message, avatar, selfSent) {
      if (!selfSent) {
        var dic = {message}
        this.messages.push(dic)
      }
    },
    showChatWindow: function () {
      console.log('1')
    },
    postMessage: function () {
      var text = this.message
      this.appendMessage(text, 'Self', true)
      this.sendMessage(text)
    }
  }
}
</script>
