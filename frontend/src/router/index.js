import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Layout',
    component: () => import('../views/Layout.vue'),
    redirect: '/dashboard',
    children: [
      {
        path: 'dashboard',
        name: 'Dashboard',
        component: () => import('../views/Dashboard.vue'),
        meta: { title: '首页概览' }
      },
      {
        path: 'map',
        name: 'MapAnalysis',
        component: () => import('../views/MapAnalysis.vue'),
        meta: { title: '地图分析' }
      },
      {
        path: 'trend',
        name: 'TrendAnalysis',
        component: () => import('../views/TrendAnalysis.vue'),
        meta: { title: '趋势分析' }
      },
      {
        path: 'comparison',
        name: 'DiseaseComparison',
        component: () => import('../views/DiseaseComparison.vue'),
        meta: { title: '病种对比' }
      },
      {
        path: 'data',
        name: 'DataList',
        component: () => import('../views/DataList.vue'),
        meta: { title: '数据查询' }
      }
    ]
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
