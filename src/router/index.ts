import { createRouter, createWebHistory } from 'vue-router'
import HalamanUtama from '../views/HalamanUtama.vue' // Impor komponen Anda

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'utama',
      component: HalamanUtama // Arahkan ke HalamanUtama
    },
    // Anda bisa menambahkan rute lain di sini nanti
  ]
})

export default router

