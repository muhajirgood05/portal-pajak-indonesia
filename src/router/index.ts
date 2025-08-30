import { createRouter, createWebHistory } from 'vue-router'
import HalamanUtama from '../views/HalamanUtama.vue' // Impor komponen Anda
import MateriPanduanSubjek from '../views/materi/panduan-subjek-pajak.vue'
import PpnBarangMewah from '../views/materi/ppn-barang-mewah.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'utama',
      component: HalamanUtama // Arahkan ke HalamanUtama
    },
      {
        path: '/materi/panduan-subjek-pajak',
        name: 'materi-panduan-subjek-pajak',
        component: MateriPanduanSubjek
      },
      {
        path: '/materi/ppn-barang-mewah',
        name: 'materi-ppn-barang-mewah',
        component: PpnBarangMewah
      },
    // Anda bisa menambahkan rute lain di sini nanti
  ]
})

export default router

