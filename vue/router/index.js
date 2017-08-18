import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: function (resolve) {
        require(['@/components/Home'], resolve)
      }
    },
    // {
    //   path: '/user/:userId',
    //   name: 'user',
    //   component: function (resolve) {
    //     require(['@/components/Register'], resolve)
    //   }
    // },
    {
      path: '/about',
      name: 'about',
      component: function (resolve) {
        require(['@/components/About'], resolve)
      }
    },
    // {
    //   path: '/survey',
    //   name: 'survey',
    //   component: function (resolve) {
    //     require(['@/components/Register'], resolve)
    //   }
    // },
    {
      path: '/chat',
      name: 'chat',
      component: function (resolve) {
        require(['@/components/Chat'], resolve)
      }
    },
    {
      path: '/hello',
      name: 'hello',
      component: function (resolve) {
        require(['@/components/Hello'], resolve)
      }
    }
  ]
})
