import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const router = new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: function (resolve) {
        require(['@/components/Home'], resolve)
      }
    },
    {
      path: '/user/:userId',
      name: 'user',
      component: function (resolve) {
        require(['@/components/user/index'], resolve)
      },
      children: [
        {
          path: 'profile/:something',
          name: 'user-profile',
          component: function (resolve) {
            require(['@/components/user/Profile'], resolve)
          }
        },
        {
          path: 'posts',
          name: 'user-posts',
          component: function (resolve) {
            require(['@/components/user/Posts'], resolve)
          }
        },
        {
          path: 'settings',
          name: 'user-settings',
          component: function (resolve) {
            require(['@/components/user/Settings'], resolve)
          }
        }
      ]
    },
    {
      path: '/about',
      name: 'about',
      component: function (resolve) {
        require(['@/components/About'], resolve)
      }
    },
    {
      path: '/survey',
      name: 'survey',
      component: function (resolve) {
        require(['@/components/survey/Survey'], resolve)
      }
    },
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
    },
    {
      path: '*',
      name: 'nofound',
      component: function (resolve) {
        require(['@/components/404'], resolve)
      }
    }
  ]
})
// router.beforeEach((transition) => {
//   if (transition.to.path === '/forbidden') {
//     router.app.authenticating = true
//     setTimeout(() => {
//       router.app.authenticating = false
//       alert('this route is forbidden by a global before hook')
//       transition.abort()
//     }, 3000)
//   } else {
//     transition.next()
//   }
// })
export default router
